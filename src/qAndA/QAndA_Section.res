open ReactIntl

@react.component
let make = (~header, ~body) => {
  let intl = useIntl()

  <Mui.Accordion>
    <Mui.AccordionSummary expandIcon={<Common.Icon.ExpandMore />}>
      <Mui.Typography variant=H5>
        {intl->ReactIntl.Intl.formatMessage(header)->React.string}
      </Mui.Typography>
    </Mui.AccordionSummary>
    <Mui.AccordionDetails>
      <Common.Text body />
    </Mui.AccordionDetails>
  </Mui.Accordion>
}
