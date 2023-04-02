open Mui
open Mui.Grid
open Message
open Message.Contact

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let (isMapBeingLoaded, setIsMapBeingLoaded) = React.useState(() => false)
  let intl = ReactIntl.useIntl()

  let onClose = () => {
    setIsMapBeingLoaded(_ => false)
    setMapUrl(_ => None)
  }

  let onClick = (mapUrl, ()) => {
    setIsMapBeingLoaded(_ => true)
    setMapUrl(_ => Some(mapUrl))
  }

  let onMapLoadingFinished = _ => setIsMapBeingLoaded(_ => false)

  <Common.Text
    header
    body=Element(
      <Grid container=true>
        <Grid item=true xs=Xs.\"12">
          <Grid
            container=true
            className={Emotion.cx([Common.Style.paragraphGap, Common.Style.marginBottom])}>
            <Grid item=true xs=Xs.\"12">
              <Typography className=Common.Style.bold>
                {intl->ReactIntl.Intl.formatMessage(openingTimes)->React.string}
              </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid
          item=true
          xs=Xs.\"12"
          md={mapUrl->Option.isSome ? Md.\"6" : Md.\"12"}
          className=Common.Style.headerGap>
          <Grid container=true className=Common.Style.paragraphGap>
            <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md={mapUrl->Option.isSome ? Md.\"12" : Md.\"6"}>
              <Grid container=true>
                <Grid item=true xs=Xs.\"12">
                  <Typography className=Common.Style.bold>
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
            <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md={mapUrl->Option.isSome ? Md.\"12" : Md.\"6"}>
              <Grid container=true>
                <Grid item=true xs=Xs.\"12">
                  <Typography className=Common.Style.bold>
                    {intl
                    ->ReactIntl.Intl.formatMessage(clientsProductionDirectionTitle)
                    ->React.string}
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
            <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md={mapUrl->Option.isSome ? Md.\"12" : Md.\"6"}>
              <Grid container=true>
                <Grid item=true xs=Xs.\"12">
                  <Typography className=Common.Style.bold>
                    {intl->ReactIntl.Intl.formatMessage(registrationAddressHeader)->React.string}
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
                    {intl
                    ->ReactIntl.Intl.formatMessage(registrationAddressConnection)
                    ->React.string}
                  </Typography>
                </Grid>
                <Grid item=true xs=Xs.\"12">
                  <Typography>
                    {intl
                    ->ReactIntl.Intl.formatMessage(registrationAddressParkingLabel)
                    ->React.string}
                  </Typography>
                </Grid>
                <Grid item=true xs=Xs.\"12">
                  <Typography>
                    {intl->ReactIntl.Intl.formatMessage(registrationAddressParking)->React.string}
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
            <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md={mapUrl->Option.isSome ? Md.\"12" : Md.\"6"}>
              <Grid container=true>
                <Grid item=true xs=Xs.\"12">
                  <Typography className=Common.Style.bold>
                    {intl->ReactIntl.Intl.formatMessage(facturationAddressLabel)->React.string}
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
                  <Typography>
                    {intl->ReactIntl.Intl.formatMessage(castingsInfo)->React.string}
                  </Typography>
                </Grid>
              </Grid>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Grid container=true>
                <Grid item=true xs=Xs.\"12">
                  <Typography>
                    {intl->ReactIntl.Intl.formatMessage(idNumber)->React.string}
                  </Typography>
                </Grid>
              </Grid>
            </Grid>
          </Grid>
        </Grid>
        <Hidden smDown=true mdUp={mapUrl->Option.isNone}>
          <Grid item=true md=Md.\"6" className=Common.Style.headerGap>
            <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
          </Grid>
        </Hidden>
        <Hidden mdUp=true>
          <Common.Dialog isOpen={mapUrl->Option.isSome} onClose fullScreen=true>
            <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
          </Common.Dialog>
        </Hidden>
      </Grid>,
    )
  />
}
