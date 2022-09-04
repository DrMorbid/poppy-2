open Mui

module Theme = App_Theme

@react.component
let make = () => {
  <Typography> {"Hello world"->React.string} </Typography>
}
