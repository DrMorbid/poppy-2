open Message.Home

module CarouselItem = Home_CarouselItem

@react.component
let default = () => {
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)
  let isLgUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.lgUp)
  let whoWeAreTopRef = React.useRef(Nullable.null)
  let referencesTopRef = React.useRef(Nullable.null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect(() => {
    dispatch(App_Context.AddHomeMenuItemScrollableRef(WhoWeAre, whoWeAreTopRef))
    dispatch(App_Context.AddHomeMenuItemScrollableRef(References, referencesTopRef))

    None
  }, (whoWeAreTopRef, referencesTopRef))

  <Mui.Grid container=true sx=Common.Style.islandsVerticalGap>
    <Mui.Grid item=true xs=Number(12)>
      <ReactMaterialUiCarousel autoPlay=true indicators=false animation=#slide>
        {[
          <CarouselItem image="/kids/boy-light-hat.webp" key="carousel-item-0" />,
          <CarouselItem image="/kids/girl-crown-mirror.webp" key="carousel-item-1" />,
          <CarouselItem image="/kids/boy-megaphone-flap.webp" key="carousel-item-2" />,
          <CarouselItem image="/kids/girl-hand-flap.webp" key="carousel-item-3" />,
          <CarouselItem image="/kids/boy-megaphone-scream.webp" key="carousel-item-4" />,
          <CarouselItem image="/kids/girl-holding-flap.webp" key="carousel-item-5" />,
        ]}
      </ReactMaterialUiCarousel>
    </Mui.Grid>
    <Common.Island
      header=firstParagraphHeader body=Paragraphs(list{firstParagraph}) centerAll=true xl=Number(3)
    />
    <Common.Island
      header=secondParagraphHeader
      body=Paragraphs(list{secondParagraph})
      centerAll=true
      xl=Number(3)
    />
    <Common.Island
      header=thirdParagraphHeader body=Paragraphs(list{thirdParagraph}) centerAll=true xl=Number(3)
    />
    {isMdUp && !isLgUp
      ? <Common.Island body={Element(Jsx.null)} centerAll=true lg=Number(4) xl=Number(4) />
      : Jsx.null}
    <Common.Island
      header=fourthParagraphHeader
      body=Paragraphs(list{fourthParagraph})
      centerAll=true
      xl=Number(3)
    />
    {isMdUp && !isLgUp
      ? <Common.Island body={Element(Jsx.null)} centerAll=true lg=Number(4) xl=Number(4) />
      : Jsx.null}
    <Mui.Grid item=true xs=Number(12)>
      <App_ScrollableSections
        sections={list{
          {element: <WhoWeAre.Section />, topRef: whoWeAreTopRef},
          {element: <References.Section />, topRef: referencesTopRef},
        }}>
        <Mui.Grid item=true>
          <Contact.BottomBar />
        </Mui.Grid>
      </App_ScrollableSections>
    </Mui.Grid>
  </Mui.Grid>
}
