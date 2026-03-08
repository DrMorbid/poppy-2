open Message.Gdpr

@react.component
let make = () => {
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
            <Common.Text
              body=Element(
                <App_ScrollableSections
                  sections={list{
                    {
                      element: <Common.Text
                        header=gdprSection1Title
                        headerVariant=H4
                        body={Lists(list{
                          {
                            list: list{
                              {
                                content: Message(gdprSection1Body),
                              },
                            },
                          },
                        })}
                      />,
                    },
                    {
                      element: <Common.Text
                        header=gdprSection2Title
                        headerVariant=H4
                        body={Lists(list{
                          {
                            list: list{
                              {
                                content: String("Apple"),
                              },
                              {
                                content: String("Google"),
                              },
                              {
                                content: Message(gdprSection2Line3),
                              },
                            },
                          },
                        })}
                      />,
                    },
                    {
                      element: <Common.Text
                        header=gdprSection3Title
                        headerVariant=H4
                        body={Lists(list{
                          {
                            list: list{
                              {
                                content: Message(gdprSection3Line1),
                              },
                              {
                                content: Message(gdprSection3Line2),
                              },
                              {
                                content: Message(gdprSection3Line3),
                              },
                              {
                                content: Message(gdprSection3Line4),
                              },
                              {
                                content: Message(gdprSection3Line5),
                              },
                              {
                                content: Message(gdprSection3Line6),
                              },
                            },
                          },
                        })}
                      />,
                    },
                    {
                      element: <Common.Text
                        header=gdprSection4Title
                        headerVariant=H4
                        body={Lists(list{
                          {
                            list: list{
                              {
                                content: Message(gdprSection4Line1),
                              },
                              {
                                content: Message(gdprSection4Line2),
                              },
                              {
                                content: Message(gdprSection4Line3),
                              },
                              {
                                content: Message(gdprSection4Line4),
                              },
                              {
                                content: Message(gdprSection4Line5),
                              },
                              {
                                content: Message(gdprSection4Line6),
                              },
                              {
                                content: Message(gdprSection4Line7),
                              },
                              {
                                content: Message(gdprSection4Line8),
                              },
                              {
                                content: Message(gdprSection4Line9),
                              },
                            },
                          },
                        })}
                      />,
                    },
                  }}
                />,
              )
            />,
          ),
        },
      },
      {
        content: list{
          Element(
            <Common.Text
              body=Fragments(list{
                {
                  content: list{
                    Text({content: Message(finalNote), italic: true}),
                    Text({content: String(" "), italic: true}),
                    Text({
                      content: Link({
                        content: Common.Constants.infoEmail,
                        href: `mailto:${Common.Constants.infoEmail}`,
                      }),
                      italic: true,
                    }),
                    Text({content: String("."), italic: true}),
                  },
                },
              })
            />,
          ),
        },
      },
    })
  />
}
