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
        childBirthdate: "",
        cityOfResidence: "",
        parentPhone: "",
        parentEmail: "",
        note: None,
      },
    },
  )

  let intl = ReactIntl.useIntl()

  let onSubmit = input => {
    Js.log2("FKR: email us page: submitting: %o", input)
    _ => ()
  }

  <form onSubmit={form->Form.handleSubmit(onSubmit)}>
    <Grid container=true spacing=#2>
      <EmailUs_Field
        label=parentNameLabel
        field=Field.parentName
        renderWithRegister={field => form->FormInput.ParentName.renderWithRegister(field, ())}
      />
      <EmailUs_Field
        label=childNameLabel
        field=Field.childName
        renderWithRegister={field => form->FormInput.ChildName.renderWithRegister(field, ())}
      />
      <EmailUs_Field
        label=childBirthdateLabel
        field=Field.childBirthdate
        renderWithRegister={field => form->FormInput.ChildBirthdate.renderWithRegister(field, ())}
      />
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
