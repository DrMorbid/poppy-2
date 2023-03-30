open Mui

@react.component
let make = (~header, ~body) => {
  let intl = ReactIntl.useIntl()

  <Accordion>
    <AccordionSummary expandIcon={<Common.Icon.ExpandMore />}>
      <Typography variant=#h4>
        {intl->ReactIntl.Intl.formatMessage(header)->React.string}
      </Typography>
    </AccordionSummary>
    <AccordionDetails>
      <Common.Text body />
    </AccordionDetails>
  </Accordion>
}
