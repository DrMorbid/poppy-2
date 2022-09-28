open Message.Registrations
open Mui

@react.component
let make = () => {
  let (dialogOpened, setDialogOpened) = React.useState(() => false)
  let commonClasses = Common.Style.useStyles(.)
  let ({activeMenuItem, _}: App_Context.state, dispatch) = React.useContext(App_Context.Context.t)
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))

  React.useEffect1(() => {
    if activeMenuItem != Registrations {
      dispatch(App_Context.StoreActiveMenuItem(Registrations))
    }

    None
  }, [activeMenuItem])

  let onOpenClick = () => setDialogOpened(_ => true)

  let onCloseClick = _ => setDialogOpened(_ => false)

  <>
    <Dialog onClose={_ => onCloseClick} \"open"=dialogOpened fullScreen={!isSmUp}>
      <DialogTitle>
        <Grid container=true justify=#"space-between" alignItems=#center>
          <Grid item=true>
            <News.Message.Date variant=#h4 />
          </Grid>
          <Grid item=true>
            <IconButton onClick=onCloseClick>
              <Common.Icon.Close />
            </IconButton>
          </Grid>
        </Grid>
      </DialogTitle>
      <DialogContent>
        <DialogContentText>
          <Grid container=true>
            <Grid item=true>
              <News.Message.Title variant=#h5 />
              <News.Message.Content className={commonClasses["marginTopSm"]} />
            </Grid>
          </Grid>
        </DialogContentText>
      </DialogContent>
    </Dialog>
    <Common.Text
      header=?{isSmUp ? Some(header) : None}
      afterHeader={<Common.OpenInNewButton label=nextRegistrations onClick=onOpenClick />}
      paragraphs=list{paragraph1, paragraph2, paragraph3, paragraph4}
    />
  </>
}
