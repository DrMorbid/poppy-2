open Mui
open MuiLab
open ReactDOM
open News_Latest

let useStyles: Styles.useStyles<{
  "iconPlacement": string,
}> = Styles.makeStyles({
  "iconPlacement": Style.make(~alignItems="flex-start", ()),
})

@react.component
let make = () => {
  let commonClasses = Common_Style.useStyles(.)
  let classes = useStyles(.)

  <Grid
    container=true direction=#column alignItems=#stretch className={commonClasses["marginBottom"]}>
    <Grid item=true>
      <Alert
        severity=#info
        color=#error
        onClose={_ => ()}
        classes={Alert.Classes.make(
          ~message=commonClasses["fullWidth"],
          ~action=classes["iconPlacement"],
          (),
        )}>
        <AlertTitle>
          {latestNews.title
          ->Belt.List.mapWithIndex((index, titleLine) =>
            <Typography variant=#h6 key={`news-title-line-${index->Belt.Int.toString}`}>
              {titleLine->React.string}
            </Typography>
          )
          ->Belt.List.toArray
          ->React.array}
        </AlertTitle>
        <Grid container=true direction=#column alignItems=#stretch>
          {latestNews.content
          ->Belt.List.mapWithIndex((index, {emphasis, value, nextLineEmpty}) => {
            <Grid
              item=true
              key={`news-line-${index->Belt.Int.toString}`}
              className=?{if nextLineEmpty {
                Some(commonClasses["marginBottomSm"])
              } else {
                None
              }}>
              <Typography
                className=?{switch emphasis {
                | Normal => None
                | Bold => Some(commonClasses["bold"])
                }}>
                {value->React.string}
              </Typography>
            </Grid>
          })
          ->Belt.List.toArray
          ->React.array}
        </Grid>
      </Alert>
    </Grid>
  </Grid>
}