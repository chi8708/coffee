<template>
  <div>
    <el-dialog v-if="state.showDialog" v-model="state.showDialog" destroy-on-close :title="title" draggable :close-on-click-modal="false"
      :close-on-press-escape="false" width="600px" v-loading="state.loading">
      <el-form :model="form" ref="formRef" size="default" label-width="80px">
        <el-row :gutter="35">
          <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <!-- <el-tree :data="state.functionTreeData" show-checkbox node-key="functionCode" 
              default-expand-all :expand-on-click-node="false"
              :props="{ label: 'functionChina',class: customNodeClass }"
              :default-checked-keys="form.functionCodes"
              check-on-click-node /> -->
            <functionTree ref="functionTreeRef" :default-checked-keys="form.functionCodes"></functionTree>
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
import { reactive, toRefs, ref, PropType, onMounted, defineAsyncComponent, Ref,toRaw } from 'vue'
import { PubRole, PubFunction } from '/@/api/admin/gen/data-contracts'
import { PubRoleApi } from '/@/api/admin/gen/PubRole'
import { PubFunctionApi } from '/@/api/admin/gen/PubFunction'
import { listToTree, filterTree } from '/@/utils/tree'
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
const state = reactive({
  loading: false,
  showDialog: false,
  sureLoading: false,
  form: {
    roleCode: '',
    functionCodes: [] as string[]
  },
  functionTreeData: [] as Array<PubFunction>
})

const { form } = toRefs(state)

//自定义 树样式
const customNodeClass = (data: PubFunction, node: Node) => {
  if ((data.functionCode as string).length >= 8) {
    return 'is-penultimate'
  }
  return null
}

onMounted(() => {
})

// 打开对话框
const open = async (row: any = {}) => {
  if (row.roleCode) {
    state.form.roleCode = row.roleCode;
    const res = await new PubRoleApi().getFunctions(row.roleCode, { loading: true })
    if (res?.code == 1) {
      state.form.functionCodes = res.data as string[];
    }
    state.showDialog = true;
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
    let { roleCode, functionCodes } = { ...state.form }
    res = await new PubRoleApi().saveFunctions(roleCode, functionCodes, { showSuccessMessage: true }).catch(() => {
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