open Mui
open ReactDOM

let useStyles: Styles.useStyles<{
  "mapSize": string,
}> = Styles.makeStyles({
  "mapSize": Style.make(~width="100%", ~height="50%", ()),
})

@react.component
let make = (~isOpen as \"open", ~onClose, ~children, ~fullScreen=?, ~fixedSize=?) => {
  let classes = useStyles(.)

  <Dialog
    onClose={(_, _) => onClose()}
    \"open"
    ?fullScreen
    classes=?{fixedSize->Belt.Option.flatMap(fixedSize =>
      fixedSize ? Some(Dialog.Classes.make(~paper={classes["mapSize"]}, ())) : None
    )}>
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
