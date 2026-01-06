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

export interface LoginViewModel {
  /** 账号 */
  userName?: string | null
  /** 密码 */
  password?: string | null
  /** 密码键 */
  passwordKey?: string | null
  /** 验证码Id */
  captchaId?: string | null
  /** 验证码数据 */
  captchaData?: string | null
}

/** 泛型结果输出接口 */
export interface BooleanIResultOutput {
  /** 返回数据 */
  data?: boolean
  /** 是否成功 */
  success?: boolean
  /** 消息 */
  msg?: string | null
  /** 编码 */
  code?: string | null
}

export interface PubFunction {
  functionCode?: string | null
  functionChina?: string | null
  functionDescrip?: string | null
  parentCode?: string | null
  menuFlag?: boolean
  stopFlag?: boolean | null
  urlString?: string | null
  /** @format date-time */
  lmdt?: string | null
  lmid?: string | null
  /** @format int32 */
  sortId?: number | null
  pageTarget?: string | null
  menuIcon?: string | null
  routerPath?: string | null
  isCache?: boolean | null
}

/** 泛型结果输出接口 */
export interface PubFunctionListIResultOutput {
  /** 返回数据 */
  data?: PubFunction[] | null
  /** 是否成功 */
  success?: boolean
  /** 消息 */
  msg?: string | null
  /** 编码 */
  code?: string | null
}

export interface CaptchaData {
  id?: string | null
  backgroundImage?: string | null
  sliderImage?: string | null
}

/** 泛型结果输出接口 */
export interface CaptchaDataIResultOutput {
  data?: CaptchaData
  /** 是否成功 */
  success?: boolean
  /** 消息 */
  msg?: string | null
  /** 编码 */
  code?: string | null
}

export interface Track {
  /** @format int32 */
  x?: number
  /** @format int32 */
  y?: number
  /** @format int32 */
  t?: number
}

export interface SlideTrack {
  /** @format int32 */
  backgroundImageWidth?: number
  /** @format int32 */
  backgroundImageHeight?: number
  /** @format int32 */
  sliderImageWidth?: number
  /** @format int32 */
  sliderImageHeight?: number
  /** @format date-time */
  startTime?: string
  /** @format date-time */
  endTime?: string
  tracks?: Track[] | null
  /** @format float */
  percent?: number
}

/** @format int32 */
export type ValidateResultType = 0 | 1 | 2

export interface ValidateResult {
  result?: ValidateResultType
  message?: string | null
}

/** 泛型结果输出接口 */
export interface ValidateResultIResultOutput {
  data?: ValidateResult
  /** 是否成功 */
  success?: boolean
  /** 消息 */
  msg?: string | null
  /** 编码 */
  code?: string | null
}

/** @format int32 */
export type ResCode = 0 | 1 | -1

export interface PubDepartment {
  deptCode?: string | null
  deptName?: string | null
  remark?: string | null
  parentCode?: string | null
  /** @format int32 */
  deptLevel?: number
  lmid?: string | null
  /** @format date-time */
  lmdt?: string | null
  stopFlag?: boolean | null
}

export interface PubDepartmentListDataRes {
  code?: ResCode
  msg?: string | null
  data?: PubDepartment[] | null
}

export interface VPubdeptParent {
  deptCode?: string | null
  deptName?: string | null
  remark?: string | null
  parentCode?: string | null
  /** @format int32 */
  deptLevel?: number
  lmid?: string | null
  /** @format date-time */
  lmdt?: string | null
  stopFlag?: boolean | null
  parentName?: string | null
}

export interface VPubdeptParentListDataRes {
  code?: ResCode
  msg?: string | null
  data?: VPubdeptParent[] | null
}

export interface BooleanDataRes {
  code?: ResCode
  msg?: string | null
  data?: boolean
}

export interface PubDepartmentDataRes {
  code?: ResCode
  msg?: string | null
  data?: PubDepartment
}

export interface PubFunctionListDataRes {
  code?: ResCode
  msg?: string | null
  data?: PubFunction[] | null
}

