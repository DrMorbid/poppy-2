open Mui
open ReactDOM

module Classes = {
  let mapSize = Style.make(~width="100%", ~height="75%", ())->Emotion.styleToClass
}

@react.component
let make = (~isOpen as open_, ~onClose, ~children, ~fullScreen=?, ~fixedSize=?) => {
  let isMdUp = Core.useMediaQuery({sm: False, md: True})
  let isLgUp = Core.useMediaQuery({md: False, lg: True})
  let isXlUp = Core.useMediaQuery({lg: False, xl: True})

  <Dialog
    onClose={(_, _) => onClose()}
    open_
    ?fullScreen
    classes={
      paper: ?fixedSize->Option.flatMap(fixedSize => fixedSize ? Some(Classes.mapSize) : None),
    }
    maxWidth={switch (isXlUp, isLgUp, isMdUp) {
    | (true, _, _) => Lg
    | (false, true, _) => Md
    | (false, false, true) => Sm
    | (false, false, false) => Xs
    }}>
    <DialogTitle>
      // <Grid container=true justify=#"flex-end" alignItems=#center>
      <Grid item=true>
        <IconButton onClick={_ => onClose()}>
          <Common_Icon.Close />
        </IconButton>
      </Grid>
      // </Grid>
    </DialogTitle>
    <DialogContent> children </DialogContent>
  </Dialog>
}
