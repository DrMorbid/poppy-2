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
  open Common.Constants.SectionAnchor

  let classes = useStyles(.)

  <Grid container=true className={classes["verticalGap"]}>
    <Grid item=true xs=Xs.\"12">
      <ReactMaterialUiCarousel autoPlay=true indicators=false animation=#slide>
        {[
          <CarouselItem image="/kids/pexels-bess-hamiti-35188.jpg" />,
          <CarouselItem image="/kids/pexels-lukas-296301.jpg" />,
          <CarouselItem image="/kids/pexels-samer-daboul-1212805.jpg" />,
          <CarouselItem image="/kids/pexels-samer-daboul-1815257.jpg" />,
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
        <Home_Section anchor=latestNews>
          <News.Section />
        </Home_Section>
        <Home_Section anchor=aboutUs>
          <AboutUs.Section />
        </Home_Section>
        <Home_Section anchor=references>
          <References.Section />
        </Home_Section>
      </Grid>
    </Grid>
  </Grid>
}
