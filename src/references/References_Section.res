open Message.References
open ReactIntl

module Island = {
  @react.component
  let make = (~header, ~content) => {
    <Common.Island
      header
      headerVariant=H4
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
  let router = Next.Navigation.useRouter()

  let onClick = e => {
    App_ScrollToTop.onClick(~topRef?, ~behavior=#auto, e)
    router->App_Page.goTo(References)
  }

  <Mui.Grid container=true justifyContent=Center sx=Common.Style.islandsVerticalGap>
    <Mui.Grid item=true>
      <Common.Text
        header
        afterHeader={<Mui.Typography variant=H6>
          {intl->ReactIntl.Intl.formatMessage(subHeader)->React.string}
        </Mui.Typography>}
        body={Element(
          <Mui.Grid container=true sx=Common.Style.islandsVerticalGap>
            <Island header=section1Header content=section1Part1 />
            <Island header=section2Header content=section2Part1 />
            <Island header=section3Header content=section3Part1 />
            <Island header=section4Header content=section4Part1 />
            <Island header=section5Header content=section5Part1 />
          </Mui.Grid>,
        )}
      />
    </Mui.Grid>
    <Mui.Grid item=true>
      <Mui.Button variant=Contained color=Primary onClick>
        {intl->ReactIntl.Intl.formatMessage(showMore)->React.string}
      </Mui.Button>
    </Mui.Grid>
  </Mui.Grid>
}
