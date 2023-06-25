open EmailUs_Form
open Mui
open Mui.Grid
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
        "SecureToken": "678157a9-d3e9-40c2-86d1-7a60817485de",
        "To": "drmorbid@seznam.cz",
        "From": "filip.kittnar@seznam.cz",
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
    afterHeader={<Mui.Typography variant=#subtitle1>
      {intl->ReactIntl.Intl.formatMessage(subHeader)->React.string}
    </Mui.Typography>}
    body=Element(
      <form onSubmit={form->Form.handleSubmit((input, form) => onSubmit(input, form)->ignore)}>
        <EmailUs_Alert \"open"=successAlertOpen severity=#success onClose=onSuccessClose>
          alertSuccess
        </EmailUs_Alert>
        <EmailUs_Alert
          \"open"={errorAlertOpen->Option.isSome}
          severity=#error
          onClose=onErrorClose
          messageValues=?{errorAlertOpen->Option.map(error => {"error": error})}>
          alertError
        </EmailUs_Alert>
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
            renderWithRegister={field =>
              form->FormInput.CityOfResidence.renderWithRegister(field, ())}
          />
          <EmailUs_Field
            label=parentPhoneLabel
            field=Field.parentPhone
            renderWithRegister={field => form->FormInput.ParentPhone.renderWithRegister(field, ())}
            \"type"={#tel}
          />
          <EmailUs_Field
            label=parentEmailLabel
            field=Field.parentEmail
            renderWithRegister={field => form->FormInput.ParentEmail.renderWithRegister(field, ())}
            \"type"={#email}
          />
          <EmailUs_Field
            label=noteLabel
            field=Field.note
            renderWithRegister={field => form->FormInput.Note.renderWithRegister(field, ())}
            multiline=true
            last=true
          />
          <Grid item=true xs=Xs.\"12">
            <Button \"type"={#submit->Button.Type.enum} color=#primary variant=#contained>
              {intl->ReactIntl.Intl.formatMessage(submitButton)->React.string}
            </Button>
          </Grid>
        </Grid>
      </form>,
    )
  />
}
