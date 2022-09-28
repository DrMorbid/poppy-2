open Mui
open News_Latest

@react.component
let make = () => {
  let commonClasses = Common_Style.useStyles(.)
  let ({activeMenuItem, _}: App_Context.state, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect1(() => {
    if activeMenuItem != News {
      dispatch(App_Context.StoreActiveMenuItem(News))
    }

    None
  }, [activeMenuItem])

  <Grid container=true>
    <Grid item=true>
      <Typography variant=#h4>
        {latestNews.date->Js.Date.toLocaleDateString->React.string}
      </Typography>
    </Grid>
    <Grid item=true className={commonClasses["marginTopSm"]}>
      {latestNews.title
      ->Belt.List.mapWithIndex((index, titleLine) =>
        <Typography variant=#h5 key={`news-title-line-${index->Belt.Int.toString}`}>
          {titleLine->React.string}
        </Typography>
      )
      ->Belt.List.toArray
      ->React.array}
      <Grid container=true direction=#column className={commonClasses["marginTopSm"]}>
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
