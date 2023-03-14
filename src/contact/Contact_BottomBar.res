open Mui
open Mui.Grid
open ReactIntl
open Message.Contact
open ReactDOM

let useStyles: Styles.useStyles<{
  "containerLight": string,
  "containerDark": string,
}> = Styles.makeStylesWithTheme(theme =>
  {
    "containerLight": Style.make(~backgroundColor=theme.palette.success.light, ()),
    "containerDark": Style.make(~backgroundColor=theme.palette.success.dark, ()),
  }
)

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let (isMapBeingLoaded, setIsMapBeingLoaded) = React.useState(() => false)
  let intl = useIntl()
  let commonClasses = Common.Style.useStyles(.)
  let classes = useStyles(.)
  let isMdUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#md->#up))
  let prefersDarkMode = Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  let onClose = () => {
    setIsMapBeingLoaded(_ => false)
    setMapUrl(_ => None)
  }

  let onClick = (mapUrl, ()) => {
    setIsMapBeingLoaded(_ => true)
    setMapUrl(_ => Some(mapUrl))
  }

  let onMapLoadingFinished = _ => setIsMapBeingLoaded(_ => false)

  <Grid
    container=true
    className={`${commonClasses["pageGutters"]} ${prefersDarkMode
        ? classes["containerDark"]
        : classes["containerLight"]}`}>
    <Grid item=true xs=Xs.\"12">
      <Grid container=true className={commonClasses["paragraphGap"]}>
        <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={commonClasses["bold"]}>
                {intl->Intl.formatMessage(registrationDatabaseTitle)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {intl->Intl.formatMessage(registrationDatabasePerson)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography> {Common.Constants.infoPhone->React.string} </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography> {Common.Constants.infoEmail->React.string} </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={commonClasses["bold"]}>
                {intl->Intl.formatMessage(clientsProductionDirectionTitle)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {intl->Intl.formatMessage(clientsProductionDirectionPerson)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography> {Common.Constants.bossEmail->React.string} </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid item=true xs=Xs.\"12" md=Md.\"4">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={commonClasses["bold"]}>
                {intl->Intl.formatMessage(studioRegistrationsTitle)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Common.OpenInNewButton
                label=registrationAddress
                onClick={onClick(Common.Constants.registrationAddressMapUrl)}
              />
            </Grid>
          </Grid>
        </Grid>
        <Grid item=true xs=Xs.\"12">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography> {intl->Intl.formatMessage(castingsInfo)->React.string} </Typography>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </Grid>
    <Common.Dialog
      isOpen={mapUrl->Belt.Option.isSome} onClose fullScreen={!isMdUp} fixedSize=isMdUp>
      <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
    </Common.Dialog>
  </Grid>
}