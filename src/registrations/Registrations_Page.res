open Message.Registrations
open Mui
open Mui.Grid

module Island = {
  @react.component
  let make = (~header, ~body) => {
    <Common.Island
      body={Element(<Registrations_Accordion header body />)}
      disableGutters=true
      sm=Sm.\"12"
      lg=Lg.\"4"
      xl=Xl.\"4"
    />
  }
}

@react.component
let make = () => {
  let commonClasses = Common.Style.useStyles(.)

  <Common.Text
    header
    centerAll=true
    body={Element(
      <Grid container=true className={commonClasses["paragraphGap"]}>
        <Grid item=true xs=Xs.\"12">
          <Grid container=true>
            <Island
              header=youngestKidsHeader
              body=Lists(list{
                {
                  list: list{
                    {content: Message(youngestKidsLine1), bold: true},
                    {content: Message(youngestKidsLine2), bold: true},
                    {content: Message(youngestKidsLine3), bold: true},
                    {content: Message(youngestKidsLine4), bold: true},
                  },
                },
              })
            />
            <Island
              header=middleKidsHeader
              body=Element(<>
                <Grid item=true>
                  <Common.Text
                    body=Lists(list{
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
                    })
                  />
                </Grid>
                <Grid item=true>
                  <Common.Text
                    header=middleKidsSection2Header
                    headerVariant=#h6
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
                </Grid>
              </>)
            />
            <Island
              header=oldestKidsHeader
              body=Lists(list{
                {
                  list: list{
                    {content: Message(oldestKidsLine1)},
                    {content: Message(oldestKidsLine2)},
                    {content: Message(oldestKidsLine3)},
                  },
                },
              })
            />
          </Grid>
        </Grid>
        <Common.Section colored=true>
          <News.Section header=currentRegistrationDates headerVariant=#h3 headerUppercase=true />
        </Common.Section>
      </Grid>,
    )}
  />
}
