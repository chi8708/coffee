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
import { BooleanIResultOutput, LoginViewModel, PubFunctionListIResultOutput } from './data-contracts'
import { ContentType, HttpClient, RequestParams } from './http-client'

export class AuthroizeApi<SecurityDataType = unknown> extends HttpClient<SecurityDataType> {
  /**
   * No description
   *
   * @tags Authroize
   * @name Authroize
   * @summary 登录获取token
   * @request POST:/api/Authroize
   * @secure
   */
  authroize = (data: LoginViewModel, params: RequestParams = {}) =>
    this.request<AxiosResponse, any>({
      path: `/api/Authroize`,
      method: 'POST',
      body: data,
      secure: true,
      type: ContentType.Json,
      ...params,
    })
  /**
   * No description
   *
   * @tags Authroize
   * @name IsCaptcha
   * @summary 是否开启验证码
   * @request GET:/api/Authroize/isCaptcha
   * @secure
   */
  isCaptcha = (params: RequestParams = {}) =>
    this.request<BooleanIResultOutput, any>({
      path: `/api/Authroize/isCaptcha`,
      method: 'GET',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags Authroize
   * @name GetUserMenu
   * @summary 获取菜单
   * @request POST:/api/Authroize/GetUserMenu
   * @secure
   */
  getUserMenu = (params: RequestParams = {}) =>
    this.request<PubFunctionListIResultOutput, any>({
      path: `/api/Authroize/GetUserMenu`,
      method: 'POST',
      secure: true,
      format: 'json',
      ...params,
    })
  /**
   * No description
   *
   * @tags Authroize
   * @name GetUserAccess
   * @summary 获取菜单
   * @request POST:/api/Authroize/GetUserAccess
   * @secure
   */
  getUserAccess = (params: RequestParams = {}) =>
    this.request<AxiosResponse, any>({
      path: `/api/Authroize/GetUserAccess`,
      method: 'POST',
      secure: true,
      ...params,
    })
}
