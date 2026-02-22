open Message.PhotosRetake.UpcomingDates
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
  <Common.Text
    header=Message.PhotosRetake.headerUpcomingPhotosRetakeDates
    headerVariant=H3
    body=Element(
      <Common.Text
        body=Fragments(list{
          {
            content: list{Text({content: Message(photosRetakeUpcomingDatesLine1)})},
          },
          {
            content: list{Text({content: Message(photosRetakeUpcomingDatesLine2)})},
          },
          {
            content: list{Element(<Title> {photosRetakeUpcomingDatesLine3} </Title>)},
          },
          {content: list{Element(<UpcomingDates asList=true />)}},
          {
            content: list{
              Text({
                content: Message(photosRetakeUpcomingDatesLine4),
                bold: true,
                appendSpace: true,
              }),
              Text({content: Message(Message.Contact.registrationAddress)}),
            },
          },
          {
            content: list{Text({content: Message(photosRetakeUpcomingDatesLine5), italic: true})},
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
                              content: Message(photosRetakeUpcomingDatesLine6Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({
                              content: Message(photosRetakeUpcomingDatesLine6Part2),
                              appendSpace: true,
                            }),
                            Text({
                              content: Message(photosRetakeUpcomingDatesLine6Part3),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({content: Message(photosRetakeUpcomingDatesLine6Part4)}),
                          }),
                        },
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(photosRetakeUpcomingDatesLine7Part1),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({
                              content: Message(photosRetakeUpcomingDatesLine7Part2),
                              appendSpace: true,
                            }),
                          }),
                        },
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(photosRetakeUpcomingDatesLine8),
                              bold: true,
                              appendSpace: true,
                            }),
                            Text({
                              content: String("📧"),
                              appendSpace: true,
                            }),
                            Text({
                              content: Link({
                                content: infoEmail,
                                href: `mailto:${infoEmail}`,
                              }),
                              appendSpace: true,
                            }),
                            Text({
                              content: String("📞"),
                              appendSpace: true,
                            }),
                            Text({
                              content: String(infoPhone),
                            }),
                          }),
                        },
                        {
                          content: Fragments(list{
                            Text({
                              content: Message(photosRetakeUpcomingDatesLine9),
                            }),
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
            content: list{Element(<Title> {photosRetakeUpcomingDatesLine10} </Title>)},
          },
          {
            content: list{Text({content: Message(photosRetakeUpcomingDatesLine11), bold: true})},
          },
          {
            content: list{
              Element(
                <Common.Text
                  body=Lists(list{
                    {
                      list: list{
                        {
                          content: Message(photosRetakeUpcomingDatesLine12),
                        },
                        {
                          content: Message(photosRetakeUpcomingDatesLine13),
                        },
                        {
                          content: Message(photosRetakeUpcomingDatesLine14),
                        },
                      },
                    },
                  })
                />,
              ),
            },
          },
          {
            content: list{Text({content: Message(photosRetakeUpcomingDatesLine15), bold: true})},
          },
          {
            content: list{
              Element(
                <Common.Text
                  body=Lists(list{
                    {
                      list: list{
                        {
                          content: Message(photosRetakeUpcomingDatesLine16),
                        },
                        {
                          content: Message(photosRetakeUpcomingDatesLine17),
                        },
                        {
                          content: Message(photosRetakeUpcomingDatesLine18),
                        },
                        {
                          content: Message(photosRetakeUpcomingDatesLine19),
                        },
                        {
                          content: Message(photosRetakeUpcomingDatesLine20),
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
