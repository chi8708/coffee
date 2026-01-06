<template>
  <div>
    <el-dialog v-if="state.showDialog" v-model="state.showDialog" destroy-on-close :title="title" draggable :close-on-click-modal="false"
      :close-on-press-escape="false" width="600px" v-loading="state.loading">
      <el-form :model="form" ref="formRef" size="default" label-width="80px">
        <el-row :gutter="35">
          <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <el-tabs v-model="state.tab_active">
              <el-tab-pane label="用户权限" name="0">       
                <functionTree ref="functionTreeRef" :default-checked-keys="form.functionCodes"></functionTree>
              </el-tab-pane>
              <el-tab-pane label="角色权限" name="1">
                <functionTree ref="functionTree_roleRef" :default-checked-keys="form.functionCodes_role" :disabled="true"></functionTree>
              </el-tab-pane>
            </el-tabs>
     
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
  </div>
</template>
  
<script lang="ts" setup >
import { stat } from 'fs';
import { reactive, toRefs, ref, PropType, onMounted, defineAsyncComponent, Ref,toRaw } from 'vue'
import { PubFunction } from '/@/api/admin/gen/data-contracts'
import { PubUserApi } from '/@/api/admin/gen/PubUser'
import functionTree from '/@/views/admin/permission/com/functionTree.vue'

//const functionTree = defineAsyncComponent(() => import('/@/views/admin/permission/com/functionTree.vue'))
defineProps({
  title: {
    type: String,
    default: '授权',
  }
})

const formRef = ref()
const functionTreeRef: Ref<any> = ref()
  const functionTree_roleRef: Ref<any> = ref()
const state = reactive({
  loading: false,
  showDialog: false,
  sureLoading: false,
  tab_active:'0',
  form: {
    userCode: '',
    functionCodes: [] as string[],
    functionCodes_role:[] as string[]
  },
  functionTreeData: [] as Array<PubFunction>
})

const { form } = toRefs(state)

// //自定义 树样式
// const customNodeClass = (data: PubFunction, node: Node) => {
//   if ((data.functionCode as string).length >= 8) {
//     return 'is-penultimate'
//   }
//   return null
// }

onMounted(() => {
})

// 打开对话框
const open = async (row: any = {}) => {
  if (row.userCode) {
    state.form.userCode = row.userCode;
    const res = await new PubUserApi().getFunctions(row.userCode, { loading: true })
    if (res?.code == 1) {
      state.form.functionCodes = res.data as string[];
    }
    const res_functionCodeRole = await new PubUserApi().getRoleFunctions(row.userCode, { loading: true })
    if (res_functionCodeRole?.code == 1) {
      state.form.functionCodes_role = res_functionCodeRole.data as string[];
    }
    state.showDialog = true;
    state.tab_active="0";
  }
}
// 取消
const onCancel = () => {
  state.showDialog = false
}

// 确定
const onSure = () => {
  state.form.functionCodes = functionTreeRef.value?.getCheckedFunctionCodes();
  formRef.value.validate(async (valid: boolean) => {
    if (!valid) return

    state.sureLoading = true
    let res = {} as any
    let { userCode, functionCodes } = { ...state.form }
    res = await new PubUserApi().saveFunctions(userCode, functionCodes, { showSuccessMessage: true }).catch(() => {
      state.sureLoading = false
    })
    state.sureLoading = false
    if (res?.code == 1) {
      //emit('onSaveSuccess');
      state.showDialog = false
    }
  })
}
defineExpose({
  open,
})

const emit = defineEmits(["onSaveSuccess"]);

</script>