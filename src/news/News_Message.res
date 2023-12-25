open News_Latest

module Title = {
  @react.component
  let make = (~variant) => {
    latestNews.title
    ->List.mapWithIndex((index, titleLine) =>
      <Mui.Typography variant key={`news-title-line-${index->Int.toString}`}>
        {titleLine->React.string}
      </Mui.Typography>
    )
    ->List.toArray
    ->React.array
  }
}

@react.component
let make = () => {
  <Mui.Grid container=true>
    <Mui.Grid item=true>
      <Title variant=H5 />
      <Mui.Grid
        container=true direction=Column alignItems=Stretch className=Common.Style.marginTopSm>
        {latestNews.content
        ->List.mapWithIndex((index, {emphasis, value, nextLineEmpty}) => {
          <Mui.Grid
            item=true
            key={`news-line-${index->Int.toString}`}
            className=?{if nextLineEmpty {
              Some(Common.Style.marginBottomSm)
            } else {
              None
            }}>
            <Mui.Typography
              className=?{switch emphasis {
              | Normal => None
              | Bold => Some(Common.Style.bold)
              }}>
              {value->React.string}
            </Mui.Typography>
          </Mui.Grid>
        })
        ->List.toArray
        ->React.array}
      </Mui.Grid>
    </Mui.Grid>
  </Mui.Grid>
}
