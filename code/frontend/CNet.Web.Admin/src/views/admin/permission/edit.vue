<template>
  <div>
    <el-dialog
      v-model="state.showDialog"
      destroy-on-close
      :title="title"
      draggable
      :close-on-click-modal="false"
      :close-on-press-escape="false"
      width="800px"
    >
      <el-form :model="form" ref="formRef" size="default" label-width="80px">
        <el-row :gutter="35">
          <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="上级权限" prop="parentCode">
              <el-tree-select
                v-model="form.parentCode"
                :data="functionTreeData"
                node-key="functionCode"
                :props="{ label: 'functionChina' }"
                check-strictly
                render-after-expand
                fit-input-width
                clearable
                class="w100"
                :default-expanded-keys="expandRowKeys"
                filterable
              />
            </el-form-item>
          </el-col>
          <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="权限名称" prop="functionChina" :rules="[{ required: true, message: '请输入权限名称', trigger: ['blur', 'change'] }]">
              <el-input v-model="form.functionChina" clearable />
            </el-form-item>
          </el-col>
          <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="是否菜单" prop="menuFlag">
              <el-switch v-model="form.menuFlag" inline-prompt active-text="是" inactive-text="否" />
            </el-form-item>
          </el-col>
          <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="是否缓存" prop="isCache">
              <el-switch v-model="form.isCache" inline-prompt active-text="是" inactive-text="否" />
            </el-form-item>
          </el-col>
          <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12" v-show="form.menuFlag">
            <el-form-item label="路由地址" prop="routerPath" :rules="form.menuFlag?[{ required: true, message: '请输入权限名称', trigger: ['blur', 'change'] }]:[]">
              <el-input v-model="form.routerPath" clearable />
            </el-form-item>
          </el-col>
          <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12" v-show="form.menuFlag">
            <el-form-item label="视图地址" prop="urlString">
              <el-input v-model="form.urlString" clearable />
            </el-form-item>
          </el-col>
          <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="排序号" prop="sortId">
              <el-input v-model="form.sortId" clearable />
            </el-form-item>
          </el-col>
          <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
            <el-form-item label="图标样式" prop="menuIcon">
              <!-- <el-input v-model="form.menuIcon" clearable /> -->
              <my-select-icon v-model="form.menuIcon" clearable />
            </el-form-item>
          </el-col>
          <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <el-form-item label="备注" prop="functionDescrip">
              <el-input v-model="form.functionDescrip" type="textarea" clearable show-word-limit maxlength="50" />
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

<script lang="ts" setup name="/baseSet/function/edit">
import { reactive, toRefs, ref, PropType, watch, onMounted } from 'vue'
import { PubFunction } from '/@/api/admin/gen/data-contracts'
import { PubFunctionApi } from '/@/api/admin/gen/PubFunction'
import eventBus from '/@/utils/mitt'
import mySelectIcon from '/@/components/my-select-icon/index.vue'

const props = defineProps({
  title: {
    type: String,
    default: '',
  },
  functionTreeData: {
    type: Array as PropType<PubFunction[]>,
    default: () => [],
  },
  expandRowKeys:{
    type:Array<String>,
    default:[]
  }
})
const formRef = ref()
const state = reactive({
  showDialog: false,
  expandRowKeys: [] as Array<string>,
  sureLoading: false,
  form: {
    enabled: true,
  } as PubFunction,
})

const { form } = toRefs(state)

onMounted(() => {})

const open = async (row: any = {}) => {
  if (row.functionCode) {
    const res = await new PubFunctionApi().getModel(row.functionCode, { loading: true })

    if (res?.code == 1) {
      let formData = res.data as PubFunction
      formData.parentCode = formData.parentCode === '0' ? undefined : formData.parentCode
      state.form = formData
    }
  } else {
    state.form = {
      enabled: true,
    } as PubFunction
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
    state.form.functionCode = state.form.functionCode || ''
    if (state.form.functionCode != '') {
      res = await new PubFunctionApi().edit(state.form, { showSuccessMessage: true }).catch(() => {
        state.sureLoading = false
      })
    } else {
      res = await new PubFunctionApi().add(state.form, { showSuccessMessage: true }).catch(() => {
        state.sureLoading = false
      })
    }

    state.sureLoading = false

    if (res?.code == 1) {
      eventBus.emit('refreshList')
      state.showDialog = false
    }
  })
}

defineExpose({
  open,
})
</script>