export interface VPubfunctionParent {
  functionCode?: string | null
  functionChina?: string | null
  functionDescrip?: string | null
  parentCode?: string | null
  menuFlag?: boolean
  stopFlag?: boolean | null
  urlString?: string | null
  /** @format date-time */
  lmdt?: string | null
  lmid?: string | null
  /** @format int32 */
  sortId?: number | null
  pageTarget?: string | null
  menuIcon?: string | null
  routerPath?: string | null
  isCache?: boolean | null
  parentName?: string | null
}

export interface VPubfunctionParentListDataRes {
  code?: ResCode
  msg?: string | null
  data?: VPubfunctionParent[] | null
}

export interface Meta {
  /** 图标 */
  icon?: string | null
  /** 不缓存 */
  notCache?: boolean | null
  /** 标题 */
  title?: string | null
  /** 权限列表 */
  access?: string[] | null
  /** 是否新窗口 */
  isNewWindow?: boolean
}

export interface Menu {
  /** 路由路径 */
  path?: string | null
  /** 名称 */
  name?: string | null
  meta?: Meta
  /** 子组件 */
  children?: Menu[] | null
  component?: string | null
}

export interface MenuListDataRes {
  code?: ResCode
  msg?: string | null
  data?: Menu[] | null
}

export interface PubFunctionDataRes {
  code?: ResCode
  msg?: string | null
  data?: PubFunction
}

export interface PubRole {
  /** @format int32 */
  id?: number
  roleCode?: string | null
  roleName?: string | null
  remark?: string | null
  stopFlag?: boolean
  crid?: string | null
  /** @format date-time */
  crdt?: string | null
  lmid?: string | null
  /** @format date-time */
  lmdt?: string | null
}

export interface PubRoleListDataRes {
  code?: ResCode
  msg?: string | null
  data?: PubRole[] | null
}

export interface PageDataReq {
  /** @format int32 */
  pageNum?: number
  /** @format int32 */
  pageSize?: number
  field?: string | null
  order?: string | null
  query?: Record<string, any>
}

export interface PubRolePageDateRes {
  code?: ResCode
  msg?: string | null
  /** @format int32 */
  count?: number
  /** @format int32 */
  totalPage?: number
  data?: PubRole[] | null
  /** @format int32 */
  pageNum?: number
  /** @format int32 */
  pageSize?: number
}

export interface StringIEnumerableDataRes {
  code?: ResCode
  msg?: string | null
  data?: string[] | null
}

export interface PubRoleDataRes {
  code?: ResCode
  msg?: string | null
  data?: PubRole
}

export interface VPubuserDept {
  roleCodes?: string[] | null
  roleNames?: string[] | null
  /** @format int32 */
  id?: number
  userCode?: string | null
  userName?: string | null
  realName?: string | null
  userPwd?: string | null
  sex?: boolean
  identityNo?: string | null
  /** @format date-time */
  birthday?: string | null
  deptCode?: string | null
  managerFlag?: boolean
  tel?: string | null
  eMail?: string | null
  qq?: string | null
  remark?: string | null
  stopFlag?: boolean
  crid?: string | null
  /** @format date-time */
  crdt?: string | null
  lmid?: string | null
  /** @format date-time */
  lmdt?: string | null
  /** @format date-time */
  loginDate?: string | null
  provinceCode?: string | null
  cityCode?: string | null
  regionCode?: string | null
  userAddress?: string | null
  wxcode?: string | null
  headUrl?: string | null
  /** @format int32 */
  userStatus?: number | null
  deptName?: string | null
}

export interface VPubuserDeptPageDateRes {
  code?: ResCode
  msg?: string | null
  /** @format int32 */
  count?: number
  /** @format int32 */
  totalPage?: number
  data?: VPubuserDept[] | null
  /** @format int32 */
  pageNum?: number
  /** @format int32 */
  pageSize?: number
}

export interface VPubuserDeptDataRes {
  code?: ResCode
  msg?: string | null
  data?: VPubuserDept
}
