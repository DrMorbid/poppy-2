open Message.References
open ReactIntl

module Section = {
  @react.component
  let make = (~header, ~part1, ~part2) => {
    <Common.Text
      header
      headerVariant=H4
      body=Fragments(list{
        {
          content: list{
            Text({content: Message(part1)}),
            Text({content: String(","), appendSpace: true}),
            Text({content: Message(part2), appendSpace: true}),
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

  <Common.Text
    header
    afterHeader={<Mui.Typography variant=H6>
      {intl->ReactIntl.Intl.formatMessage(subHeader)->React.string}
    </Mui.Typography>}
    body={Element(
      <Mui.Grid container=true className=Common.Style.sectionGap>
        <Mui.Grid item=true>
          <Section header=section1Header part1=section1Part1 part2=section1Part2 />
        </Mui.Grid>
        <Mui.Grid item=true>
          <Section header=section2Header part1=section2Part1 part2=section2Part2 />
        </Mui.Grid>
        <Mui.Grid item=true>
          <Section header=section3Header part1=section3Part1 part2=section3Part2 />
        </Mui.Grid>
        <Mui.Grid item=true>
          <Section header=section4Header part1=section4Part1 part2=section4Part2 />
        </Mui.Grid>
        <Mui.Grid item=true>
          <Section header=section5Header part1=section5Part1 part2=section5Part2 />
        </Mui.Grid>
      </Mui.Grid>,
    )}
  />
}
