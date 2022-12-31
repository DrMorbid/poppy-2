open Mui
open ReactDOM

let useStyles: Styles.useStyles<{
  "imageContainer": string,
  "image": string,
}> = Styles.makeStyles({
  "imageContainer": Style.make(~position="relative", ~paddingTop="30%", ~width="100%", ()),
  "image": Style.make(~position="absolute", ~width="100%", ~height="100%", ~top="0", ()),
})

@react.component
let make = (~image) => {
  let classes = useStyles(.)

  <Card className={classes["imageContainer"]}>
    <CardMedia image className={classes["image"]} />
  </Card>
}
