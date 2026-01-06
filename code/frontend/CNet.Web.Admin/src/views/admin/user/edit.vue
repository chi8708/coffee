<template>
  <el-dialog v-model="state.showDialog" v-if="state.showDialog" destroy-on-close :title="props.title" draggable
    :close-on-click-modal="false" :close-on-press-escape="false" width="769px" @close="onClose">
    <el-form ref="formRef" size="default" label-width="80px" :model="form" >
      <el-row :gutter="10">
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="用户名" prop="userName"
            :rules="[{ required: true, message: '请输入用户名', trigger: ['blur', 'change'] }]">
            <el-input v-model="form.userName" autocomplete="off" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="密码" prop="userPwd"
            :rules="[{ required: true, message: '请输入密码', trigger: ['blur', 'change'] }]">
            <el-input type="password" v-model="form.userPwd" autocomplete="off" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="电话" prop="tel" :rules="[
            { required: true, message: '请输入电话', trigger: ['blur', 'change'] }
            , { validator: testMobile, trigger: ['blur', 'change'] },
          ]">
            <el-input v-model="form.tel" autocomplete="off" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="部门" prop="deptCode" :rules="[{ required: true, message: '请选择部门', trigger: ['change'] }]">
              <el-tree-select
                ref="orgTreeSelectRef"
                v-model="form.deptCode"
                placeholder="请选择部门"
                :data="state.orgTreeData"
                node-key="deptCode"
                :props="{ label: 'deptName' }"
                check-strictly
                default-expand-all
                render-after-expand
                fit-input-width
                clearable
                collapse-tags
                collapse-tags-tooltip
                filterable
                class="w100"
              />
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="姓名" prop="realName">
            <el-input v-model="form.realName" autocomplete="off" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="性别">
            <el-radio-group v-model="form.sex">
              <el-radio :label="true" >男</el-radio>
              <el-radio :label="false">女</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
          <el-form-item label="角色" prop="roleCodes">
            <el-select
              v-model="form.roleCodes"
              multiple
              collapse-tags
              collapse-tags-tooltip
              :max-collapse-tags="5"
              placeholder="选择角色"
              class="w100"
            >
              <el-option
                v-for="item in state.roleListData"
                :key="item.roleCode"
                :label="item.roleName"
                :value="item.roleCode"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
          <el-form-item label="地址" prop="userAddress">
            <el-input v-model="form.userAddress" autocomplete="off" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
          <el-form-item label="备注" prop="remark">
            <el-input v-model="form.remark" autocomplete="off" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="onCancel" size="default">取 消</el-button>
        <el-button type="primary" @click="onSure" size="default" :loading="state.sureLoading">确 定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script  lang="ts" setup>
import { reactive, toRefs, getCurrentInstance, ref, watch, defineAsyncComponent, computed, onMounted } from 'vue'
import eventBus from '/@/utils/mitt'
import { FormInstance } from 'element-plus'
import { VPubdeptParent, VPubuserDept,PubDepartment,PubRole } from '/@/api/admin/gen/data-contracts';
import { isMobile, testMobile, testEmail } from '/@/utils/test'
import {PubRoleApi } from '/@/api/admin/gen/PubRole'
import {PubDeptApi} from '/@/api/admin/gen/PubDept'
import { listToTree } from '/@/utils/tree'
import {PubUserApi as PubUserApi_Ext} from '/@/api/admin/PubUser'
import {PubUserApi} from '/@/api/admin/gen/PubUser'
// var props= defineProps<
// {a
//   title?:string,
//   isShowDialog: boolean,
//   row:symbol,
//   parent:symbol
// }
// >()

var props= defineProps({
  title: { type: String, required: true, default: '新增' },
})

const state = reactive({
  sureLoading: false,
  orgs: [] as any,
  showDialog: false,
  form: {roleCodes:[]} as VPubuserDept,
  isEdit: false,
  title: '新增',
  orgTreeData: [] as PubDepartment[],
  roleListData: [] as PubRole[],
})
const { form } = toRefs(state)
onMounted(() => {
  //console.log(state.form);
  // state.showDialog=true;
})

const { proxy } = getCurrentInstance() as any
const formRef = ref<FormInstance>()

// 取消
const onCancel = () => {
  state.showDialog = false
}
const onClose = () => {
  emits("editClose");
}
// 确定
const onSure = () => {
  formRef.value!.validate(async (valid: boolean) => {
    if (!valid) return

    state.sureLoading = true
    let res = {} as any
    if (state.form.id != undefined && state.form.id > 0) {
      res = await new PubUserApi().edit(state.form, { showSuccessMessage: true }).catch(() => {
      })
    } else {
      res = await new PubUserApi().add(state.form, { showSuccessMessage: true }).catch(() => {
      })
    }
    state.sureLoading = false

    if (res?.code==1) {
      state.showDialog = false;
      eventBus.emit('refreshList');

    }
  })
}

const getOrgs = async () => {
  const res = await new PubDeptApi().getList().catch(() => {
    state.orgTreeData = []
  })
  if (res?.code==1 && res.data && res.data.length > 0) {
    state.orgTreeData = listToTree(res.data,{
      rootWhere: (parent: any, self: any) => {
        return self.parentCode == 0
      },
      childsWhere: (parent: any, self: any) => {
        return parent.deptCode === self.parentCode
      },
    })
  } else {
    state.orgTreeData = []
  }
}

const getRoles = async () => {
  const res = await new PubRoleApi().getList().catch(() => {
    state.roleListData = []
  })
  if (res?.code==1 && res.data && res.data.length > 0) {
    state.roleListData = res.data;
  } else {
    state.roleListData = []
  }
}

// 打开对话框
const open = async (row: VPubuserDept | null) => {
   //proxy.$modal.loading()
  await getOrgs();
  await getRoles();
  state.showDialog = true;
  if (row&& row.id as number > 0) {
    const res = await new PubUserApi_Ext().getModel(row.id as number).catch(() => {
     // proxy.$modal.closeLoading()
    })
    if(res?.code==1){
      state.isEdit=true;
      state.form=res.data as VPubuserDept;
    }
  }
  else{
    state.form={
      sex:true,
      roleCodes:[]
    };
  }
  //proxy.$modal.closeLoading()

}

defineExpose({
  open
});
const emits = defineEmits([
  'editClose'
])
</script>
