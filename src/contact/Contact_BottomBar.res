open Mui
open Mui.Grid
open ReactIntl
open Message
open Message.Contact
open ReactDOM

module Classes = {
  let containerLight = (theme: Theme.t) =>
    Style.make(~backgroundColor=theme.palette.success.light, ())->Emotion.styleToClass
  let containerDark = (theme: Theme.t) =>
    Style.make(~backgroundColor=theme.palette.success.dark, ())->Emotion.styleToClass
}

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let (isMapBeingLoaded, setIsMapBeingLoaded) = React.useState(() => false)
  let intl = useIntl()
  let theme = Core.useTheme()
  let isMdUp = Core.useMediaQuery(theme->Core.Breakpoint.get(#md->#up))
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
    className={Emotion.cx([
      Common.Style.pageGuttersComplete(theme),
      prefersDarkMode ? theme->Classes.containerDark : theme->Classes.containerLight,
    ])}>
    <Grid item=true xs=Xs.\"12">
      <Grid container=true className={Common.Style.paragraphGap}>
        <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={Common.Style.bold}>
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
              <Typography className={Common.Style.bold}>
                {intl->Intl.formatMessage(clientsProductionDirectionTitle)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography> {intl->Intl.formatMessage(companyOwner)->React.string} </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography> {Common.Constants.bossEmail->React.string} </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid item=true xs=Xs.\"12" md=Md.\"4">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={Common.Style.bold}>
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
