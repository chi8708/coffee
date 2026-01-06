

    <!-- 此代码由CNetCodeGen生成， 作者：cts 生成时间：2025-07-01 15:20:09 -->

<template>
  <el-dialog v-model="state.showDialog" v-if="state.showDialog" destroy-on-close :title="props.title" draggable
    :close-on-click-modal="false" :close-on-press-escape="false" width="769px" >
    <el-form ref="formRef" size="default" label-width="80px" :model="form" >
      <el-row :gutter="10">
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="" prop="createTime" >
                    <el-date-picker v-model="form.createTime" type="date" placeholder="选择日期"style="width: 100%" />
                </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="" prop="genInfo" >
                    <el-input v-model="form.genInfo" autocomplete="off" />
                </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="" prop="status" >
                    <el-input v-model="form.status" autocomplete="off" />
                </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="" prop="tableName" >
                    <el-input v-model="form.tableName" autocomplete="off" />
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
import { gen_log } from '/@/api/model/gen_log'
import { gen_logApi } from '/@/api/admin/gen_log'

var props= defineProps({
  title: { type: String, required: true, default: '新增' },
})

const state = reactive({
  sureLoading: false,
  showDialog: false,
  form: {} as gen_log,
  isEdit: false,
  title: '新增'
})
const { form } = toRefs(state)
onMounted(() => {

})

const { proxy } = getCurrentInstance() as any
const formRef = ref<FormInstance>()

// 取消
const onCancel = () => {
  state.showDialog = false
}

// 确定
const onSure = () => {
  formRef.value!.validate(async (valid: boolean) => {
    if (!valid) return

    state.sureLoading = true
    let res = {} as any
    if (state.form.id != undefined && state.form.id > 0) {
         res = await new gen_logApi().edit_base(state.form, { showSuccessMessage: true }).catch(() => {
      })
    } else {
         res = await new gen_logApi().add_base(state.form, { showSuccessMessage: true }).catch(() => {
      })
    }
    state.sureLoading = false

    if (res?.code==1) {
      state.showDialog = false;
      eventBus.emit('refreshList');

    }
  })
}


// 打开对话框
 const open = async (row: gen_log | null) => {
   //proxy.$modal.loading()
  state.showDialog = true;
    if (row && row.id) {
    const res = await new gen_logApi().getModel_base(row.id).catch(() => { });
    if(res?.code==1){
       state.isEdit=true;
       state.form = res.data as gen_log;
    }
  }
  else{
  }
  //proxy.$modal.closeLoading()

}

defineExpose({
  open
});

</script>

