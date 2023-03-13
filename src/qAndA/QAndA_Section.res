open Mui
open ReactIntl

@react.component
let make = (~header, ~body) => {
  let intl = useIntl()

  <Accordion>
    <AccordionSummary expandIcon={<Common.Icon.ExpandMore />}>
      <Typography variant=#h5> {intl->Intl.formatMessage(header)->React.string} </Typography>
    </AccordionSummary>
    <AccordionDetails>
      <Common.Text body />
    </AccordionDetails>
  </Accordion>
}
