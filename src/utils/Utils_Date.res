let ageLimitToDate = (ageLimit: App_Types.Age.ageLimit) => {
  let today = Dayjs.now()

  switch ageLimit {
  | Months(months) => today->Dayjs.subtract(months, #month)
  | Years(years) => today->Dayjs.subtract(years, #year)
  }
}

let dateErrorToMessage = (error: MuiXDatePicker.DatePicker.error) => {
  let result = switch error {
  | #minDate => Message.Date.dateTooLow
  | #maxDate => Message.Date.dateTooHigh
  | #invalidDate => Message.Date.dateInvalid
  | _ => Message.Date.dateMissing
  }

  result
}

let isValid = date => date->Date.toString->String.equal("Invalid Date") ? false : true
