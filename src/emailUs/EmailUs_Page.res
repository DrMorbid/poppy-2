open EmailUs_Form
open Mui
open Mui.Grid
open Message.EmailUs

// // TODO: log
//     Js.Console.log("Sending an email...")

//     let message = await SmtpJs.email->SmtpJs.sendWithSecureToken({
//       "SecureToken": "678157a9-d3e9-40c2-86d1-7a60817485de",
//       "To": "drmorbid@seznam.cz",
//       "From": "filip.kittnar@seznam.cz",
//       "Subject": "This is a test email",
//       "Body": "Well... Did it arrive?",
//     })

//     // TODO: log
//     Js.Console.log2("Email sent: ", message)

@react.component
let make = () => {
  let form = Form.use(
    ~config={
      defaultValues: {
        parentName: "",
        childName: "",
        childBirthdate: Date.make(),
        cityOfResidence: "",
        parentPhone: "",
        parentEmail: "",
        note: None,
      },
    },
  )

  let intl = ReactIntl.useIntl()

  let onSubmit = (input, _) => {
    Js.log2("FKR: email us page: submitting: %o", input)
  }

  Js.log3(
    "FKR: email us page: render: %s, %o",
    form->FormInput.ChildBirthdate.invalid,
    (form->Form.formState).errors,
  )

  <form onSubmit={form->Form.handleSubmit(onSubmit)}>
    <Grid container=true spacing=#2>
      <EmailUs_Field
        label=parentNameLabel
        field=Field.parentName
        renderWithRegister={field => form->FormInput.ParentName.renderWithRegister(field, ())}
        autoFocus=true
      />
      <EmailUs_Field
        label=childNameLabel
        field=Field.childName
        renderWithRegister={field => form->FormInput.ChildName.renderWithRegister(field, ())}
      />
      <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4" lg=Lg.\"3" xl=Xl.\"2">
        {form->FormInput.ChildBirthdate.renderController(
          ({field: {onChange, value, _}, fieldState: {error, _}, _}) =>
            <MuiPickers.DatePicker
              name="childBirthdate"
              disableFuture=true
              openTo=#year
              format="d. M. yyyy"
              views={[#year, #month, #date]}
              fullWidth=true
              margin=#none
              label={intl->ReactIntl.Intl.formatMessage(childBirthdateLabel)->Jsx.string}
              required=Field.childBirthdate.required
              onChange
              value
              error={error->Option.isSome}
              helperText=?{error->Option.isSome
                ? Some(intl->ReactIntl.Intl.formatMessage(childBirthdateHelperText)->Jsx.string)
                : None}
              minDate={Common.Constants.highestChildAge->Utils.Date.ageLimitToDate}
              maxDate={Common.Constants.lowestChildAge->Utils.Date.ageLimitToDate}
            />,
          (),
        )}
      </Grid>
      <EmailUs_Field
        label=cityOfResidenceLabel
        field=Field.cityOfResidence
        renderWithRegister={field => form->FormInput.CityOfResidence.renderWithRegister(field, ())}
      />
      <EmailUs_Field
        label=parentPhoneLabel
        field=Field.parentPhone
        renderWithRegister={field => form->FormInput.ParentPhone.renderWithRegister(field, ())}
      />
      <EmailUs_Field
        label=parentEmailLabel
        field=Field.parentEmail
        renderWithRegister={field => form->FormInput.ParentEmail.renderWithRegister(field, ())}
      />
      <EmailUs_Field
        label=noteLabel
        field=Field.note
        renderWithRegister={field => form->FormInput.Note.renderWithRegister(field, ())}
      />
      <Grid item=true xs=Xs.\"12">
        <Button \"type"={#submit->Button.Type.enum} color=#primary variant=#contained>
          {intl->ReactIntl.Intl.formatMessage(submitButton)->React.string}
        </Button>
      </Grid>
    </Grid>
  </form>
}