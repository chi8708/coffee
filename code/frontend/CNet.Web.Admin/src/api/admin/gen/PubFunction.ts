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
  MenuListDataRes,
  PubFunction,
  PubFunctionDataRes,
  PubFunctionListDataRes,
  VPubfunctionParentListDataRes,
} from './data-contracts'
import { ContentType, HttpClient, RequestParams } from './http-client'

export class PubFunctionApi<SecurityDataType = unknown> extends HttpClient<SecurityDataType> {
  /**
   * No description
   *
   * @tags PubFunction
   * @name GetList
   * @request POST:/api/PubFunction/GetList
   * @secure
   */
  getList = (params: RequestParams = {}) =>
    this.request<PubFunctionListDataRes, any>({
      path: `/api/PubFunction/GetList`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubFunction
   * @name GetChildList
   * @summary 获取子权限列表
   * @request POST:/api/PubFunction/GetChildList
   * @secure
   */
  getChildList = (
    query?: {
      /** @default "FC001" */
      code?: string | null
    },
    params: RequestParams = {}
  ) =>
    this.request<VPubfunctionParentListDataRes, any>({
      path: `/api/PubFunction/GetChildList`,
      method: 'POST',
      query: query,
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubFunction
   * @name GetChildList2
   * @summary 获取子权限列表
   * @request POST:/api/PubFunction/GetChildList/{code}
   * @originalName getChildList
   * @duplicate
   * @secure
   */
  getChildList2 = (code: string | null, params: RequestParams = {}) =>
    this.request<VPubfunctionParentListDataRes, any>({
      path: `/api/PubFunction/GetChildList/${code}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubFunction
   * @name Add
   * @summary 添加
   * @request POST:/api/PubFunction/Add
   * @secure
   */
  add = (data: PubFunction, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubFunction/Add`,
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
   * @tags PubFunction
   * @name Edit
   * @summary 编辑
   * @request POST:/api/PubFunction/Edit
   * @secure
   */
  edit = (data: PubFunction, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubFunction/Edit`,
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
   * @tags PubFunction
   * @name Delete
   * @summary 删除
   * @request POST:/api/PubFunction/Delete/{id}
   * @secure
   */
  delete = (id: string | null, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubFunction/Delete/${id}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubFunction
   * @name GetMenu
   * @summary 获取左侧菜单
   * @request POST:/api/PubFunction/GetMenu
   * @secure
   */
  getMenu = (params: RequestParams = {}) =>
    this.request<MenuListDataRes, any>({
      path: `/api/PubFunction/GetMenu`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubFunction
   * @name GetModel
   * @summary 获取实体
   * @request POST:/api/PubFunction/GetModel/{code}
   * @secure
   */
  getModel = (code: string | null, params: RequestParams = {}) =>
    this.request<PubFunctionDataRes, any>({
      path: `/api/PubFunction/GetModel/${code}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
}
