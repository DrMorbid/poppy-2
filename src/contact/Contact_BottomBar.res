open Mui
open Mui.Grid
open Message
open Message.Contact
open Emotion

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let (isMapBeingLoaded, setIsMapBeingLoaded) = React.useState(() => false)
  let intl = ReactIntl.useIntl()
  let theme = Core.useTheme()
  let isMdUp = Core.useMediaQuery(theme->Core.Breakpoint.get(#md->#up))

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
    className={cx([
      Common.Style.pageGuttersComplete(theme),
      theme->Common.Section.Classes.accentedBackgroundGreen,
    ])}>
    <Grid item=true xs=Xs.\"12">
      <Grid container=true className={Common.Style.paragraphGap}>
        <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={Common.Style.bold}>
                {intl->ReactIntl.Intl.formatMessage(registrationDatabaseTitle)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {intl->ReactIntl.Intl.formatMessage(registrationDatabasePerson)->React.string}
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
                {intl->ReactIntl.Intl.formatMessage(clientsProductionDirectionTitle)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {intl->ReactIntl.Intl.formatMessage(companyOwner)->React.string}
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
              <Typography className={Common.Style.bold}>
                {intl->ReactIntl.Intl.formatMessage(studioRegistrationsTitle)->React.string}
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
              <Typography>
                {intl->ReactIntl.Intl.formatMessage(castingsInfo)->React.string}
              </Typography>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </Grid>
    <Common.Dialog isOpen={mapUrl->Option.isSome} onClose fullScreen={!isMdUp} fixedSize=isMdUp>
      <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
    </Common.Dialog>
  </Grid>
}
