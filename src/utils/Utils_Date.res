let ageLimitToDate = (ageLimit: App_Types.Age.ageLimit) => {
  let today = Date.make()

  switch ageLimit {
  | Months(months) => today->ReDate.addMonths((-1 * months)->Int.toFloat)
  | Years(years) => today->ReDate.addYears((-1 * years)->Int.toFloat)
  }
}
