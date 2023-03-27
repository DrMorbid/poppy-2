open Mui
open Mui.Grid
open Message.References
open ReactIntl

module Island = {
  @react.component
  let make = (~header, ~content) => {
    <Common.Island
      header
      headerVariant=#h4
      body=Fragments(list{
        {
          content: list{
            Text({content: Message(content), appendSpace: true}),
            Text({content: Message(sectionEtc)}),
          },
        },
      })
    />
  }
}

@react.component
let make = () => {
  let intl = useIntl()
  let ({topRef, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  let onClick = e => {
    App_ScrollToTop.onClick(~topRef?, ~behavior=#auto, e)
    App_Page.goTo(References)
  }

  <Grid container=true justify=#center className=Common.Style.islandsVerticalGap>
    <Grid item=true>
      <Common.Text
        header
        afterHeader={<Typography variant=#h6>
          {intl->Intl.formatMessage(subHeader)->React.string}
        </Typography>}
        body={Element(
          <Grid container=true className=Common.Style.islandsVerticalGap>
            <Island header=section1Header content=section1Part1 />
            <Island header=section2Header content=section2Part1 />
            <Island header=section3Header content=section3Part1 />
            <Island header=section4Header content=section4Part1 />
            <Island header=section5Header content=section5Part1 />
          </Grid>,
        )}
      />
    </Grid>
    <Grid item=true>
      <Button variant=#contained color=#primary onClick>
        {intl->Intl.formatMessage(showMore)->React.string}
      </Button>
    </Grid>
  </Grid>
}
