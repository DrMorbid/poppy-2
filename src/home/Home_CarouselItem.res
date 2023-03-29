open Mui
open ReactDOM

module Classes = {
  let imageContainer =
    Style.make(~position="relative", ~paddingTop="30%", ~width="100%", ())->Emotion.styleToClass
  let image =
    Style.make(
      ~position="absolute",
      ~width="100%",
      ~height="100%",
      ~top="0",
      (),
    )->Emotion.styleToClass
}

@react.component
let make = (~image) => {
  <Card className=Classes.imageContainer>
    <CardMedia image className=Classes.image />
  </Card>
}
