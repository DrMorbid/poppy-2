open Message.Registrations.UpcomingDates
open Common.Constants

module Title = {
  @react.component
  let make = (~children) => {
    let intl = ReactIntl.useIntl()

    <Mui.Typography variant=H5>
      {intl->ReactIntl.Intl.formatMessage(children)->React.string}
    </Mui.Typography>
  }
}

@react.component
let make = () => {
  let intl = ReactIntl.useIntl()

  <Common.Text
    header=Message.Registrations.headerUpcomingRegistrationDates
    headerVariant=H3
    body=Element(
      <Common.Text
        body=Fragments(list{
          {
            content: list{Element(<Title> {howToRegisterTitle} </Title>)},
          },
          {
            content: list{
              Text({content: Message(howToRegisterLine1Part1), bold: true, appendSpace: true}),
              Text({content: Message(howToRegisterLine1Part2), appendSpace: true}),
              Text({
                content: Link({
                  content: intl->ReactIntl.Intl.formatMessage(howToRegisterLine1Part3),
                  href: "https://1url.cz/@Poppy",
                }),
                bold: true,
                appendSpace: true,
              }),
              Text({content: Message(howToRegisterLine1Part4)}),
            },
          },
          {
            content: list{
              Text({content: Message(howToRegisterLine2Part1), bold: true, appendSpace: true}),
              Text({content: Message(howToRegisterLine2Part2), appendSpace: true}),
              Text({
                content: Link({
                  content: infoEmail,
                  href: `mailto:${infoEmail}`,
                }),
                bold: true,
                appendSpace: true,
              }),
              Text({content: Message(howToRegisterLine2Part3), appendSpace: true}),
              Text({content: String(infoPhone), bold: true}),
              Text({content: String(".")}),
            },
          },
          {content: list{Element(<UpcomingDates />)}},
          {
            content: list{
              Text({content: Message(howToRegisterLine3), bold: true, appendSpace: true}),
              Text({content: Message(Message.Contact.registrationAddress)}),
            },
          },
          {
            content: list{Text({content: Message(howToRegisterLine4), italic: true})},
          },
          {
            content: list{Element(<Title> {breakdownByAgeTitle} </Title>)},
          },
          {
            content: list{Text({content: Message(breakdownByAgeLine1), bold: true})},
          },
          {
            content: list{
              Element(
                <Common.Text
                  body=Lists(list{
                    {
                      list: list{
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(breakdownByAgeLine2Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine2Part2), appendSpace: true}),
                            Text({content: Message(breakdownByAgeLine2Part3), bold: true}),
                            Text({content: String(".")}),
                          }),
                        },
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(breakdownByAgeLine3Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine3Part2)}),
                          }),
                        },
                      },
                    },
                  })
                />,
              ),
            },
          },
          {
            content: list{Text({content: Message(breakdownByAgeLine4), bold: true})},
          },
          {
            content: list{
              Element(
                <Common.Text
                  body=Lists(list{
                    {
                      list: list{
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(breakdownByAgeLine5Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine5Part2), appendSpace: true}),
                            Text({content: Message(breakdownByAgeLine5Part3), bold: true}),
                            Text({content: String(".")}),
                          }),
                        },
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(breakdownByAgeLine6Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine6Part2)}),
                          }),
                        },
                      },
                    },
                  })
                />,
              ),
            },
          },
          {
            content: list{Element(<Title> {importantRegistrationRequirementsTitle} </Title>)},
          },
          {
            content: list{
              Element(
                <Common.Text
                  body=Lists(list{
                    {
                      list: list{
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(breakdownByAgeLine7Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine7Part2), appendSpace: true}),
                            Text({
                              content: Message(breakdownByAgeLine7Part3),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine7Part4), appendSpace: true}),
                            Text({content: Message(breakdownByAgeLine7Part5), bold: true}),
                            Text({content: String(".")}),
                          }),
                        },
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(breakdownByAgeLine8Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine8Part2), appendSpace: true}),
                            Text({
                              content: Message(breakdownByAgeLine8Part3),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine8Part4)}),
                          }),
                        },
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(breakdownByAgeLine9Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine9Part2)}),
                          }),
                        },
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(breakdownByAgeLine10Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine10Part2), appendSpace: true}),
                            Text({
                              content: Message(breakdownByAgeLine10Part3),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(breakdownByAgeLine10Part4)}),
                          }),
                        },
                      },
                    },
                  })
                />,
              ),
            },
          },
        })
      />,
    )
  />
}
