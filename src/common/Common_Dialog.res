open Mui
open ReactDOM

module Classes = {
  let mapSize = Style.make(~width="100%", ~height="75%", ())->Emotion.styleToClass
}

@react.component
let make = (~isOpen as \"open", ~onClose, ~children, ~fullScreen=?, ~fixedSize=?) => {
  let theme = Core.useTheme()
  let isMdUp = Core.useMediaQuery(theme->Core.Breakpoint.get(#md->#up))
  let isLgUp = Core.useMediaQuery(theme->Core.Breakpoint.get(#lg->#up))
  let isXlUp = Core.useMediaQuery(theme->Core.Breakpoint.get(#xl->#up))

  <Dialog
    onClose={(_, _) => onClose()}
    \"open"
    ?fullScreen
    classes=?{fixedSize->Belt.Option.flatMap(fixedSize =>
      fixedSize ? Some(Dialog.Classes.make(~paper=Classes.mapSize, ())) : None
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
