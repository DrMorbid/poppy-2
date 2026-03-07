open Message.Gdpr

@react.component
let default = () => {
  let intl = ReactIntl.useIntl()

  <Common.Text
    header
    afterHeader={<Mui.Typography variant={H5}>
      {intl->ReactIntl.Intl.formatMessage(salutation)->React.string}
    </Mui.Typography>}
    body=Fragments(list{
      {
        content: list{Element(<Common.Text body=Paragraphs(list{{content: Message(mainText)}}) />)},
      },
      {
        content: list{
          Element(
            <Mui.Button variant=Contained startIcon={<Common.Icon.CheckCircleOutline />} size=Large>
              {intl->ReactIntl.Intl.formatMessage(agreeButton)->React.string}
            </Mui.Button>,
          ),
        },
        centered: true,
      },
      {
        content: list{
          Element(
            <Common.Text
              body=Paragraphs(list{{content: Message(agreementExplanation), italic: true}})
            />,
          ),
        },
        centered: true,
      },
    })
  />
}
