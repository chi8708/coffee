import { BaseService,UtilRes } from './BaseService'
import { RequestParams,FullRequestParams ,ContentType} from './gen/http-client'
import { VPubuserDept } from './gen/data-contracts'
import { formData } from '/@/views/example/pages/dynamicForm/mock'
export class PubUserApi extends BaseService<any>{
      constructor() {
        super("PubUser");
      }
      public getModel(id: string | number, params?: RequestParams){
        return this.getModel_base<VPubuserDept>(`/api/PubUser/GetModel`, id, params)
      }

      //form表单请求
      public changeUserStatus(id: string | number,userStatus:number, params?: RequestParams){
        //let pms:FullRequestParams
        let pms:any= { type:ContentType.UrlEncoded,...params};//form请求 ${id}
        return this.post<UtilRes<boolean>>(`/api/PubUser/ChangeUserStatus/`, {id,userStatus}, pms);
      }

      public resetPassword(data:any, params?: RequestParams){
        return this.post<UtilRes<boolean>>(`/api/PubUser/ResetPassWord`, data)
      }
}