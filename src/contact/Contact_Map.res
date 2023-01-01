open Mui
open ReactDOM

@react.component
let make = (~url as src=?, ~isMapBeingLoaded as active, ~onMapLoadingFinished as onLoad) => {
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

  <ReactLoadingOverlay
    active
    spinner={<CircularProgress />}
    styles={{
      wrapper: Js.Dict.fromArray([
        ("position", "relative"),
        ("width", "100%"),
        ("height", getHeight()),
      ]),
    }}>
    <iframe style={Style.make(~border="none", ())} ?src width="100%" height={getHeight()} onLoad />
  </ReactLoadingOverlay>
}
