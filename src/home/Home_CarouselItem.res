open Mui

module Classes = {
  let imageContainer = Mui.Sx.obj({
    position: String("relative"),
    paddingTop: String("30%"),
    width: String("100%"),
  })
  let image = Mui.Sx.obj({
    position: String("absolute"),
    width: String("100%"),
    height: String("100%"),
    top: String("0"),
  })
}

@react.component
let make = (~image) => {
  <Card sx=Classes.imageContainer>
    <CardMedia image sx=Classes.image />
  </Card>
}
