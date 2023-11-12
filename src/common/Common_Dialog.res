open ReactDOM

module Classes = {
  let mapSize = Style.make(~width="100%", ~height="75%", ())->Emotion.styleToClass
}

@react.component
let make = (~isOpen as open_, ~onClose, ~children, ~fullScreen=?, ~fixedSize=?) => {
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)
  let isLgUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.lgUp)
  let isXlUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.xlUp)

  <Mui.Dialog
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
    <Mui.DialogTitle>
      <Mui.Grid item=true>
        <Mui.IconButton onClick={_ => onClose()}>
          <Common_Icon.Close />
        </Mui.IconButton>
      </Mui.Grid>
    </Mui.DialogTitle>
    <Mui.DialogContent> children </Mui.DialogContent>
  </Mui.Dialog>
}
