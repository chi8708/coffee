/* eslint-disable */
/* tslint:disable */
/*
 * ---------------------------------------------------------------
 * ## THIS FILE WAS GENERATED VIA SWAGGER-TYPESCRIPT-API        ##
 * ##                                                           ##
 * ## AUTHOR: acacode                                           ##
 * ## SOURCE: https://github.com/acacode/swagger-typescript-api ##
 * ---------------------------------------------------------------
 */

import { AxiosResponse } from 'axios'
import { BooleanDataRes, PageDataReq, StringIEnumerableDataRes, VPubuserDept, VPubuserDeptDataRes, VPubuserDeptPageDateRes } from './data-contracts'
import { ContentType, HttpClient, RequestParams } from './http-client'

export class PubUserApi<SecurityDataType = unknown> extends HttpClient<SecurityDataType> {
  /**
   * No description
   *
   * @tags PubUser
   * @name GetAccess
   * @request GET:/api/PubUser/GetAccess
   * @secure
   */
  getAccess = (params: RequestParams = {}) =>
    this.request<AxiosResponse, any>({
      path: `/api/PubUser/GetAccess`,
      method: 'GET',
      secure: true,
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name GetPage
   * @summary 获取用户分页1
   * @request POST:/api/PubUser/GetPage
   * @secure
   */
  getPage = (data: PageDataReq, params: RequestParams = {}) =>
    this.request<VPubuserDeptPageDateRes, any>({
      path: `/api/PubUser/GetPage`,
      method: 'POST',
      body: data,
      secure: true,
      type: ContentType.Json,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name Add
   * @summary 添加用户
   * @request POST:/api/PubUser/Add
   * @secure
   */
  add = (data: VPubuserDept, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubUser/Add`,
      method: 'POST',
      body: data,
      secure: true,
      type: ContentType.Json,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name Edit
   * @summary 编辑用户
   * @request POST:/api/PubUser/Edit
   * @secure
   */
  edit = (data: VPubuserDept, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubUser/Edit`,
      method: 'POST',
      body: data,
      secure: true,
      type: ContentType.Json,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name Delete
   * @summary 删除用户
   * @request POST:/api/PubUser/Delete/{id}
   * @secure
   */
  delete = (id: number, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubUser/Delete/${id}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name GetFunctions
   * @summary 获取用户权限
   * @request POST:/api/PubUser/GetFunctions/{code}
   * @secure
   */
  getFunctions = (code: string | null, params: RequestParams = {}) =>
    this.request<StringIEnumerableDataRes, any>({
      path: `/api/PubUser/GetFunctions/${code}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name SaveFunctions
   * @summary 保存用户权限
   * @request POST:/api/PubUser/SaveFunctions/{code}
   * @secure
   */
  saveFunctions = (code: string | null, data: string[] | null, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubUser/SaveFunctions/${code}`,
      method: 'POST',
      body: data,
      secure: true,
      type: ContentType.Json,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name Logout
   * @summary 注销登录
   * @request POST:/api/PubUser/Logout
   * @secure
   */
  logout = (params: RequestParams = {}) =>
    this.request<AxiosResponse, any>({
      path: `/api/PubUser/Logout`,
      method: 'POST',
      secure: true,
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name GetModel
   * @summary 获取用户实体
   * @request POST:/api/PubUser/GetModel/{id}
   * @secure
   */
  getModel = (id: number, params: RequestParams = {}) =>
    this.request<VPubuserDeptDataRes, any>({
      path: `/api/PubUser/GetModel/${id}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name ChangeUserStatus
   * @summary 启用 停用
   * @request POST:/api/PubUser/ChangeUserStatus
   * @secure
   */
  changeUserStatus = (
    data: {
      /** @format int64 */
      id?: number
      /** @format int32 */
      userStatus?: number
    },
    params: RequestParams = {}
  ) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubUser/ChangeUserStatus`,
      method: 'POST',
      body: data,
      secure: true,
      type: ContentType.FormData,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubUser
   * @name ResetPassWord
   * @summary 重置密码
   * @request POST:/api/PubUser/ResetPassWord
   * @secure
   */
  resetPassWord = (data: any, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubUser/ResetPassWord`,
      method: 'POST',
      body: data,
      secure: true,
      type: ContentType.Json,
      format: 'json',
      ...params,
    })


    /**
   * No description
   *
   * @tags PubUser
   * @name GetFunctions
   * @summary 获取用户角色权限
   * @request POST:/api/PubUser/GetFunctions/{code}
   * @secure
   */
  getRoleFunctions = (code: string | null, params: RequestParams = {}) =>
  this.request<StringIEnumerableDataRes, any>({
    path: `/api/PubUser/getRoleFunctions/${code}`,
    method: 'POST',
    secure: true,
    format: 'json',
    ...params,
  })
}
