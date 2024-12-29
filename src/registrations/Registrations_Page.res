open Message.Registrations

@react.component
let default = () => {
  let registrationsYoungestTopRef = React.useRef(null)
  let registrationsMiddleTopRef = React.useRef(null)
  let registrationsOldestTopRef = React.useRef(null)
  let currentRegistrationDatesTopRef = React.useRef(null)
  let intl = ReactIntl.useIntl()
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect(() => {
    dispatch(
      App_Context.AddRegistrationsMenuItemScrollableRef(
        RegistrationsYoungest,
        registrationsYoungestTopRef,
      ),
    )
    dispatch(
      App_Context.AddRegistrationsMenuItemScrollableRef(
        RegistrationsMiddle,
        registrationsMiddleTopRef,
      ),
    )
    dispatch(
      App_Context.AddRegistrationsMenuItemScrollableRef(
        RegistrationsOldest,
        registrationsOldestTopRef,
      ),
    )
    dispatch(
      App_Context.AddRegistrationsMenuItemScrollableRef(
        CurrentRegistrationDates,
        currentRegistrationDatesTopRef,
      ),
    )

    None
  }, (
    registrationsYoungestTopRef,
    registrationsMiddleTopRef,
    registrationsOldestTopRef,
    currentRegistrationDatesTopRef,
  ))

  <Common.Text
    header
    body=Element(
      <App_ScrollableSections
        sections={list{
          {
            element: <Common.Text
              header=Message.registrationsYoungest
              headerVariant=H4
              body={Lists(list{
                {
                  list: list{
                    {content: Message(youngestKidsLine1)},
                    {content: Message(youngestKidsLine2)},
                    {content: Message(youngestKidsLine3)},
                    {content: Message(youngestKidsLine4)},
                    {content: Message(youngestKidsLine5)},
                  },
                },
              })}
            />,
            topRef: registrationsYoungestTopRef,
          },
          {
            element: <Common.Text
              header=Message.registrationsMiddle
              headerVariant=H4
              afterHeader={<Mui.Typography variant={H5}>
                {intl
                ->ReactIntl.Intl.formatMessage(Message.registrationsMiddleSubheader)
                ->Jsx.string}
              </Mui.Typography>}
              body={Lists(list{
                {
                  list: list{
                    {
                      content: Fragments(list{
                        Text({content: Message(middleKidsLine1Part1), appendSpace: true}),
                        Text({
                          content: Message(middleKidsLine1Part2),
                          bold: true,
                          color: #error,
                        }),
                      }),
                      bold: true,
                    },
                    {content: Message(middleKidsLine2)},
                    {content: Message(middleKidsLine3)},
                    {content: Message(middleKidsLine4), bold: true},
                  },
                },
              })}
            />,
            topRef: registrationsMiddleTopRef,
          },
          {
            element: <Common.Text
              header=Message.registrationsOldest
              headerVariant=H4
              body={Lists(list{
                {
                  list: list{
                    {content: Message(oldestKidsLine1)},
                    {content: Message(oldestKidsLine2), bold: true},
                    {
                      content: Fragments(list{
                        Text({content: Message(oldestKidsLine3Part1), appendSpace: true}),
                        Text({
                          content: Message(oldestKidsLine3Part2),
                          bold: true,
                        }),
                      }),
                      bold: true,
                    },
                    {content: Message(oldestKidsLine4)},
                    {content: Message(oldestKidsLine5)},
                  },
                },
              })}
            />,
            topRef: registrationsOldestTopRef,
          },
          {
            element: <News.Section
              header=currentRegistrationDates headerVariant=H3 headerUppercase=true
            />,
            topRef: currentRegistrationDatesTopRef,
            accented: Yellow,
          },
        }}
        coloredSections=Odd
      />,
    )
  />
}
