open Mui
open News_Latest

module Date = {
  @react.component
  let make = (~variant) => {
    <Typography variant> {latestNews.date->Date.toLocaleDateString->React.string} </Typography>
  }
}

module Title = {
  @react.component
  let make = (~variant) => {
    latestNews.title
    ->Belt.List.mapWithIndex((index, titleLine) =>
      <Typography variant key={`news-title-line-${index->Belt.Int.toString}`}>
        {titleLine->React.string}
      </Typography>
    )
    ->Belt.List.toArray
    ->React.array
  }
}

@react.component
let make = () => {
  <Grid container=true>
    <Grid item=true>
      <Title variant=#h5 />
      <Grid container=true direction=#column alignItems=#stretch className=Common.Style.marginTopSm>
        {latestNews.content
        ->Belt.List.mapWithIndex((index, {emphasis, value, nextLineEmpty}) => {
          <Grid
            item=true
            key={`news-line-${index->Belt.Int.toString}`}
            className=?{if nextLineEmpty {
              Some(Common.Style.marginBottomSm)
            } else {
              None
            }}>
            <Typography
              className=?{switch emphasis {
              | Normal => None
              | Bold => Some(Common.Style.bold)
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
