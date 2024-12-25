open Message
open Message.Contact

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let (isMapBeingLoaded, setIsMapBeingLoaded) = React.useState(() => false)
  let intl = ReactIntl.useIntl()
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)

  let onClose = () => {
    setIsMapBeingLoaded(_ => false)
    setMapUrl(_ => None)
  }

  let onClick = mapUrl => {
    setIsMapBeingLoaded(_ => true)
    setMapUrl(_ => Some(mapUrl))
  }

  let onMapLoadingFinished = _ => setIsMapBeingLoaded(_ => false)

  <Mui.Grid
    container=true
    sx={[
      Common.Style.pageGuttersComplete,
      Common.Section.Classes.accentedBackgroundGreen,
    ]->Mui.Sx.array}>
    <Mui.Grid item=true xs=Number(12)>
      <Mui.Grid container=true sx={Common.Style.paragraphGap->Utils.Style.styleToSx}>
        <Mui.Grid item=true xs=Number(12) sm=Number(6) md=Number(4)>
          <Mui.Grid container=true>
            <Mui.Grid item=true xs=Number(12)>
              <Mui.Typography sx={Common.Style.bold->Mui.Sx.obj}>
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
              <Mui.Typography sx={Common.Style.bold->Mui.Sx.obj}>
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
              <Mui.Typography sx={Common.Style.bold->Mui.Sx.obj}>
                {intl->ReactIntl.Intl.formatMessage(studioRegistrationsTitle)->React.string}
              </Mui.Typography>
            </Mui.Grid>
            <Mui.Grid item=true xs=Number(12)>
              <Common.OpenInNewButton
                label=registrationAddress
                onClick={() => onClick(Common.Constants.registrationAddressMapUrl)}
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
