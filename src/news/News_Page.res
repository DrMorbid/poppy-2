open Mui
open News_Latest

@react.component
let make = () => {
  let commonClasses = Common_Style.useStyles(.)

  <Grid container=true>
    <Grid item=true>
      {latestNews.title
      ->Belt.List.mapWithIndex((index, titleLine) =>
        <Typography variant=#h5 key={`news-title-line-${index->Belt.Int.toString}`}>
          {titleLine->React.string}
        </Typography>
      )
      ->Belt.List.toArray
      ->React.array}
      <Grid container=true direction=#column className={commonClasses["headerGap"]}>
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
    </Grid>
  </Grid>
}
