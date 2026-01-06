<template>
  <el-card shadow="never" style="margin-top: 8px" body-style="padding:0px;" class="my-fill">
    <template #header>
      <el-input v-model="state.filterText" placeholder="筛选部门" clearable />
    </template>
    <el-scrollbar v-loading="state.loading" height="100%" max-height="100%" :always="false" wrap-style="padding:var(--el-card-padding)">
      <el-tree
        ref="deptMenuRef"
        :data="state.orgTreeData"
        node-key="deptCode"
        :props="{ children: 'children', label: 'deptName' }"
        :filter-node-method="onFilterNode"
        highlight-current
        check-strictly
        default-expand-all
        render-after-expand
        :expand-on-click-node="false"
        v-bind="$attrs"
        @node-click="onNodeClick"
        @check-change="onCheckChange"
      />
    </el-scrollbar>
  </el-card>
</template>

<script lang="ts" setup name="dept-menu">
import { onMounted, reactive, ref, watch, nextTick } from 'vue'
import { PubDeptApi } from '/@/api/admin/gen/PubDept'
import { listToTree } from '/@/utils/tree'
import { ElTree } from 'element-plus'
import {PubDepartment} from '/@/api/admin/gen/data-contracts'

interface Props {
  modelValue: number[] | null | undefined
  selectFirstNode: boolean
}

const props = withDefaults(defineProps<Props>(), {
  modelValue: () => [],
  selectFirstNode: false,
})

const deptMenuRef = ref<InstanceType<typeof ElTree>>()
const state = reactive({
  loading: false,
  filterText: '',
  orgTreeData: [] as Array<PubDepartment>,
  lastKey: '0',
})

watch(
  () => state.filterText,
  (val) => {
    deptMenuRef.value?.filter(val)
  }
)

onMounted(() => {
  initData()
})

const emits = defineEmits<{
  (e: 'node-click', node: PubDepartment | null): void
  (e: 'update:modelValue', node: any[] | undefined | null): void
}>()

const onFilterNode = (value: string, data: PubDepartment) => {
  if (!value) return true
  return data.deptName?.indexOf(value) !== -1
}

const onNodeClick = (node: PubDepartment) => {
  if (state.lastKey === node.deptCode) {
    state.lastKey = '0'
    deptMenuRef.value?.setCurrentKey(undefined)
    emits('node-click', null)
  } else {
    state.lastKey = node.deptCode as string;
    emits('node-click', node)
  }
}

const onCheckChange = () => {
  emits('update:modelValue', deptMenuRef.value?.getCheckedKeys())
}

const initData = async () => {
  state.loading = true
  const res = await new PubDeptApi().getList().catch(() => {
    state.loading = false
  })
  state.loading = false
  if (res?.code==1 && res.data && res.data.length > 0) {
    state.orgTreeData = listToTree(res.data,{
      rootWhere: (parent: any, self: any) => {
        return self.parentCode == 0
      },
      childsWhere: (parent: any, self: any) => {
        return parent.deptCode === self.parentCode
      },
    })
    if (state.orgTreeData.length > 0 && props.selectFirstNode) {
      nextTick(() => {
        const firstNode = state.orgTreeData[0]
        deptMenuRef.value?.setCurrentKey(firstNode.deptCode as string)
        emits('node-click', firstNode)
      })
    }
  } else {
    state.orgTreeData = []
  }
}

defineExpose({
  deptMenuRef,
})
</script>
