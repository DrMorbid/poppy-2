open ReactDOM

@react.component
let make = (~url as src=?) => {
  let width = "100%"
  let height = "95%"

  <iframe style={Style.make(~border="none", ())} ?src width height />
}
