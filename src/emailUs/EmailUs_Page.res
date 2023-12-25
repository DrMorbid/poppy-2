open EmailUs_Form
open Message.EmailUs
open EmailUs_Utils

@react.component
let make = () => {
  let (successAlertOpen, setSuccessAlertOpen) = React.useState(() => false)
  let (errorAlertOpen, setErrorAlertOpen) = React.useState(() => None)
  let (dateErrorMessage, setDateErrorMessage) = React.useState(() => None)

  let form = Form.use(
    ~config={
      defaultValues: {
        parentName: "",
        childName: "",
        childBirthdate: Some(Date.make()),
        cityOfResidence: "",
        parentPhone: "",
        parentEmail: "",
        note: None,
      },
    },
  )

  let intl = ReactIntl.useIntl()

  let onSubmit = async (input, _) =>
    fetchEmailBody(
      ~parentName=input.parentName,
      ~childName=input.childName,
      ~childBirthdate=?input.childBirthdate,
      ~cityOfResidence=input.cityOfResidence,
      ~parentPhone=input.parentPhone,
      ~parentEmail=input.parentEmail,
      ~note=?input.note
      ->Option.map(String.split(_, "\n"))
      ->Option.map(Array.map(_, line => `<p>${line}</p>`))
      ->Option.map(Array.joinWith(_, "")),
    )
    ->Promise.thenResolve(async body => {
      if input.childBirthdate->Option.isSome {
        let message = await SmtpJs.email->SmtpJs.sendWithSecureToken({
          "SecureToken": EnvVar.SmtpJs.secureToken->Option.getOr(""),
          "To": EnvVar.SmtpJs.to->Option.getOr(""),
          "From": EnvVar.SmtpJs.from->Option.getOr(""),
          "Subject": intl->ReactIntl.Intl.formatMessage(emailSubject),
          "Body": body,
        })

        if message->String.match(%re("/^ok$/i"))->Option.isSome {
          setSuccessAlertOpen(_ => true)
        } else {
          setErrorAlertOpen(_ => Some(message))
        }
      } else {
        setErrorAlertOpen(_ => Some(Message.Date.dateMissing.defaultMessage))
      }
    })
    ->ignore

  let onSuccessClose = (_, _) => setSuccessAlertOpen(_ => false)
  let onErrorClose = (_, _) => setErrorAlertOpen(_ => None)

  let onChildBirthdateChange = (onFormFieldChange, date) =>
    date
    ->Nullable.toOption
    ->Option.map(DayJs.toDate)
    ->Option.flatMap(date => date->Utils.Date.isValid ? Some(date) : None)
    ->onFormFieldChange

  <Common.Text
    header
    afterHeader={<Mui.Typography variant=Subtitle1>
      {intl->ReactIntl.Intl.formatMessage(subHeader)->React.string}
    </Mui.Typography>}
    body=Element(
      <form
        onSubmit={form->Form.handleSubmit((input, form) => onSubmit(input, form)->ignore)}
        autoComplete="on">
        <EmailUs_Alert open_=successAlertOpen severity=Success onClose=onSuccessClose>
          alertSuccess
        </EmailUs_Alert>
        <EmailUs_Alert
          open_={errorAlertOpen->Option.isSome}
          severity=Error
          onClose=onErrorClose
          messageValues=?{errorAlertOpen->Option.map(error => {"error": error})}>
          alertError
        </EmailUs_Alert>
        <Mui.Grid container=true spacing=Int(2)>
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
          <Mui.Grid item=true xs=Number(12) sm=Number(6) md=Number(4) lg=Number(3) xl=Number(2)>
            {form->FormInput.ChildBirthdate.renderController(({field: {onChange, value, _}, _}) =>
              <MuiXDatePicker.DatePicker
                name="childBirthdate"
                disableFuture=true
                openTo=#year
                format="D. M. YYYY"
                views={[#year, #month, #day]}
                label={intl->ReactIntl.Intl.formatMessage(childBirthdateLabel)->Jsx.string}
                required=Field.childBirthdate.required
                onChange={onChildBirthdateChange(onChange)}
                value=?{value->Option.map(DayJs.dayjs)}
                minDate={Common.Constants.highestChildAge->Utils.Date.ageLimitToDate->DayJs.dayjs}
                maxDate={Common.Constants.lowestChildAge->Utils.Date.ageLimitToDate->DayJs.dayjs}
                sx={Mui.Sx.array([Mui.Sx.Array.obj({width: Mui.System.Value.String("100%")})])}
                onError={(error, value) =>
                  setDateErrorMessage(_ =>
                    if value->Nullable.toOption->Option.isNone {
                      Some(Message.Date.dateMissing)
                    } else {
                      error->Nullable.toOption->Option.map(Utils.Date.dateErrorToMessage)
                    }
                  )}
                slotProps={dateErrorMessage
                ->Option.map((dateErrorMessage): MuiXDatePicker.DatePicker.SlotProps.t => {
                  textField: {
                    helperText: intl->ReactIntl.Intl.formatMessage(dateErrorMessage)->Jsx.string,
                    error: true,
                    variant: Standard,
                  },
                })
                ->Option.getOr({textField: {variant: Standard}})}
              />
            , ())}
          </Mui.Grid>
          <EmailUs_Field
            label=cityOfResidenceLabel
            field=Field.cityOfResidence
            renderWithRegister={field =>
              form->FormInput.CityOfResidence.renderWithRegister(field, ())}
          />
          <EmailUs_Field
            label=parentPhoneLabel
            field=Field.parentPhone
            renderWithRegister={field => form->FormInput.ParentPhone.renderWithRegister(field, ())}
            type_=#tel
          />
          <EmailUs_Field
            label=parentEmailLabel
            field=Field.parentEmail
            renderWithRegister={field => form->FormInput.ParentEmail.renderWithRegister(field, ())}
            type_=#email
          />
          <EmailUs_Field
            label=noteLabel
            field=Field.note
            renderWithRegister={field => form->FormInput.Note.renderWithRegister(field, ())}
            multiline=true
            last=true
          />
          <Mui.Grid item=true xs=Number(12)>
            <Mui.Button type_=Submit color=Primary variant=Contained>
              {intl->ReactIntl.Intl.formatMessage(submitButton)->React.string}
            </Mui.Button>
          </Mui.Grid>
        </Mui.Grid>
      </form>,
    )
  />
}
