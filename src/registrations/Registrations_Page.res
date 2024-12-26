open Message.Registrations

@react.component
let default = () => {
  let registrationsYoungestTopRef = React.useRef(null)
  let registrationsMiddleTopRef = React.useRef(null)
  let registrationsOldestTopRef = React.useRef(null)
  let currentRegistrationDatesTopRef = React.useRef(null)
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
            element: <>
              <Mui.Grid item=true>
                <Common.Text
                  header=Message.registrationsMiddle
                  headerVariant=H4
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
                />
              </Mui.Grid>
              <Mui.Grid item=true>
                <Common.Text
                  header=middleKidsSection2Header
                  headerVariant=H6
                  disableGutters=true
                  body=Lists(list{
                    {
                      list: list{
                        {content: Message(middleKidsSection2Line1)},
                        {content: Message(middleKidsSection2Line2), bold: true},
                      },
                    },
                  })
                />
              </Mui.Grid>
            </>,
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
