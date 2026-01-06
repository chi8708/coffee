<template>
  <div class="my-layout">
    <el-card class="mt8" shadow="never" :body-style="{ paddingBottom: '0' }">
      <el-form :inline="true" @submit.stop.prevent>
        <el-form-item label="权限名称">
          <el-input v-model="state.filter.name" placeholder="权限名称" @keyup.enter="onQuery" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="ele-Search" @click="onQuery"> 查询 </el-button>
        </el-form-item>
        
      </el-form>
    </el-card>

    <el-card class="my-fill mt8" shadow="never">
      <el-row class="mb-4">
        <el-button v-auth="PubFunctionAccess.REMOVE" type="primary" icon="ele-Plus" @click="onAdd" size="small"> 新增 </el-button>
      </el-row>
      <el-table
        :data="state.functionTreeData"
        style="width: 100%"
        v-loading="state.loading"
        row-key="functionCode"
        :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
        :expand-row-keys="state.expandRowKeys"
      >
        <el-table-column prop="functionChina" label="权限名称" min-width="160" show-overflow-tooltip>
          <template #default="{ row }">
            <SvgIcon :name="row.menuIcon" />
            {{ row.functionChina }}
          </template>
        </el-table-column>
        <el-table-column label="路由" min-width="400" show-overflow-tooltip>
          <template #default="{ row }">
            {{ row.routerPath ? '路由地址：' + row.routerPath : '' }}
            {{ row.urlString ? '视图地址：' + row.urlString : '' }}
          </template>
        </el-table-column>
        <el-table-column prop="functionCode" label="权限编号" min-width="100" show-overflow-tooltip />
        <el-table-column prop="sortId" label="排序" min-width="60" show-overflow-tooltip />
        <el-table-column label="操作" width="120" fixed="right" header-align="center" align="center">
          <template #default="{ row }">
            <el-button v-if="auth(PubFunctionAccess.EDIT)" icon="ele-EditPen" size="small" text type="primary" @click="onEdit(row)">编辑</el-button>
            <el-button v-if="auth(PubFunctionAccess.REMOVE)" icon="ele-Delete" size="small" text type="danger" @click="onDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <edit ref="editRef" :title="state.edit.title" :function-tree-data="state.functionTreeData" :expand-row-keys="state.expandRowKeys"></edit>
  </div>
</template>

<script lang="ts" setup name="/baseSet/function">
import { ref, reactive, onMounted, getCurrentInstance, onBeforeMount, defineAsyncComponent } from 'vue'
import { PubFunction } from '/@/api/admin/gen/data-contracts'
import { PubFunctionApi } from '/@/api/admin/gen/PubFunction'
import { listToTree, filterTree } from '/@/utils/tree'
import eventBus from '/@/utils/mitt'
import { auth } from '/@/utils/authFunction'
import { pubFunction as PubFunctionAccess } from '/@/access/pubFunction'
import { deepClone } from '/@/utils/other'

// 引入组件
const edit = defineAsyncComponent(() => import('./edit.vue'))

const { proxy } = getCurrentInstance() as any

const editRef = ref()

const state = reactive({
  loading: false,
  expandRowKeys: [] as Array<string>,
  filter: {
    name: '',
  },
  functionTreeData: [] as Array<PubFunction>,
  functionData: [] as Array<PubFunction>,
  edit: {
    //isEdit: false,
    //row:{} as any,
    title: '新增',
  },
})

onMounted(async () => {
  await onQuery()
  state.expandRowKeys = deepClone(state.functionData)
    .filter((p: PubFunction) => p.parentCode === '0')
    .map((p: PubFunction) => p.functionCode) as string[]
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
  const res = await new PubFunctionApi().getList().catch(() => {
    state.loading = false
  })
  if (res && res.data && res.data.length > 0) {
    state.functionTreeData = filterTree(
      listToTree(res.data, {
        rootWhere: (parent: any, self: any) => {
          return self.parentCode ==="0"
        },
        childsWhere: (parent: any, self: any) => {
          return parent.functionCode === self.parentCode
        },
      }),
      state.filter.name,
      {
        filterWhere: (item: any, word: string) => {
          return item.functionChina?.toLocaleLowerCase().indexOf(word) > -1
        },
      }
    )
    state.functionData = res.data
  } else {
    state.functionTreeData = []
  }
  state.loading = false
}

const onAdd = () => {
  state.edit.title = '新增权限'
  editRef.value.open()
}

const onEdit = (row: PubFunction) => {
  state.edit.title = '编辑权限'
  editRef.value.open(row)
}

const onDelete = (row: PubFunction) => {
  proxy.$modal
    .confirmDelete(`确定要删除权限【${row.functionChina}】?`)
    .then(async () => {
      await new PubFunctionApi().delete(row.functionCode as string, { loading: true })
      onQuery()
    })
    .catch(() => {})
}
</script>

<style scoped lang="scss"></style>
