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

import { BooleanDataRes, PubDepartment, PubDepartmentDataRes, PubDepartmentListDataRes, VPubdeptParentListDataRes } from './data-contracts'
import { ContentType, HttpClient, RequestParams } from './http-client'

export class PubDeptApi<SecurityDataType = unknown> extends HttpClient<SecurityDataType> {
  /**
   * No description
   *
   * @tags PubDept
   * @name GetList
   * @request POST:/api/PubDept/GetList
   * @secure
   */
  getList = (params: RequestParams = {}) =>
    this.request<PubDepartmentListDataRes, any>({
      path: `/api/PubDept/GetList`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubDept
   * @name GetChildList
   * @summary 获取子部门列表
   * @request POST:/api/PubDept/GetChildList
   * @secure
   */
  getChildList = (
    query?: {
      /** @default "D000001" */
      code?: string | null
    },
    params: RequestParams = {}
  ) =>
    this.request<VPubdeptParentListDataRes, any>({
      path: `/api/PubDept/GetChildList`,
      method: 'POST',
      query: query,
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubDept
   * @name GetChildList2
   * @summary 获取子部门列表
   * @request POST:/api/PubDept/GetChildList/{code}
   * @originalName getChildList
   * @duplicate
   * @secure
   */
  getChildList2 = (code: string | null, params: RequestParams = {}) =>
    this.request<VPubdeptParentListDataRes, any>({
      path: `/api/PubDept/GetChildList/${code}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubDept
   * @name Add
   * @summary 添加
   * @request POST:/api/PubDept/Add
   * @secure
   */
  add = (data: PubDepartment, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubDept/Add`,
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
   * @tags PubDept
   * @name Edit
   * @summary 编辑
   * @request POST:/api/PubDept/Edit
   * @secure
   */
  edit = (data: PubDepartment, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubDept/Edit`,
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
   * @tags PubDept
   * @name Delete
   * @summary 删除
   * @request POST:/api/PubDept/Delete/{id}
   * @secure
   */
  delete = (id: string | null, params: RequestParams = {}) =>
    this.request<BooleanDataRes, any>({
      path: `/api/PubDept/Delete/${id}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags PubDept
   * @name GetModel
   * @summary 获取实体
   * @request POST:/api/PubDept/GetModel/{code}
   * @secure
   */
  getModel = (code: string | null, params: RequestParams = {}) =>
    this.request<PubDepartmentDataRes, any>({
      path: `/api/PubDept/GetModel/${code}`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
}
