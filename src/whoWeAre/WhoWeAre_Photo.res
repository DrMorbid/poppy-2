open Mui

module Classes = {
  let photo = Mui.Sx.obj({
    width: Breakpoint({
      xs: String("9rem"),
      sm: String("13rem"),
      md: String("14rem"),
      lg: String("17rem"),
    }),
    height: Breakpoint({
      xs: String("9rem"),
      sm: String("13rem"),
      md: String("14rem"),
      lg: String("17rem"),
    }),
  })
}

@react.component
let make = (~src) => {
  <Avatar src sx=Classes.photo />
}
