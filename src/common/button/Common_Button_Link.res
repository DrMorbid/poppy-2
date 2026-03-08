open ReactDOM

module Classes = {
  let submitButton = (
    {
      padding: "0",
      minWidth: "unset",
      verticalAlign: "unset",
      textDecoration: "underline",
    }: Style.t
  )->Utils.Style.styleToSx
}

@react.component
let make = (~onClick, ~children) => {
  <Mui.Button variant={Text} disableElevation=true size=Small onClick sx={Classes.submitButton}>
    {children->React.string}
  </Mui.Button>
}
