<template>
    <div class="my-layout">
        <el-card class="mt8" shadow="never" :body-style="{ paddingBottom: '0' }">
            <el-form :inline="true" @submit.stop.prevent>
                <el-form-item label="角色名称">
                    <el-input v-model="state.pageInput.query.SL_roleName" placeholder="角色名称" @keyup.enter="onQuery" />
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" icon="ele-Search" @click="onQuery"> 查询 </el-button>
                </el-form-item>
            </el-form>
        </el-card>

        <el-card class="my-fill mt8" shadow="never">
            <el-row class="mb-4">
                <el-button v-auth="pubRoleAccess.REMOVE" type="primary" icon="ele-Plus" @click="onAdd" size="small"> 新增
                </el-button>
            </el-row>
            <el-table :data="state.pageList" style="width: 100%" v-loading="state.loading" row-key="Id" border stripe>
                <el-table-column prop="roleName" label="角色名称" min-width="160" show-overflow-tooltip />
                <el-table-column prop="roleCode" label="角色编号" min-width="80" show-overflow-tooltip />
                <el-table-column prop="lmdt" label="编辑时间" min-width="80" show-overflow-tooltip />
                <el-table-column prop="lmid" label="编辑人" min-width="80" show-overflow-tooltip />
                <el-table-column label="操作" width="200" fixed="right" header-align="center" align="center">
                    <template #default="{ row }">
                        <el-button v-if="auth(pubRoleAccess.EDIT) && row.parentCode != 0" icon="ele-EditPen" size="small"
                            text type="primary" @click="onEdit(row)">编辑</el-button>
                        <el-button v-if="auth(pubRoleAccess.REMOVE) && row.parentCode != 0" icon="ele-Delete" size="small"
                            text type="danger" @click="onDelete(row)">删除</el-button>
                        <el-button v-if="auth(pubRoleAccess.AUTH) && row.parentCode != 0" icon="ele-CircleCheck"
                            size="small" text type="warning" @click="onAuth(row)">授权</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div class="my-flex my-flex-end" style="margin-top: 20px">
                <el-pagination v-model:currentPage="state.pageInput.pageNum" v-model:page-size="state.pageInput.pageSize"
                    :total="state.total" :page-sizes="[10, 20, 50, 100]" small background @size-change="onSizeChange"
                    @current-change="onCurrentChange" layout="total, sizes, prev, pager, next, jumper" />
            </div>
        </el-card>

        <edit ref="editRef" :title="state.edit.title" @on-save-success="onQuery"></edit>
        <role-auth ref="roleAuthRef" :title="state.edit.title" >
            <template #functionTree>
                <functionTree ref="functionTreeRef" :default-checked-keys="edit.functionCodes"></functionTree>
            </template>
        </role-auth>
    </div>
</template>

<script lang="ts" setup name="/baseSet/Role">
import { ref, reactive, onMounted, getCurrentInstance, onBeforeMount, defineAsyncComponent } from 'vue'
import { PubRole, PubRolePageDateRes } from '/@/api/admin/gen/data-contracts'
import { PubRoleApi } from '/@/api/admin/gen/PubRole'
import eventBus from '/@/utils/mitt'
import { auth } from '/@/utils/authFunction'
import { pubRole as pubRoleAccess } from '/@/access/pubRole'

// 引入组件
const edit = defineAsyncComponent(() => import('./edit.vue'))
const roleAuth = defineAsyncComponent(() => import('./roleAuth.vue'))


const { proxy } = getCurrentInstance() as any

const editRef = ref()
const roleAuthRef = ref()

const state = reactive({
    loading: false,
    pageInput: {
        pageNum: 1,
        pageSize: 10,
        field: 'Id',
        order: 'desc',
        query: {} as any,
    },
    pageList: [] as Array<PubRole>,
    total: 0,
    edit: {
        title: '新增'
    },
})

onMounted(() => {
    onQuery()
})

onBeforeMount(() => { })

const onQuery = async () => {
    state.loading = true
    const res = await new PubRoleApi().getPage(state.pageInput).catch(() => {
        state.loading = false
    })

    state.pageList = res?.data ?? []
    state.total = res?.count ?? 0
    state.loading = false
}
const onSizeChange = (val: number) => {
    state.pageInput.pageSize = val
    onQuery()
}

const onCurrentChange = (val: number) => {
    state.pageInput.pageNum = val
    onQuery()
}

const onAdd = () => {
    state.edit.title = '新增角色'
    editRef.value.open()
}

const onEdit = (row: PubRole) => {
    state.edit.title = '编辑角色'
    editRef.value.open(row)
}

const onDelete = (row: PubRole) => {
    proxy.$modal
        .confirmDelete(`确定要删除角色【${row.roleName}】?`)
        .then(async () => {
            await new PubRoleApi().delete(row.id as number, { loading: true })
            onQuery()
        })
        .catch(() => { })
}

const onAuth = (row: PubRole) => {
    state.edit.title=`授权-${row.roleName}`;
    roleAuthRef.value.open(row);
}
</script>

<style scoped lang="scss"></style>
