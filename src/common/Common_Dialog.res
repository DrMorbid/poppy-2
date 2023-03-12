open Mui
open ReactDOM

let useStyles: Styles.useStyles<{
  "mapSize": string,
}> = Styles.makeStyles({
  "mapSize": Style.make(~width="100%", ~height="75%", ()),
})

@react.component
let make = (~isOpen as \"open", ~onClose, ~children, ~fullScreen=?, ~fixedSize=?) => {
  let classes = useStyles(.)
  let isMdUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#md->#up))
  let isLgUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#lg->#up))
  let isXlUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#xl->#up))

  <Dialog
    onClose={(_, _) => onClose()}
    \"open"
    ?fullScreen
    classes=?{fixedSize->Belt.Option.flatMap(fixedSize =>
      fixedSize ? Some(Dialog.Classes.make(~paper={classes["mapSize"]}, ())) : None
    )}
    maxWidth={switch (isXlUp, isLgUp, isMdUp) {
    | (true, _, _) => Dialog.MaxWidth.lg
    | (false, true, _) => Dialog.MaxWidth.md
    | (false, false, true) => Dialog.MaxWidth.sm
    | (false, false, false) => Dialog.MaxWidth.xs
    }}>
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
