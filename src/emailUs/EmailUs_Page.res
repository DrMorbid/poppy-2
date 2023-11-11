open EmailUs_Form
open Message.EmailUs
open EmailUs_Utils

@react.component
let make = () => {
  let (successAlertOpen, setSuccessAlertOpen) = React.useState(() => false)
  let (errorAlertOpen, setErrorAlertOpen) = React.useState(() => None)

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

  let onSubmit = async (input, _) => {
    fetchEmailBody(
      ~parentName=input.parentName,
      ~childName=input.childName,
      ~childBirthdate=input.childBirthdate,
      ~cityOfResidence=input.cityOfResidence,
      ~parentPhone=input.parentPhone,
      ~parentEmail=input.parentEmail,
      ~note=?input.note
      ->Option.map(String.split(_, "\n"))
      ->Option.map(Array.map(_, line => `<p>${line}</p>`))
      ->Option.map(Array.joinWith(_, "")),
    )
    ->Promise.thenResolve(async body => {
      let message = await SmtpJs.email->SmtpJs.sendWithSecureToken({
        "SecureToken": EnvVar.SmtpJs.secureToken->Option.getWithDefault(""),
        "To": EnvVar.SmtpJs.to->Option.getWithDefault(""),
        "From": EnvVar.SmtpJs.from->Option.getWithDefault(""),
        "Subject": intl->ReactIntl.Intl.formatMessage(emailSubject),
        "Body": body,
      })

      if message->String.match(%re("/^ok$/i"))->Option.isSome {
        setSuccessAlertOpen(_ => true)
      } else {
        setErrorAlertOpen(_ => Some(message))
      }
    })
    ->ignore
  }

  let onSuccessClose = (_, _) => setSuccessAlertOpen(_ => false)
  let onErrorClose = (_, _) => setErrorAlertOpen(_ => None)

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
            {form->FormInput.ChildBirthdate.renderController(
              ({field: {onChange, value, _}, fieldState: {error, _}, _}) =>
                <MuiPickers.DatePicker
                  name="childBirthdate"
                  disableFuture=true
                  openTo=#year
                  format="d. M. yyyy"
                  views={[#year, #month, #date]}
                  fullWidth=true
                  margin=None
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
