<template>
  <div class="my-layout">
    <el-card class="mt8" shadow="never" :body-style="{ paddingBottom: '0' }">
      <el-form :inline="true" @submit.stop.prevent>
        <el-form-item label="部门名称">
          <el-input v-model="state.filter.name" placeholder="部门名称" @keyup.enter="onQuery" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="ele-Search" @click="onQuery"> 查询 </el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card class="my-fill mt8" shadow="never">
      <el-row class="mb-4">
        <el-button v-auth="pubDeptAccess.REMOVE" type="primary" icon="ele-Plus" @click="onAdd" size="small"> 新增
        </el-button>
      </el-row>
      <el-table :data="state.deptTreeData" style="width: 100%" v-loading="state.loading" row-key="deptCode"
        default-expand-all :tree-props="{ children: 'children', hasChildren: 'hasChildren' }">
        <!-- <el-table-column prop="deptCode" label="部门编号" min-width="120" show-overflow-tooltip /> -->
        <el-table-column prop="deptName" label="部门名称" min-width="160" show-overflow-tooltip />
        <el-table-column prop="deptCode" label="部门编号" min-width="80" show-overflow-tooltip />
        <el-table-column prop="lmdt" label="编辑时间" min-width="80" show-overflow-tooltip />
        <el-table-column prop="lmid" label="编辑人" min-width="80" show-overflow-tooltip />
        <el-table-column label="操作" width="160" fixed="right" header-align="center" align="center">
          <template #default="{ row }">
            <el-button v-if="auth(pubDeptAccess.EDIT) && row.parentCode != 0" icon="ele-EditPen" size="small" text
              type="primary" @click="onEdit(row)">编辑</el-button>
            <el-button v-if="auth(pubDeptAccess.REMOVE) && row.parentCode != 0" icon="ele-Delete" size="small" text
              type="danger" @click="onDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <edit ref="editRef" :title="state.edit.title" :dept-tree-data="state.deptTreeData"></edit>
  </div>
</template>
  
<script lang="ts" setup name="/baseSet/user">
import { ref, reactive, onMounted, getCurrentInstance, onBeforeMount, defineAsyncComponent } from 'vue'
import { PubDepartment } from '/@/api/admin/gen/data-contracts'
import { PubDeptApi } from '/@/api/admin/gen/PubDept'
import { listToTree, filterTree } from '/@/utils/tree'
import eventBus from '/@/utils/mitt'
import { auth } from '/@/utils/authFunction'
import { pubDept as pubDeptAccess } from '/@/access/pubDept'

// 引入组件
const edit = defineAsyncComponent(() => import('./edit.vue'))

const { proxy } = getCurrentInstance() as any

const editRef = ref()

const state = reactive({
  loading: false,
  //edit.title: '',
  filter: {
    name: '',
  },
  deptTreeData: [] as Array<PubDepartment>,
  edit: {
    //isEdit: false,
    //row:{} as any,
    title: '新增'
  }
})

onMounted(() => {
  onQuery()
  eventBus.off('refreshList')
  eventBus.on('refreshList', () => {
    onQuery()
  })
})

onBeforeMount(() => {
  eventBus.off('refreshList')
})

const onQuery = async () => {
  state.loading = true
  const res = await new PubDeptApi().getList().catch(() => {
    state.loading = false
  })
  if (res && res.data && res.data.length > 0) {
    state.deptTreeData = filterTree(listToTree(res.data,
      {
        rootWhere: (parent: any, self: any) => {
          return self.parentCode == 0
        },
        childsWhere: (parent: any, self: any) => {
          return parent.deptCode === self.parentCode
        },
      }), state.filter.name, {
      filterWhere: (item: any, word: string) => {
        return item.deptName?.toLocaleLowerCase().indexOf(word) > -1
      }
    })
  } else {
    state.deptTreeData = []
  }
  state.loading = false
}

const onAdd = () => {
  state.edit.title = '新增部门'
  editRef.value.open()
}

const onEdit = (row: PubDepartment) => {
  state.edit.title = '编辑部门'
  editRef.value.open(row)
}

const onDelete = (row: PubDepartment) => {
  proxy.$modal
    .confirmDelete(`确定要删除部门【${row.deptName}】?`)
    .then(async () => {
      await new PubDeptApi().delete(row.deptCode as string, { loading: true })
      onQuery()
    })
    .catch(() => { })
}
</script>
  
<style scoped lang="scss"></style>
  