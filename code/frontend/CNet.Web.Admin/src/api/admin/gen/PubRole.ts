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

import {
  BooleanDataRes,
  PageDataReq,
  PubRole,
  PubRoleDataRes,
  PubRoleListDataRes,
  PubRolePageDateRes,
  StringIEnumerableDataRes,
} from './data-contracts'
import { ContentType, HttpClient, RequestParams } from './http-client'

export class PubRoleApi<SecurityDataType = unknown> extends HttpClient<SecurityDataType> {
  /**
   * No description
   *
   * @tags PubRole
   * @name GetList
   * @request POST:/api/PubRole/GetList
   * @secure
   */
  getList = (params: RequestParams = {}) =>
    this.request<PubRoleListDataRes, any>({
      path: `/api/PubRole/GetList`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubRole
   * @name GetPage
   * @summary 获取角色分页
   * @request POST:/api/PubRole/GetPage
   * @secure
   */
  getPage = (data: PageDataReq, params: RequestParams = {}) =>
    this.request<PubRolePageDateRes, any>({
      path: `/api/PubRole/GetPage`,
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
   * @tags PubRole
   * @name Add
   * @summary 添加角色
   * @request POST:/api/PubRole/Add
   * @secure
   */
  add = (data: PubRole, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubRole/Add`,
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
   * @tags PubRole
   * @name Edit
   * @summary 编辑角色
   * @request POST:/api/PubRole/Edit
   * @secure
   */
  edit = (data: PubRole, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubRole/Edit`,
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
   * @tags PubRole
   * @name Delete
   * @summary 删除角色
   * @request POST:/api/PubRole/Delete/{id}
   * @secure
   */
  delete = (id: number, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubRole/Delete/${id}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubRole
   * @name GetFunctions
   * @summary 获取角色权限
   * @request POST:/api/PubRole/GetFunctions/{code}
   * @secure
   */
  getFunctions = (code: string | null, params: RequestParams = {}) =>
    this.request<StringIEnumerableDataRes, any>({
      path: `/api/PubRole/GetFunctions/${code}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubRole
   * @name SaveFunctions
   * @summary 保存角色权限
   * @request POST:/api/PubRole/SaveFunctions/{code}
   * @secure
   */
  saveFunctions = (code: string | null, data: string[] | null, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubRole/SaveFunctions/${code}`,
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
   * @tags PubRole
   * @name GetModel
   * @summary 获取实体
   * @request POST:/api/PubRole/GetModel/{code}
   * @secure
   */
  getModel = (code: string | null, params: RequestParams = {}) =>
    this.request<PubRoleDataRes, any>({
      path: `/api/PubRole/GetModel/${code}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
}
