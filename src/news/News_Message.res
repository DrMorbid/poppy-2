open Mui
open MuiLab
open ReactDOM
open News_Latest
open Promise

let useStyles: Styles.useStyles<{
  "iconPlacement": string,
}> = Styles.makeStyles({
  "iconPlacement": Style.make(~alignItems="flex-start", ()),
})

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
  let make = (~className=?) => {
    let commonClasses = Common_Style.useStyles(.)

    <Grid container=true direction=#column alignItems=#stretch ?className>
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
  }
}

@react.component
let make = () => {
  let (newsRead, setNewsRead) = React.useState(() => true)
  let commonClasses = Common_Style.useStyles(.)
  let classes = useStyles(.)
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

  <Collapse \"in"={!newsRead}>
    <Grid
      container=true
      direction=#column
      alignItems=#stretch
      className={commonClasses["marginBottom"]}>
      <Grid item=true>
        <Alert
          severity=#info
          color=#error
          onClose
          classes={Alert.Classes.make(
            ~message=commonClasses["fullWidth"],
            ~action=classes["iconPlacement"],
            (),
          )}>
          <AlertTitle>
            <Date variant=#h5 />
            <Title variant=#h6 />
          </AlertTitle>
          <Content />
        </Alert>
      </Grid>
    </Grid>
  </Collapse>
}
