type input = {
  parentName: string,
  childName: string,
  childBirthdate: Date.t,
  cityOfResidence: string,
  parentPhone: string,
  parentEmail: string,
  note: option<string>,
}

module Field = {
  type t = {required: bool}

  let parentName = {
    required: true,
  }
  let childName = {
    required: true,
  }
  let childBirthdate = {
    required: true,
  }
  let cityOfResidence = {
    required: true,
  }
  let parentPhone = {
    required: true,
  }
  let parentEmail = {
    required: true,
  }
  let note = {
    required: false,
  }
}

module Form = ReactHookForm.Make({
  type t = input
})

module FormInput = {
  module ParentName = Form.MakeInput({
    type t = string
    let name = "parentName"
    let config = ReactHookForm.Rules.make({
      required: Field.parentName.required,
    })
  })

  module ChildName = Form.MakeInput({
    type t = string
    let name = "childName"
    let config = ReactHookForm.Rules.make({
      required: Field.childName.required,
    })
  })

  module ChildBirthdate = Form.MakeInput({
    type t = Date.t
    let name = "childBirthdate"
    let config = ReactHookForm.Rules.make({
      required: Field.childBirthdate.required,
      validate: Dict.fromArray([
        (
          "min",
          ReactHookForm.Validation.sync(date => {
            if date->ReDate.isBefore(Common.Constants.highestChildAge->Utils.Date.ageLimitToDate) {
              Some("min")
            } else {
              None
            }
          }),
        ),
        (
          "max",
          ReactHookForm.Validation.sync(date => {
            if date->ReDate.isAfter(Common.Constants.lowestChildAge->Utils.Date.ageLimitToDate) {
              Some("max")
            } else {
              None
            }
          }),
        ),
      ]),
    })
  })

  module CityOfResidence = Form.MakeInput({
    type t = string
    let name = "cityOfResidence"
    let config = ReactHookForm.Rules.make({
      required: Field.cityOfResidence.required,
    })
  })

  module ParentPhone = Form.MakeInput({
    type t = string
    let name = "parentPhone"
    let config = ReactHookForm.Rules.make({
      required: Field.parentPhone.required,
    })
  })

  module ParentEmail = Form.MakeInput({
    type t = string
    let name = "parentEmail"
    let config = ReactHookForm.Rules.make({
      required: Field.parentEmail.required,
    })
  })

  module Note = Form.MakeInput({
    type t = option<string>
    let name = "note"
    let config = ReactHookForm.Rules.make({
      required: Field.note.required,
    })
  })
}
