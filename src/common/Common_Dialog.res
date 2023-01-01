open Mui

@react.component
let make = (~isOpen as \"open", ~onClose, ~children, ~fullScreen=?) => {
  <Dialog onClose={(_, _) => onClose()} \"open" ?fullScreen>
    <DialogTitle>
      <Grid container=true justify=#"flex-end" alignItems=#center>
        <Grid item=true>
          <IconButton onClick={_ => onClose()}>
            <Common_Icon.Close />
          </IconButton>
        </Grid>
      </Grid>
    </DialogTitle>
    <DialogContent> children </DialogContent>
  </Dialog>
}
