open Message
open Message.Contact
open Emotion

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let (isMapBeingLoaded, setIsMapBeingLoaded) = React.useState(() => false)
  let intl = ReactIntl.useIntl()
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common_Constants.darkModeMediaQuery)
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)

  let onClose = () => {
    setIsMapBeingLoaded(_ => false)
    setMapUrl(_ => None)
  }

  let onClick = (mapUrl, ()) => {
    setIsMapBeingLoaded(_ => true)
    setMapUrl(_ => Some(mapUrl))
  }

  let onMapLoadingFinished = _ => setIsMapBeingLoaded(_ => false)

  <Mui.Grid
    container=true
    className={cx([
      Common.Style.pageGuttersComplete,
      Common.Section.Classes.accentedBackgroundGreen(prefersDarkMode),
    ])}>
    <Mui.Grid item=true xs=Number(12)>
      <Mui.Grid container=true className={Common.Style.paragraphGap}>
        <Mui.Grid item=true xs=Number(12) sm=Number(6) md=Number(4)>
          <Mui.Grid container=true>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography className={Common.Style.bold}>
                {intl->ReactIntl.Intl.formatMessage(registrationDatabaseTitle)->React.string}
              </Mui.Typography>
            </Mui.Grid>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography>
                {intl->ReactIntl.Intl.formatMessage(registrationDatabasePerson)->React.string}
              </Mui.Typography>
            </Mui.Grid>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography> {Common.Constants.infoPhone->React.string} </Mui.Typography>
            </Mui.Grid>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography> {Common.Constants.infoEmail->React.string} </Mui.Typography>
            </Mui.Grid>
          </Mui.Grid>
        </Mui.Grid>
        <Mui.Grid item=true xs=Number(12) sm=Number(6) md=Number(4)>
          <Mui.Grid container=true>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography className={Common.Style.bold}>
                {intl->ReactIntl.Intl.formatMessage(clientsProductionDirectionTitle)->React.string}
              </Mui.Typography>
            </Mui.Grid>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography>
                {intl->ReactIntl.Intl.formatMessage(companyOwner)->React.string}
              </Mui.Typography>
            </Mui.Grid>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography> {Common.Constants.bossEmail->React.string} </Mui.Typography>
            </Mui.Grid>
          </Mui.Grid>
        </Mui.Grid>
        <Mui.Grid item=true xs=Number(12) md=Number(4)>
          <Mui.Grid container=true>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography className={Common.Style.bold}>
                {intl->ReactIntl.Intl.formatMessage(studioRegistrationsTitle)->React.string}
              </Mui.Typography>
            </Mui.Grid>
            <Mui.Grid item=true xs=Number(12)>
              <Common.OpenInNewButton
                label=registrationAddress
                onClick={onClick(Common.Constants.registrationAddressMapUrl)}
              />
            </Mui.Grid>
          </Mui.Grid>
        </Mui.Grid>
        <Mui.Grid item=true xs=Number(12)>
          <Mui.Grid container=true>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography>
                {intl->ReactIntl.Intl.formatMessage(castingsInfo)->React.string}
              </Mui.Typography>
            </Mui.Grid>
          </Mui.Grid>
        </Mui.Grid>
      </Mui.Grid>
    </Mui.Grid>
    <Common.Dialog isOpen={mapUrl->Option.isSome} onClose fullScreen={!isMdUp} fixedSize=isMdUp>
      <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
    </Common.Dialog>
  </Mui.Grid>
}
