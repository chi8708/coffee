<template>
    <div>
      <el-dialog
        v-model="state.showDialog"
        destroy-on-close
        :title="title"
        draggable
        :close-on-click-modal="false"
        :close-on-press-escape="false"
        width="600px"
      >
        <el-form :model="form" ref="formRef" size="default" label-width="80px">
          <el-row :gutter="35">
            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="上级部门" prop="parentCode" :rules="[{ required: true, message: '请输入上级部门', trigger: ['change'] }]">
                <el-tree-select
                  v-model="form.parentCode"
                  :data="deptTreeData"
                  node-key="deptCode"
                  :props="{ label: 'deptName' }"
                  check-strictly
                  default-expand-all
                  render-after-expand
                  fit-input-width
                  clearable
                  class="w100"
                />
              </el-form-item>
            </el-col>
            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="部门名称" prop="deptName" :rules="[{ required: true, message: '请输入部门名称', trigger: ['blur', 'change'] }]">
                <el-input v-model="form.deptName" clearable />
              </el-form-item>
            </el-col>
            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="备注" prop="code">
                <el-input v-model="form.remark" clearable />
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
    </div>
  </template>
  
  <script lang="ts" setup >
  import { reactive, toRefs, ref, PropType } from 'vue'
  import { PubDepartment } from '/@/api/admin/gen/data-contracts'
  import { PubDeptApi} from '/@/api/admin/gen/PubDept'
  import eventBus from '/@/utils/mitt'
  
  defineProps({
    title: {
      type: String,
      default: '',
    },
    deptTreeData: {
      type: Array as PropType<PubDepartment[]>,
      default: () => [],
    },
  })
  
  const formRef = ref()
  const state = reactive({
    showDialog: false,
    sureLoading: false,
    form: {
      enabled: true,
    } as PubDepartment,
  })
  
  const { form } = toRefs(state)
  
  // 打开对话框
  const open = async (row: any = {}) => {
    if (row.deptCode) {
      const res = await new PubDeptApi().getModel(row.deptCode, { loading: true })
  
      if (res?.code==1) {
        let formData = res.data as PubDepartment
        state.form = formData
      }
    } else {
      state.form = {
        enabled: true,
      } as PubDepartment
    }
    state.showDialog = true
  }
  // 取消
  const onCancel = () => {
    state.showDialog = false
  }
  
  // 确定
  const onSure = () => {
    formRef.value.validate(async (valid: boolean) => {
      if (!valid) return
  
      state.sureLoading = true
      let res = {} as any
      state.form.deptCode = state.form.deptCode||""
      if (state.form.deptCode!="") {
        res = await new PubDeptApi().edit(state.form, { showSuccessMessage: true }).catch(() => {
          state.sureLoading = false
        })
      } else {
        res = await new PubDeptApi().add(state.form, { showSuccessMessage: true }).catch(() => {
          state.sureLoading = false
        })
      }
  
      state.sureLoading = false
  
      if (res?.code==1) {
        eventBus.emit('refreshList')
        state.showDialog = false
      }
    })
  }
  
  defineExpose({
    open,
  })
  </script>
  