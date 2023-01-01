open Mui
open Mui.Grid
open ReactIntl
open Message.Contact
open Common

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let intl = useIntl()
  let commonClasses = Style.useStyles(.)
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))

  let onClose = _ => setMapUrl(_ => None)

  <Grid container=true>
    <Grid item=true xs=Xs.\"12">
      <Grid container=true className={commonClasses["paragraphGap"]}>
        {if isSmUp {
          <Grid item=true xs=Xs.\"12">
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
                {(intl->Intl.formatMessage(companyEmail) ++ " " ++ Constants.companyEmail)
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
                {(intl->Intl.formatMessage(infoContactPhone) ++ " " ++ Constants.infoPhone)
                  ->React.string}
              </Typography>
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Typography>
                {(intl->Intl.formatMessage(infoContactEmail) ++ " " ++ Constants.infoEmail)
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
                onClick={() => setMapUrl(_ => Some(Constants.registrationAddressMapUrl))}
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
                onClick={() => setMapUrl(_ => Some(Constants.registrationAddressPaidParking1))}
              />
            </Grid>
            <Grid item=true xs=Xs.\"12">
              <Common.OpenInNewButton
                label=registrationAddressPaidParking2
                onClick={() => setMapUrl(_ => Some(Constants.registrationAddressPaidParking2))}
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
                label=facturationAddress
                onClick={() => setMapUrl(_ => Some(Constants.facturationAddress))}
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
        <Contact_Map url=?mapUrl />
      </Grid>
    </Hidden>
    <Hidden mdUp=true>
      <Dialog onClose={_ => onClose} \"open"={mapUrl->Belt.Option.isSome} fullScreen=true>
        <DialogTitle>
          <Grid container=true justify=#"flex-end" alignItems=#center>
            <Grid item=true>
              <IconButton onClick=onClose>
                <Common.Icon.Close />
              </IconButton>
            </Grid>
          </Grid>
        </DialogTitle>
        <DialogContent>
          <Contact_Map url=?mapUrl />
        </DialogContent>
      </Dialog>
    </Hidden>
  </Grid>
}
