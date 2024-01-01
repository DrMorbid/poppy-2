module Classes = {
  let mapSize =
    [("& .MuiDialog-paper", ({width: String("100%"), height: String("75%")}: Mui.System.props))]
    ->Dict.fromArray
    ->Mui.Sx.dict
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
    sx=?{fixedSize->Option.flatMap(fixedSize => fixedSize ? Some(Classes.mapSize) : None)}
    maxWidth={switch (isXlUp, isLgUp, isMdUp) {
    | (true, _, _) => Lg
    | (false, true, _) => Md
    | (false, false, true) => Sm
    | (false, false, false) => Xs
    }}>
    <Mui.DialogTitle>
      <Mui.Grid
        container=true
        justifyContent=Mui.System.Value.String("flex-end")
        alignItems=Mui.System.Value.Center>
        <Mui.Grid item=true>
          <Mui.IconButton onClick={_ => onClose()}>
            <Common_Icon.Close />
          </Mui.IconButton>
        </Mui.Grid>
      </Mui.Grid>
    </Mui.DialogTitle>
    <Mui.DialogContent> children </Mui.DialogContent>
  </Mui.Dialog>
}
