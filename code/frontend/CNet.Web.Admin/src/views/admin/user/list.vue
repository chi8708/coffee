<template>
    <my-layout>
        <pane size="20" min-size="20" max-size="35">
            <div class="my-flex-column w100 h100">
              <dept-menu @node-click="onOrgNodeClick" select-first-node></dept-menu>
            </div>
        </pane>
        <pane size="80">
            <div class="my-flex-column w100 h100">
                <el-card class="mt8" shadow="never" :body-style="{ paddingBottom: '0' }">
                    <el-form @submit.stop.prevent :inline="true" :model="state.pageInput.query"
                        class="demo-form-inline" label-position="left">
                        <el-form-item label="用户名">
                            <el-input v-model="state.pageInput.query.SL_UserName" placeholder="用户名" clearable />
                        </el-form-item>
                        <el-form-item label="电话">
                            <el-input v-model="state.pageInput.query.SL_Tel" placeholder="电话" clearable />
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" icon="ele-Search" @click="onQuery"> 查询 </el-button>
                        </el-form-item>
                    </el-form>
                </el-card>

                <el-card class="my-fill mt8" shadow="never">
                    <el-row class="mb-4">
                        <el-button v-auth="pubUserAccess.ADD" type="primary" icon="ele-Plus" @click="onAdd" size="small"> 新增
                        </el-button>
                    </el-row>
                    <el-table v-loading="state.loading" :data="state.pageList" row-key="id" style="width: 100%" border>
                        <el-table-column prop="userCode" label="编号" width="100" show-overflow-tooltip />
                        <el-table-column prop="userName" label="账号" width="80" show-overflow-tooltip />
                        <el-table-column prop="realName" label="姓名" width="80" show-overflow-tooltip />
                        <el-table-column prop="tel" label="电话" width="120" show-overflow-tooltip />
                        <el-table-column prop="deptName" label="部门" width="120" show-overflow-tooltip />
                        <el-table-column prop="lmdt" label="编辑日期" width="160" show-overflow-tooltip />
                        <el-table-column prop="roleNames" label="角色" min-width="140" show-overflow-tooltip>
                            <template #default="{ row }">
                                {{ row.roleNames ? row.roleNames.join(',') : '' }}
                            </template>
                        </el-table-column>
                        <el-table-column label="状态" width="80" align="center" fixed="right">
                            <template #default="{ row }">
                                <el-switch v-if="auth(pubUserAccess.REMOVE)" v-model="row.userStatus" :loading="row.loading"
                                    :active-value="1" :inactive-value="0" inline-prompt active-text="启用"
                                    inactive-text="禁用" :before-change="() => onSetEnable(row)" />
                                <template v-else>
                                    <el-tag type="success" v-if="row.userStatus==1">启用</el-tag>
                                    <el-tag type="danger" v-else>禁用</el-tag>
                                </template>
                            </template>
                        </el-table-column>
                        <el-table-column label="操作" width="140" header-align="center" align="center" fixed="right">
                            <template #default="{ row }">
                                <el-button v-auth="pubUserAccess.EDIT" icon="ele-EditPen" size="small" text type="primary"
                                    @click="onEdit(row)">编辑</el-button>
                                <my-dropdown-more v-auths="[pubUserAccess.EDIT,pubUserAccess.REMOVE]" buttonType="warning">
                                    <template #dropdown>
                                        <el-dropdown-menu>
                                            <el-dropdown-item v-if="auth(pubUserAccess.EDIT)"
                                                @click="onResetPwd(row)">重置密码</el-dropdown-item>
                                            <el-dropdown-item v-if="auth(pubUserAccess.REMOVE)"
                                                @click="onDelete(row)">删除用户</el-dropdown-item>
                                            <el-dropdown-item v-if="auth(pubUserAccess.AUTH)"
                                                @click="onAuth(row)">用户授权</el-dropdown-item>
                                        </el-dropdown-menu>
                                    </template>
                                </my-dropdown-more>
                            </template>
                        </el-table-column>
                    </el-table>
                    <div class="my-flex my-flex-end" style="margin-top: 20px">
                        <el-pagination v-model:currentPage="state.pageInput.pageNum"
                            v-model:page-size="state.pageInput.pageSize" :total="state.total"
                            :page-sizes="[10, 20, 50, 100]" small background @size-change="onSizeChange"
                            @current-change="onCurrentChange" layout="total, sizes, prev, pager, next, jumper" />
                    </div>
                </el-card>
            </div>
        </pane>
        <!-- v-if="state.edit.isEdit" ref="editRef" @edit-close="editClose" -->
        <edit  ref="editRef" :title="state.edit.title"></edit> 
        <user-auth ref="userAuthRef" :title="state.edit.title"></user-auth>
    </my-layout>
