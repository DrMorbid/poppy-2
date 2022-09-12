open Mui
open ReactDOM

@react.component
let make = (~url as src=?) => {
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))
  let isMdUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#md->#up))

  let getHeight = () =>
    if isMdUp {
      "100%"
    } else if isSmUp {
      "333px"
    } else {
      "280px"
    }

  <iframe style={Style.make(~border="none", ())} ?src width="100%" height={getHeight()} />
}
