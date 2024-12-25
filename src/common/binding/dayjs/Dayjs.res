type t
type utc

type unitOfTime = [
  | #day
  | #week
  | #month
  | #quarter
  | #year
  | #hour
  | #minute
  | #second
  | #millisecond
]

@module("dayjs") external now: unit => t = "default"
@module("dayjs") external fromDate: Date.t => t = "default"

@send external utc: t => t = "utc"
@send external format: t => string = "format"
@send external formatWithPattern: (t, string) => string = "format"
@send external toDate: t => Date.t = "toDate"
@send external add: (t, int, unitOfTime) => t = "add"
@send external subtract: (t, int, unitOfTime) => t = "subtract"
@send external isBefore: (t, t) => bool = "isBefore"
@send external isSame: (t, t) => bool = "isSame"
@send external isAfter: (t, t) => bool = "isAfter"
