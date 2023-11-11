open Message
open Message.Contact

@react.component
let make = () => {
  let (mapUrl, setMapUrl) = React.useState(() => None)
  let (isMapBeingLoaded, setIsMapBeingLoaded) = React.useState(() => false)
  let intl = ReactIntl.useIntl()
  let topRef = React.useRef(null)

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
      <App_ScrollableSections
        sections={list{
          {
            element: <Mui.Grid container=true>
              <Mui.Grid item=true xs=Number(12)>
                <Mui.Grid
                  container=true
                  className={Emotion.cx([Common.Style.paragraphGap, Common.Style.marginBottom])}>
                  <Mui.Grid item=true xs=Number(12)>
                    <Mui.Typography className=Common.Style.bold>
                      {intl->ReactIntl.Intl.formatMessage(openingTimes)->React.string}
                    </Mui.Typography>
                  </Mui.Grid>
                </Mui.Grid>
              </Mui.Grid>
              <Mui.Grid
                item=true
                xs=Number(12)
                md={mapUrl->Option.isSome ? Number(6) : Number(12)}
                className=Common.Style.headerGap>
                <Mui.Grid container=true className=Common.Style.paragraphGap>
                  <Mui.Grid
                    item=true
                    xs=Number(12)
                    sm=Number(6)
                    md={mapUrl->Option.isSome ? Number(12) : Number(6)}>
                    <Mui.Grid container=true>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography className=Common.Style.bold>
                          {intl
                          ->ReactIntl.Intl.formatMessage(registrationDatabaseTitle)
                          ->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {intl
                          ->ReactIntl.Intl.formatMessage(registrationDatabasePerson)
                          ->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {Common.Constants.infoPhone->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {Common.Constants.infoEmail->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                    </Mui.Grid>
                  </Mui.Grid>
                  <Mui.Grid
                    item=true
                    xs=Number(12)
                    sm=Number(6)
                    md={mapUrl->Option.isSome ? Number(12) : Number(6)}>
                    <Mui.Grid container=true>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography className=Common.Style.bold>
                          {intl
                          ->ReactIntl.Intl.formatMessage(clientsProductionDirectionTitle)
                          ->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {intl->ReactIntl.Intl.formatMessage(companyOwner)->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {Common.Constants.bossEmail->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                    </Mui.Grid>
                  </Mui.Grid>
                  <Mui.Grid
                    item=true
                    xs=Number(12)
                    sm=Number(6)
                    md={mapUrl->Option.isSome ? Number(12) : Number(6)}>
                    <Mui.Grid container=true>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography className=Common.Style.bold>
                          {intl
                          ->ReactIntl.Intl.formatMessage(registrationAddressHeader)
                          ->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Common.OpenInNewButton
                          label=registrationAddress
                          onClick={onClick(Common.Constants.registrationAddressMapUrl)}
                        />
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {intl
                          ->ReactIntl.Intl.formatMessage(registrationAddressConnection)
                          ->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {intl
                          ->ReactIntl.Intl.formatMessage(registrationAddressParkingLabel)
                          ->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {intl
                          ->ReactIntl.Intl.formatMessage(registrationAddressParking)
                          ->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Common.OpenInNewButton
                          label=registrationAddressPaidParking1
                          onClick={onClick(Common.Constants.registrationAddressPaidParking1)}
                        />
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Common.OpenInNewButton
                          label=registrationAddressPaidParking2
                          onClick={onClick(Common.Constants.registrationAddressPaidParking2)}
                        />
                      </Mui.Grid>
                    </Mui.Grid>
                  </Mui.Grid>
                  <Mui.Grid
                    item=true
                    xs=Number(12)
                    sm=Number(6)
                    md={mapUrl->Option.isSome ? Number(12) : Number(6)}>
                    <Mui.Grid container=true>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography className=Common.Style.bold>
                          {intl
                          ->ReactIntl.Intl.formatMessage(facturationAddressLabel)
                          ->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                      <Mui.Grid item=true xs=Number(12)>
                        <Common.OpenInNewButton
                          label=facturationAddress
                          onClick={onClick(Common.Constants.facturationAddress)}
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
                  <Mui.Grid item=true xs=Number(12)>
                    <Mui.Grid container=true>
                      <Mui.Grid item=true xs=Number(12)>
                        <Mui.Typography>
                          {intl->ReactIntl.Intl.formatMessage(idNumber)->React.string}
                        </Mui.Typography>
                      </Mui.Grid>
                    </Mui.Grid>
                  </Mui.Grid>
                </Mui.Grid>
              </Mui.Grid>
              <Mui.Hidden smDown=true mdUp={mapUrl->Option.isNone}>
                <Mui.Grid item=true md=Number(6) className=Common.Style.headerGap>
                  <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
                </Mui.Grid>
              </Mui.Hidden>
              <Mui.Hidden mdUp=true>
                <Common.Dialog isOpen={mapUrl->Option.isSome} onClose fullScreen=true>
                  <Contact_Map url=?mapUrl isMapBeingLoaded onMapLoadingFinished />
                </Common.Dialog>
              </Mui.Hidden>
            </Mui.Grid>,
            topRef,
            accented: Green,
          },
        }}
        coloredSections=Odd
      />,
    )
  />
}
