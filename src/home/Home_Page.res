open Mui
open Mui.Grid
open Message.Home
open ReactDOM

module CarouselItem = Home_CarouselItem

let useStyles: Styles.useStyles<{
  "verticalGap": string,
  "horizontalGap": string,
}> = Styles.makeStyles({
  "verticalGap": Style.make(~gridRowGap="2rem", ()),
  "horizontalGap": Style.make(~paddingLeft="1rem", ~paddingRight="1rem", ()),
})

@react.component
let make = () => {
  let classes = useStyles(.)
  let latestNewsTopRef = React.useRef(Js.Nullable.null)
  let aboutUsTopRef = React.useRef(Js.Nullable.null)
  let referencesTopRef = React.useRef(Js.Nullable.null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect3(() => {
    dispatch(App_Context.AddMenuItemScrollableRef(LatestNews, latestNewsTopRef))
    dispatch(App_Context.AddMenuItemScrollableRef(AboutUs, aboutUsTopRef))
    dispatch(App_Context.AddMenuItemScrollableRef(References, referencesTopRef))

    None
  }, (latestNewsTopRef, aboutUsTopRef, referencesTopRef))

  <Grid container=true className={classes["verticalGap"]}>
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
    <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4" className={classes["horizontalGap"]}>
      <Common.Text
        header=firstParagraphHeader body=Paragraphs(list{firstParagraph}) centerAll=true
      />
    </Grid>
    <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4" className={classes["horizontalGap"]}>
      <Common.Text
        header=secondParagraphHeader body=Paragraphs(list{secondParagraph}) centerAll=true
      />
    </Grid>
    <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4" className={classes["horizontalGap"]}>
      <Common.Text
        header=thirdParagraphHeader body=Paragraphs(list{thirdParagraph}) centerAll=true
      />
    </Grid>
    <Grid item=true xs=Xs.\"12">
      <Grid container=true direction=#column alignItems=#stretch className={classes["verticalGap"]}>
        <Home_Section colored=true topRef=latestNewsTopRef>
          <News.Section />
        </Home_Section>
        <Home_Section topRef=aboutUsTopRef>
          <AboutUs.Section />
        </Home_Section>
        <Home_Section colored=true topRef=referencesTopRef>
          <References.Section />
        </Home_Section>
        <Grid item=true>
          <Contact.BottomBar />
        </Grid>
      </Grid>
    </Grid>
  </Grid>
}
