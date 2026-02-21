open ReactDOM

@react.component
let make = (~coloring: Common.Section.coloring=Transparent, ~children, ~topRef=?) => {
  <Mui.Grid item=true ref=?{topRef->Option.map(Ref.domRef)}>
    <Mui.Grid container=true>
      {switch coloring {
      | Colored | Accented(_) =>
        <Mui.Grid item=true xs=Number(12)>
          <Mui.Divider />
        </Mui.Grid>
      | Transparent => React.null
      }}
      <Common.Section coloring> {children} </Common.Section>
      {switch coloring {
      | Colored | Accented(_) =>
        <Mui.Grid item=true xs=Number(12)>
          <Mui.Divider />
        </Mui.Grid>
      | Transparent => React.null
      }}
    </Mui.Grid>
  </Mui.Grid>
}
