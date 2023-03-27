open Mui
open Mui.Grid
open Message.Home

module CarouselItem = Home_CarouselItem

@react.component
let make = () => {
  let whoWeAreTopRef = React.useRef(Js.Nullable.null)
  let referencesTopRef = React.useRef(Js.Nullable.null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect2(() => {
    dispatch(App_Context.AddHomeMenuItemScrollableRef(WhoWeAre, whoWeAreTopRef))
    dispatch(App_Context.AddHomeMenuItemScrollableRef(References, referencesTopRef))

    None
  }, (whoWeAreTopRef, referencesTopRef))

  <Grid container=true className=Common.Style.islandsVerticalGap>
    <Grid item=true xs=Xs.\"12">
      <ReactMaterialUiCarousel autoPlay=true indicators=false animation=#slide>
        {[
          <CarouselItem image="/kids/pexels-bess-hamiti-35188.jpg" key="carousel-item-1" />,
          <CarouselItem image="/kids/pexels-lukas-296301.jpg" key="carousel-item-1" />,
          <CarouselItem image="/kids/pexels-samer-daboul-1212805.jpg" key="carousel-item-1" />,
          <CarouselItem image="/kids/pexels-samer-daboul-1815257.jpg" key="carousel-item-1" />,
        ]}
      </ReactMaterialUiCarousel>
    </Grid>
    <Common.Island
      header=firstParagraphHeader
      body=Paragraphs(list{firstParagraph})
      centerAll=true
      lg=Lg.\"4"
      xl=Xl.\"4"
    />
    <Common.Island
      header=secondParagraphHeader
      body=Paragraphs(list{secondParagraph})
      centerAll=true
      lg=Lg.\"4"
      xl=Xl.\"4"
    />
    <Common.Island
      header=thirdParagraphHeader
      body=Paragraphs(list{thirdParagraph})
      centerAll=true
      lg=Lg.\"4"
      xl=Xl.\"4"
    />
    <Grid item=true xs=Xs.\"12">
      <App_ScrollableSections
        sections={list{
          {element: <WhoWeAre.Section />, topRef: whoWeAreTopRef},
          {element: <References.Section />, topRef: referencesTopRef},
        }}>
        <Grid item=true>
          <Contact.BottomBar />
        </Grid>
      </App_ScrollableSections>
    </Grid>
  </Grid>
}
