type t

@module("dayjs") external dayjs: Date.t => t = "default"

@send external toDate: t => Date.t = "toDate"
