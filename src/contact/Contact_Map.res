open Mui
open ReactDOM

@react.component
let make = (~url as src=?, ~isMapBeingLoaded as active, ~onMapLoadingFinished as onLoad) => {
  let width = "100%"
  let height = "95%"

  <ReactLoadingOverlay
    active
    spinner={<CircularProgress />}
    styles={{
      wrapper: Dict.fromArray([("position", "relative"), ("width", width), ("height", height)]),
    }}>
    <iframe style={Style.make(~border="none", ())} ?src width height onLoad />
  </ReactLoadingOverlay>
}
