open Message.References
open Mui
open ReactIntl

module Section = {
  @react.component
  let make = (~header, ~part1, ~part2) => {
    <Common.Text
      header
      headerVariant=#h4
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
  let commonClasses = Common.Style.useStyles(.)

  <Common.Text
    header
    afterHeader={<Typography variant=#h6>
      {intl->Intl.formatMessage(subHeader)->React.string}
    </Typography>}
    body={Element(
      <Grid container=true className={commonClasses["sectionGap"]}>
        <Grid item=true>
          <Section header=section1Header part1=section1Part1 part2=section1Part2 />
        </Grid>
        <Grid item=true>
          <Section header=section2Header part1=section2Part1 part2=section2Part2 />
        </Grid>
        <Grid item=true>
          <Section header=section3Header part1=section3Part1 part2=section3Part2 />
        </Grid>
        <Grid item=true>
          <Section header=section4Header part1=section4Part1 part2=section4Part2 />
        </Grid>
        <Grid item=true>
          <Section header=section5Header part1=section5Part1 part2=section5Part2 />
        </Grid>
      </Grid>,
    )}
  />
}
