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
              <el-form-item label="角色名称" prop="roleName" :rules="[{ required: true, message: '请输入角色名称', trigger: ['blur', 'change'] }]">
                <el-input v-model="form.roleName" clearable maxlength="20" />
              </el-form-item>
            </el-col>
            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="备注" prop="remark">
                <el-input v-model="form.remark" type="textarea" clearable show-word-limit maxlength="50"  />
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
  import { PubRole } from '/@/api/admin/gen/data-contracts'
  import { PubRoleApi} from '/@/api/admin/gen/PubRole'
  import eventBus from '/@/utils/mitt'
  
  defineProps({
    title: {
      type: String,
      default: '',
    }
  })
  
  const formRef = ref()
  const state = reactive({
    showDialog: false,
    sureLoading: false,
    form: {
      enabled: true,
    } as PubRole,
  })
  
  const { form } = toRefs(state)
  
  // 打开对话框
  const open = async (row: any = {}) => {
    if (row.roleCode) {
      const res = await new PubRoleApi().getModel(row.id, { loading: true })
  
      if (res?.code==1) {
        let formData = res.data as PubRole
        state.form = formData
      }
    } else {
      state.form = {
        enabled: true,
      } as PubRole
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
      state.form.roleCode = state.form.roleCode||""
      if (state.form.roleCode!="") {
        res = await new PubRoleApi().edit(state.form, { showSuccessMessage: true }).catch(() => {
          state.sureLoading = false
        })
      } else {
        res = await new PubRoleApi().add(state.form, { showSuccessMessage: true }).catch(() => {
          state.sureLoading = false
        })
      }
  
      state.sureLoading = false
  
      if (res?.code==1) {
        emit('onSaveSuccess');
        state.showDialog = false
      }
    })
  }
  defineExpose({
    open,
  })

  const emit= defineEmits(["onSaveSuccess"]);
  
  </script>
  