open Mui
open ReactDOM

module Classes = {
  let imageContainer =
    Style.make(
      ~position="relative !important",
      ~paddingTop="30% !important",
      ~width="100% !important",
      (),
    )->Emotion.styleToClass
  let image =
    Style.make(
      ~position="absolute !important",
      ~width="100% !important",
      ~height="100% !important",
      ~top="0 !important",
      (),
    )->Emotion.styleToClass
}

@react.component
let make = (~image) => {
  <Card className=Classes.imageContainer>
    <CardMedia image classes={root: Classes.image} />
  </Card>
}
