open Mui
open News_Message

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
      <Date variant=#h4 />
    </Grid>
    <Grid item=true className={commonClasses["marginTopSm"]}>
      <Title variant=#h5 />
      <Content className={commonClasses["marginTopSm"]} />
    </Grid>
  </Grid>
}
