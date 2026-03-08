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
              header=titleYoungest
              headerVariant=H4
              body={Lists(list{
                {
                  list: list{
                    {
                      content: Message(youngestKidsLine1),
                      bold: true,
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(youngestKidsLine2Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({content: Message(youngestKidsLine2Part2), appendSpace: true}),
                        Text({content: Message(youngestKidsLine2Part3), bold: true}),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(youngestKidsLine3Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(youngestKidsLine3Part2),
                        }),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(youngestKidsLine4Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(youngestKidsLine4Part2),
                        }),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(youngestKidsLine5Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(youngestKidsLine5Part2),
                        }),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(youngestKidsLine6Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(youngestKidsLine6Part2),
                        }),
                      }),
                    },
                  },
                },
              })}
            />,
            topRef: registrationsYoungestTopRef,
          },
          {
            element: <Common.Text
              header=titleMiddle
              headerVariant=H4
              afterHeader={<Mui.Typography variant={H5}>
                {intl
                ->ReactIntl.Intl.formatMessage(titleMiddleSubheader)
                ->Jsx.string}
              </Mui.Typography>}
              body={Lists(list{
                {
                  list: list{
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(middleKidsLine1Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(middleKidsLine1Part2),
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(middleKidsLine1Part3),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(middleKidsLine1Part4),
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(middleKidsLine1Part5),
                          bold: true,
                        }),
                        Text({
                          content: String("."),
                        }),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(middleKidsLine2Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(middleKidsLine2Part2),
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(middleKidsLine2Part3),
                          bold: true,
                        }),
                        Text({
                          content: String("."),
                        }),
                      }),
                    },
                    {content: Message(middleKidsLine3)},
                  },
                },
              })}
            />,
            topRef: registrationsMiddleTopRef,
          },
          {
            element: <Common.Text
              header=titleOldest
              headerVariant=H4
              body={Lists(list{
                {
                  list: list{
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(oldestKidsLine1),
                          bold: true,
                        }),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(oldestKidsLine2Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(oldestKidsLine2Part2),
                        }),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(oldestKidsLine3Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(oldestKidsLine3Part2),
                        }),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(oldestKidsLine4Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(oldestKidsLine4Part2),
                        }),
                      }),
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(oldestKidsLine5Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(oldestKidsLine5Part2),
                        }),
                      }),
                    },
                    {content: Message(oldestKidsLine6), bold: true},
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(oldestKidsLine7Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(oldestKidsLine7Part2),
                        }),
                      }),
                      number: 1,
                      level: 1,
                    },
                    {
                      content: Fragments(list{
                        Text({
                          content: Message(oldestKidsLine8Part1),
                          bold: true,
                          appendSpace: true,
                        }),
                        Text({
                          content: Message(oldestKidsLine8Part2),
                        }),
                      }),
                      number: 2,
                      level: 1,
                    },
                    {content: Message(oldestKidsLine9)},
                    {content: Message(oldestKidsLine10)},
                  },
                },
              })}
            />,
            topRef: registrationsOldestTopRef,
          },
          {
            element: <Registrations_UpcomingDates />,
            topRef: currentRegistrationDatesTopRef,
            accented: Yellow,
          },
        }}
        coloredSections=Odd
      />,
    )
  />
}
