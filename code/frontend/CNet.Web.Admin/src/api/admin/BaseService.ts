import { AxiosResponse } from 'axios'
import { ContentType, HttpClient, RequestParams } from './gen/http-client'
import { PageDataReq } from './gen/data-contracts'

export class  BaseService<TReq,SecurityDataType = unknown> extends HttpClient<SecurityDataType> {
  private requestTypeName: string;

  constructor(typeName: string,...axiosParams: any) {
    super(...axiosParams);
    this.requestTypeName = typeName;
  }

  getRequestTypeName(): string {
    return this.requestTypeName;
  }

  /**
   * No description
   *
   * @tags PubUser
   * @name GetPage
   * @summary 获取分页
   * @request POST:/api/PubUser/GetPage
   * @secure
   */
  public getPage_base<T>(data: PageDataReq,params: RequestParams = {},url: string=`/api/${this.getRequestTypeName()}/GetPage`){
    return this.post<PageDateRes<T>>(url, data, params);
  }

  /**
* No description
*
* @tags PubUser
* @name GetPage
* @summary 获取实体
* @request POST:/api/PubUser/Get
* @secure
*/
  public getModel_base<T>(id: number | string, params: RequestParams = {},url: string=`/api/${this.getRequestTypeName()}/Get`){
    return this.post<UtilRes<T>>(`${url}/${id}`, null, params);
  }

  /**
   * No description
   *
   * @tags PubUser
   * @name Add
   * @summary 添加
   * @request POST:/api/PubUser/Add
   * @secure
   */
   public add_base<T>(data:TReq|any, params: RequestParams = {},url: string=`/api/${this.getRequestTypeName()}/Add`){
    return this.post<UtilRes<T>>(url, data, params);
   }
  
  /**
   * No description
   *
   * @tags PubUser
   * @name Edit
   * @summary 编辑
   * @request POST:/api/PubUser/Edit
   * @secure
   */
    public edit_base<T>(data: TReq|any, params: RequestParams = {},url: string=`/api/${this.getRequestTypeName()}/Edit`){
      return this.post<UtilRes<T>>(url, data, params);
    }


    //删除
  public remove_base<T> (id: number | string, params: RequestParams = {},url: string=`/api/${this.getRequestTypeName()}/Remove`){
     return  this.post(`${url}/${id}`, null, params);
  }


  public post<T>(url: string, data: any = {}, params: RequestParams = {}){
    return this.request<T, any>({
      path: url,
      method: 'POST',
      body: data,
      secure: true,
      format: 'json',
      ...params,
    })
  }
  // protected post = (url: string, data: any = {}, params: RequestParams = {}) => {
  //   return this.request<any, any>({
  //     path: url,
  //     method: 'POST',
  //     body: data,
  //     secure: true,
  //     format: 'json',
  //     ...params,
  //   })
  // }
}

//返回实体
export interface UtilRes<T>{
  code?: ResCode
  msg?: string | null
  data?: T | null
}
export type ResCode = 0 | 1 | -1


//返回分页实体
export interface PageDateRes<T> {
  code?: ResCode
  msg?: string | null
  /** @format int32 */
  count?: number
  /** @format int32 */
  totalPage?: number
  data?: T[] | null
  /** @format int32 */
  pageNum?: number
  /** @format int32 */
  pageSize?: number
}