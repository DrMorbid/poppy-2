open Mui
open News_Latest
open Promise

module Date = {
  @react.component
  let make = (~variant) => {
    <Typography variant> {latestNews.date->Js.Date.toLocaleDateString->React.string} </Typography>
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

module Content = {
  @react.component
  let make = (~displayDate=true) => {
    let commonClasses = Common_Style.useStyles(.)

    <Grid container=true>
      {displayDate
        ? <Grid item=true>
            <Date variant=#h4 />
          </Grid>
        : React.null}
      <Grid item=true className=?{displayDate ? Some(commonClasses["marginTopSm"]) : None}>
        <Title variant=#h5 />
        <Grid
          container=true
          direction=#column
          alignItems=#stretch
          className={commonClasses["marginTopSm"]}>
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
}

@react.component
let make = () => {
  let (newsRead, setNewsRead) = React.useState(() => true)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect0(() => {
    News_Idb.isLatestNewsRead()
    ->thenResolve(isLatestNewsRead => setNewsRead(_ => isLatestNewsRead))
    ->ignore

    None
  })

  let onClose = _ => {
    setNewsRead(_ => true)
    News_Idb.setNewsRead(Js.Date.make())
    dispatch(LatestNewsClosed)
  }

  <Common.Dialog isOpen={!newsRead} onClose>
    <Content />
  </Common.Dialog>
}
