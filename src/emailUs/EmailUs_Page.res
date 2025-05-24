open EmailUs_Form
open Message.EmailUs
open EmailUs_Utils

@react.component
let default = () => {
  let (dateErrorMessage, setDateErrorMessage) = React.useState(() => None)
  let (emailBeingSent, setEmailBeingSent) = React.useState(() => false)

  let form = Form.use(
    ~config={
      defaultValues: defaultValues,
    },
  )

  let intl = ReactIntl.useIntl()
  let router = Next.Navigation.useRouter()

  let (_, dispatch) = React.useContext(App_Context.Context.t)

  let onSubmit = async (input, _) => {
    setEmailBeingSent(_ => true)

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
      ->Option.map(Array.join(_, "")),
    )
    ->Promise.thenResolve(async body =>
      if input.childBirthdate->Option.isSome {
        body->send(
          ~sender=EnvVar.Email.sender->Option.getOr(""),
          ~recipient=EnvVar.Email.recipient->Option.getOr(""),
          ~subject=intl->ReactIntl.Intl.formatMessage(emailSubject),
          ~onSuccess=() => {
            setEmailBeingSent(_ => false)
            dispatch(
              App_Context.ShowAlert({
                severity: Success,
                body: alertSuccess,
                onClose: (_, _) => dispatch(HideAlert),
              }),
            )
            form->Form.reset(defaultValues)
            router->App_Page.goTo(Home)
          },
          ~onError=error => {
            setEmailBeingSent(_ => false)
            dispatch(
              App_Context.ShowAlert({
                severity: Error,
                body: alertError,
                bodyParameters: {"error": error},
                onClose: (_, _) => dispatch(HideAlert),
              }),
            )
          },
        )
      } else {
        dispatch(
          App_Context.ShowAlert({
            severity: Error,
            body: alertError,
            bodyParameters: {"error": Message.Date.dateMissing.defaultMessage},
            onClose: (_, _) => dispatch(HideAlert),
          }),
        )
      }
    )
    ->ignore
  }

  let onChildBirthdateChange = (onFormFieldChange, date) =>
    date
    ->Nullable.toOption
    ->Option.map(Dayjs.toDate)
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
                onChange={onChildBirthdateChange(onChange, _)}
                value=?{value->Option.map(Dayjs.fromDate)}
                minDate={Common.Constants.highestChildAge->Utils.Date.ageLimitToDate}
                maxDate={Common.Constants.lowestChildAge->Utils.Date.ageLimitToDate}
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
            {if emailBeingSent {
              <MuiLab.LoadingButton loading=true color=Primary variant=Contained>
                {intl->ReactIntl.Intl.formatMessage(submitButton)->React.string}
              </MuiLab.LoadingButton>
            } else {
              <Mui.Button type_=Submit color=Primary variant=Contained>
                {intl->ReactIntl.Intl.formatMessage(submitButton)->React.string}
              </Mui.Button>
            }}
          </Mui.Grid>
        </Mui.Grid>
      </form>,
    )
  />
}
