open Mui
open Mui.Grid
open ReactIntl
open Message.Contact

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let (isMapBeingLoaded, setIsMapBeingLoaded) = React.useState(() => false)
  let intl = useIntl()
  let commonClasses = Common.Style.useStyles(.)
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))

  let onClose = () => {
    setIsMapBeingLoaded(_ => false)
    setMapUrl(_ => None)
  }

  let onClick = (mapUrl, ()) => {
    setIsMapBeingLoaded(_ => true)
    setMapUrl(_ => Some(mapUrl))
  }

  let onMapLoadingFinished = _ => setIsMapBeingLoaded(_ => false)

  <Grid container=true>
    <Grid item=true xs=Xs.\"12">
      <Grid container=true className={commonClasses["paragraphGap"]}>
        {if isSmUp {
          <Grid item=true xs=Xs.\"12" className={commonClasses["centeredText"]}>
            <Typography variant=#h4> {intl->Intl.formatMessage(header)->React.string} </Typography>
          </Grid>
        } else {
          React.null
        }}
        <Grid item=true xs=Xs.\"12">
          <Typography className={commonClasses["bold"]}>
            {intl->Intl.formatMessage(openingTimes)->React.string}
          </Typography>
        </Grid>
      </Grid>
    </Grid>
    <Grid item=true xs=Xs.\"12" md=Md.\"6" className={commonClasses["headerGap"]}>
      <Grid container=true className={commonClasses["paragraphGap"]}>
        <Grid item=true xs=Xs.\"12">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={commonClasses["bold"]}>
                {intl->Intl.formatMessage(companyName)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography> {intl->Intl.formatMessage(companyOwner)->React.string} </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {(intl->Intl.formatMessage(companyEmail) ++ " " ++ Common.Constants.companyEmail)
                  ->React.string}
              </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid item=true xs=Xs.\"12">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={commonClasses["bold"]}>
                {intl->Intl.formatMessage(infoContactHeader)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {(intl->Intl.formatMessage(infoContactPhone) ++ " " ++ Common.Constants.infoPhone)
                  ->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {(intl->Intl.formatMessage(infoContactEmail) ++ " " ++ Common.Constants.infoEmail)
                  ->React.string}
              </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid item=true xs=Xs.\"12">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={commonClasses["bold"]}>
                {intl->Intl.formatMessage(registrationAddressHeader)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Common.OpenInNewButton
                label=registrationAddress
                onClick={onClick(Common.Constants.registrationAddressMapUrl)}
              />
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {intl->Intl.formatMessage(registrationAddressConnection)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {intl->Intl.formatMessage(registrationAddressParkingLabel)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {intl->Intl.formatMessage(registrationAddressParking)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Common.OpenInNewButton
                label=registrationAddressPaidParking1
                onClick={onClick(Common.Constants.registrationAddressPaidParking1)}
              />
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Common.OpenInNewButton
                label=registrationAddressPaidParking2
                onClick={onClick(Common.Constants.registrationAddressPaidParking2)}
              />
            </Grid>
          </Grid>
        </Grid>
        <Grid item=true xs=Xs.\"12">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography className={commonClasses["bold"]}>
                {intl->Intl.formatMessage(facturationAddressLabel)->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Common.OpenInNewButton
                label=facturationAddress onClick={onClick(Common.Constants.facturationAddress)}
              />
            </Grid>
          </Grid>
        </Grid>
        <Grid item=true xs=Xs.\"12">
          <Grid container=true>
            <Grid item=true xs=Xs.\"12">
              <Typography> {intl->Intl.formatMessage(idNumber)->React.string} </Typography>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </Grid>
    <Hidden smDown=true mdUp={mapUrl->Belt.Option.isNone}>
      <Grid item=true md=Md.\"6" className={commonClasses["headerGap"]}>
        <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
      </Grid>
    </Hidden>
    <Hidden mdUp=true>
      <Common.Dialog isOpen={mapUrl->Belt.Option.isSome} onClose fullScreen=true>
        <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
      </Common.Dialog>
    </Hidden>
  </Grid>
}
