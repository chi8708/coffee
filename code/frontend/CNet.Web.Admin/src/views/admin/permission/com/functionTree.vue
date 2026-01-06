<template>
    <div>
    <el-tree ref="functionTreeRef" :data="state.functionTreeData" show-checkbox node-key="functionCode" default-expand-all
        :expand-on-click-node="false"  :props="{ label: 'functionChina', class: customNodeClass, disabled: 'disabled' }"
        :default-checked-keys="defaultCheckedKeys" check-on-click-node v-bind="$attrs" />
    </div>

</template>
    
<script lang="ts" setup name="functionTree" >
import { reactive, toRefs, ref, PropType, onMounted, getCurrentInstance } from 'vue'
import { PubFunction } from '/@/api/admin/gen/data-contracts'
import { PubFunctionApi } from '/@/api/admin/gen/PubFunction'
import { listToTree, filterTree } from '/@/utils/tree'
import { ElTree } from 'element-plus'
import { TreeKey } from 'element-plus/es/components/tree/src/tree.type'

const props = defineProps({
    defaultCheckedKeys: {
        type: Array<string>,
        default: [],
    },
    disabled: {
        type:Boolean,
        default:false
    }
})
const state = reactive({
    loading: false,
    showDialog: false,
    sureLoading: false,
    functionTreeData: [] as Array<PubFunction>
})

const functionTreeRef = ref<InstanceType<typeof ElTree>>();
const { proxy } = getCurrentInstance() as any;

//自定义 树样式
const customNodeClass = (data:any):string => {
    if ((data.functionCode as string).length >= 8) {
        return 'is-penultimate'
    }
    return ""
}

onMounted(() => {
     loadFunctions();
})

//获取权限树
const loadFunctions = async ():Promise<boolean> => {
    const res = await new PubFunctionApi().getList().catch(() => {
    })
    if (res && res.data && res.data.length > 0) {
        if(props.disabled){
            res.data.map((p:any)=>p.disabled=true);
        }
        state.functionTreeData =
            listToTree(res.data, {
                rootWhere: (parent: any, self: any) => {
                    return self.parentCode === "0"
                },
                childsWhere: (parent: any, self: any) => {
                    return parent.functionCode === self.parentCode
                },
            })
    } else {
        state.functionTreeData = []
    }
    return true;
}

//获取选中的权限
const getCheckedFunctionCodes =  (): TreeKey[]|undefined => {
    return functionTreeRef.value?.getCheckedKeys(true);
}

defineExpose({
    getCheckedFunctionCodes,
    //loadFunctions
})
</script>
<style lang="scss" scoped>
::v-deep(.el-tree-node.is-expanded.is-penultimate > .el-tree-node__children) {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}

:deep(.is-penultimate > .el-tree-node__children > div) {
    width: 25%;
}
</style>
    