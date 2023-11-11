open Message.Home

module CarouselItem = Home_CarouselItem

@react.component
let make = () => {
  let whoWeAreTopRef = React.useRef(Nullable.null)
  let referencesTopRef = React.useRef(Nullable.null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect(() => {
    dispatch(App_Context.AddHomeMenuItemScrollableRef(WhoWeAre, whoWeAreTopRef))
    dispatch(App_Context.AddHomeMenuItemScrollableRef(References, referencesTopRef))

    None
  }, (whoWeAreTopRef, referencesTopRef))

  <Mui.Grid container=true className=Common.Style.islandsVerticalGap>
    <Mui.Grid item=true xs=Number(12)>
      <ReactMaterialUiCarousel autoPlay=true indicators=false animation=#slide>
        {[
          <CarouselItem image="/kids/pexels-bess-hamiti-35188.jpg" key="carousel-item-1" />,
          <CarouselItem image="/kids/pexels-lukas-296301.jpg" key="carousel-item-1" />,
          <CarouselItem image="/kids/pexels-samer-daboul-1212805.jpg" key="carousel-item-1" />,
          <CarouselItem image="/kids/pexels-samer-daboul-1815257.jpg" key="carousel-item-1" />,
        ]}
      </ReactMaterialUiCarousel>
    </Mui.Grid>
    <Common.Island
      header=firstParagraphHeader
      body=Paragraphs(list{firstParagraph})
      centerAll=true
      lg=Number(4)
      xl=Number(4)
    />
    <Common.Island
      header=secondParagraphHeader
      body=Paragraphs(list{secondParagraph})
      centerAll=true
      lg=Number(4)
      xl=Number(4)
    />
    <Common.Island
      header=thirdParagraphHeader
      body=Paragraphs(list{thirdParagraph})
      centerAll=true
      lg=Number(4)
      xl=Number(4)
    />
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
