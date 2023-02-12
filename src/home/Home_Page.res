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
      <Common.Text header=firstParagraphHeader paragraphs={list{firstParagraph}} centerAll=true />
    </Grid>
    <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4" className={classes["horizontalGap"]}>
      <Common.Text header=secondParagraphHeader paragraphs={list{secondParagraph}} centerAll=true />
    </Grid>
    <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4" className={classes["horizontalGap"]}>
      <Common.Text header=thirdParagraphHeader paragraphs={list{thirdParagraph}} centerAll=true />
    </Grid>
    <Grid item=true xs=Xs.\"12" id=Common.Constants.SectionAnchor.latestNews>
      <hr />
    </Grid>
    <Grid item=true xs=Xs.\"12">
      <News.Section />
    </Grid>
  </Grid>
}
