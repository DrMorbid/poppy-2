open Message.Registrations

@react.component
let make = () => {
  let registrationsYoungestTopRef = React.useRef(null)
  let registrationsMiddleTopRef = React.useRef(null)
  let registrationsOldestTopRef = React.useRef(null)
  let currentRegistrationDatesTopRef = React.useRef(null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect4(() => {
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
              headerVariant=#h4
              body={Lists(list{
                {
                  list: list{
                    {content: Message(youngestKidsLine1), bold: true},
                    {content: Message(youngestKidsLine2), bold: true},
                    {content: Message(youngestKidsLine3), bold: true},
                    {content: Message(youngestKidsLine4), bold: true},
                  },
                },
              })}
            />,
            topRef: registrationsYoungestTopRef,
          },
          {
            element: <Common.Text
              header=Message.registrationsMiddle
              headerVariant=#h4
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
                    {content: Message(middleKidsLine4)},
                    {content: Message(middleKidsLine5)},
                  },
                },
              })}
            />,
            topRef: registrationsMiddleTopRef,
          },
          {
            element: <Common.Text
              header=Message.registrationsOldest
              headerVariant=#h4
              body={Lists(list{
                {
                  list: list{
                    {content: Message(oldestKidsLine1)},
                    {content: Message(oldestKidsLine2)},
                    {content: Message(oldestKidsLine3)},
                  },
                },
              })}
            />,
            topRef: registrationsOldestTopRef,
          },
          {
            element: <News.Section
              header=Message.currentRegistrationDates headerVariant=#h3 headerUppercase=true
            />,
            topRef: currentRegistrationDatesTopRef,
          },
        }}
        coloredSections=Odd
      />,
    )
  />
}
