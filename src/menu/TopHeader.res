open Message.Menu
open ReactIntl
open ReactDOM

module Container = TopHeader_Container

module Classes = {
  let logoContainer = Mui.Sx.obj({width: String("26%")})
  let logo: Style.t = {height: "10vw"}
  let buttonPaddingValue = 2.
  let buttonPlacementLeft = Mui.Sx.obj({
    paddingTop: Number(buttonPaddingValue),
    paddingLeft: Number(buttonPaddingValue),
    paddingBottom: Number(buttonPaddingValue),
  })
  let buttonPlacementRight = Mui.Sx.obj({
    paddingTop: Number(buttonPaddingValue),
    paddingRight: Number(buttonPaddingValue),
    paddingBottom: Number(buttonPaddingValue),
  })
  let buttonsFullHeight = Mui.Sx.obj({height: Stretch})
  let buttonsPadding = {gridColumnGap: "1rem"}->Utils.Style.styleToSx
  let flagsContainer = Mui.Sx.array([
    Mui.Sx.Array.obj({
      gap: String("0.5rem"),
      border: String("1px solid"),
      padding: String("5px 10px"),
      borderRadius: String("4px"),
    }),
    Mui.Sx.Array.func(theme =>
      Mui.Sx.Array.obj({
        borderColor: String(theme["palette"]["text"]["primary"]),
      })
    ),
  ])
  let flagButton = isMdUp =>
    Mui.Sx.obj({
      fontSize: isMdUp ? String("2rem") : String("1.3rem"),
      lineHeight: Number(1.0),
      borderRadius: isMdUp ? String("4px") : String("2px"),
      overflow: Hidden,
    })
}

@react.component
let make = () => {
  let intl = useIntl()
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)
  let router = Next.Navigation.useRouter()
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)

  let onEmailUs = () => router->App_Page.goTo(EmailUs)

  let onLogoClick = _ => router->App_Page.goTo(Home)

  let onRegisterClick = _ => router->App_Page.goTo(Registrations)

  let onPhotosRetakeClick = _ => router->App_Page.goTo(PhotosRetake)

  let onCzFlagClick = _ => ()

  let onUsFlagClick = _ => ()

  <Container>
    <Mui.Grid item=true sx=?{isMdUp ? Some(Classes.buttonPlacementLeft) : None}>
      <Mui.Grid
        container=true
        sx={isMdUp ? Classes.buttonsFullHeight : Classes.buttonsPadding}
        direction={isMdUp ? Column : Row}
        justifyContent={isMdUp ? String("space-between") : FlexEnd}
        alignItems=?{isMdUp ? Some(FlexStart) : None}
      >
        <Mui.Grid item=true>
          <Common.Button.WithIcon
            label=emailUs large=?{isMdUp ? Some(true) : None} onClick={_ => onEmailUs()->ignore}
          />
        </Mui.Grid>
        <Mui.Grid item=true>
          <Mui.Grid container=true direction=Row sx=Classes.flagsContainer alignItems=Center>
            <Mui.Grid item=true>
              <Mui.ButtonBase onClick=onCzFlagClick sx={Classes.flagButton(isMdUp)}>
                <Common.Icon.Flag.Cz />
              </Mui.ButtonBase>
            </Mui.Grid>
            <Mui.Grid item=true>
              <Mui.ButtonBase onClick=onUsFlagClick sx={Classes.flagButton(isMdUp)}>
                <Common.Icon.Flag.En />
              </Mui.ButtonBase>
            </Mui.Grid>
          </Mui.Grid>
        </Mui.Grid>
      </Mui.Grid>
    </Mui.Grid>
    <Mui.Hidden mdDown=true>
      <Mui.Grid item=true sx=Classes.logoContainer>
        <Mui.ButtonBase onClick=onLogoClick sx=Common.Style.fullWidth>
          <img
            src={prefersDarkMode ? "/poppy-logo-dark.png" : "/poppy-logo-light.png"}
            style=Classes.logo
          />
        </Mui.ButtonBase>
      </Mui.Grid>
    </Mui.Hidden>
    <Mui.Grid item=true sx=?{isMdUp ? Some(Classes.buttonPlacementRight) : None}>
      <Mui.Grid
        container=true
        sx={isMdUp ? Classes.buttonsFullHeight : Classes.buttonsPadding}
        direction={isMdUp ? Column : Row}
        justifyContent={isMdUp ? String("space-between") : FlexEnd}
        alignItems=?{isMdUp ? Some(FlexEnd) : None}
      >
        <Mui.Grid item=true>
          <Mui.Button
            size=?{isMdUp ? Some(Large) : None}
            variant=Contained
            color={Error}
            onClick=onRegisterClick
            sx=?{isMdUp ? Some(Common.Style.largeButtonLabel) : None}
          >
            {intl->ReactIntl.Intl.formatMessage(registrations)->React.string}
          </Mui.Button>
        </Mui.Grid>
        <Mui.Grid item=true>
          <Mui.Button
            size=?{isMdUp ? Some(Large) : None}
            variant=Contained
            color={Error}
            onClick=onPhotosRetakeClick
            sx=?{isMdUp ? Some(Common.Style.largeButtonLabel) : None}
          >
            {intl->ReactIntl.Intl.formatMessage(photosRetake)->React.string}
          </Mui.Button>
        </Mui.Grid>
      </Mui.Grid>
    </Mui.Grid>
  </Container>
}