</template>
<script lang="ts" setup name="/baseSet/user">
import { ref, reactive, onMounted, getCurrentInstance, onBeforeMount, defineAsyncComponent } from 'vue'
import { PubUserApi } from '/@/api/admin/gen/PubUser'
import { PubUserApi as  PubUserApi_Ext} from '/@/api/admin/PubUser'
import { Pane } from 'splitpanes'
import { auth } from '/@/utils/authFunction'
import eventBus from '/@/utils/mitt'
import { VPubuserDept } from '/@/api/admin/gen/data-contracts'
import {pubUser as pubUserAccess} from '/@/access/pubUser'

const MyLayout = defineAsyncComponent(() => import('/@/components/my-layout/index.vue'))
const MyDropdownMore = defineAsyncComponent(() => import('/@/components/my-dropdown-more/index.vue'))
const DeptMenu = defineAsyncComponent(() => import('/@/views/admin/dept/com/dept-menu.vue'))
 const edit = defineAsyncComponent(() => import('./edit.vue'))
const userAuth = defineAsyncComponent(() => import('./userAuth.vue'))
const { proxy } = getCurrentInstance() as any
let editRef=ref();
const userAuthRef = ref()
const state = reactive({
    loading: false,
    total: 0,
    pageInput: {
        pageNum: 1,
        pageSize: 10,
        field: "Id",
        order: "desc",
        query: {} as any
    },
    pageList: [] as any,
    edit:{
       //isEdit: false,
       //row:{} as any,
       title:'新增'
    }
    
})


onMounted(() => {
      eventBus.off('refreshList')
      eventBus.on('refreshList', async () => {
        onQuery()
      })
})

onBeforeMount(() => {
    eventBus.off('refreshList')
})

const onQuery = async () => {
    state.loading = true
    const res = await new PubUserApi().getPage(state.pageInput).catch(() => {
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
     state.edit.title="新增";
    editRef.value.open();
  
}

const onEdit = (row: VPubuserDept) => {
     state.edit.title="编辑"
    editRef.value.open(row);
   
}
const onSetEnable = (row: any & { loading: boolean }) => {
    return new Promise((resolve, reject) => {
        proxy.$modal
            .confirm(`确定要${row.userStatus==1 ? '禁用' : '启用'}【${row.realName}】?`)
            .then(async () => {
                row.loading = true;
                const res = await new PubUserApi_Ext()
                    .changeUserStatus(row.id, row.userStatus==1?0:1,{ showSuccessMessage: true })
                    .catch(() => {
                        reject(new Error('Error'))
                    })
                    .finally(() => {
                        row.loading = false
                    })
                if (res && res.code == 1) {
                    resolve(true)
                } else {
                    reject(new Error('Cancel'))
                }
            })
    })
}

const onDelete = (row: VPubuserDept) => {
    proxy.$modal
        .confirmDelete(`确定要删除【${row.realName}】?`)
        .then(async () => {
            await new PubUserApi().delete(row.id as number, { loading: true, showSuccessMessage: true })
            onQuery()
        })
        .catch(() => { })
}

const onResetPwd = (row: any) => {
    proxy.$modal
        .prompt(`确定要给【${row.realName}】重置密码?`, { inputPlaceholder: '选填，不填则使用系统默认密码', autofocus: false })
        .then(async ({ value }: { value: string }) => {
            const res = await new PubUserApi_Ext().resetPassword({ id: row.id,passWord:value}, { loading: true })
            if (res?.code == 1) {
                proxy.$modal.msgSuccess(`重置密码成功`);
            }
            onQuery()
        })
        .catch(() => { })
}

//部门点击
const onOrgNodeClick = (node:any) => {
  if (state.pageInput.query) {
    state.pageInput.query.S_deptCode = node?.deptCode
  }
  onQuery()
}

const onAuth = (row: VPubuserDept) => {
    state.edit.title=`授权-${row.userName}`;
    userAuthRef.value.open(row);
}
const editClose=()=>{
    //state.edit.isEdit=false;
}
</script>

