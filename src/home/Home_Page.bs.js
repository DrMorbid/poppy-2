// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Message from "../i18n/Message.bs.js";
import * as Grid$Mui from "rescript-material-ui/src/Grid.bs.js";
import * as Common_Text from "../common/Common_Text.bs.js";
import * as Core from "@material-ui/core";
import * as Home_CarouselItem from "./Home_CarouselItem.bs.js";
import * as Styles from "@material-ui/styles";
import ReactMaterialUiCarousel from "react-material-ui-carousel";

var useStyles = Styles.makeStyles({
      verticalGap: {
        gridRowGap: "2rem"
      },
      horizontalGap: {
        paddingRight: "1rem",
        paddingLeft: "1rem"
      }
    });

function Home_Page(Props) {
  var classes = useStyles();
  return React.createElement(Core.Grid, {
              children: null,
              className: classes.verticalGap,
              container: true
            }, React.createElement(Core.Grid, {
                  children: React.createElement(ReactMaterialUiCarousel, {
                        autoPlay: true,
                        indicators: false,
                        animation: "slide",
                        children: [
                          React.createElement(Home_CarouselItem.make, {
                                image: "/kids/pexels-bess-hamiti-35188.jpg"
                              }),
                          React.createElement(Home_CarouselItem.make, {
                                image: "/kids/pexels-lukas-296301.jpg"
                              }),
                          React.createElement(Home_CarouselItem.make, {
                                image: "/kids/pexels-samer-daboul-1212805.jpg"
                              }),
                          React.createElement(Home_CarouselItem.make, {
                                image: "/kids/pexels-samer-daboul-1815257.jpg"
                              })
                        ]
                      }),
                  item: true,
                  xs: Grid$Mui.Xs[12]
                }), React.createElement(Core.Grid, {
                  children: React.createElement(Common_Text.make, {
                        header: Message.Home.firstParagraphHeader,
                        paragraphs: {
                          hd: Message.Home.firstParagraph,
                          tl: /* [] */0
                        },
                        centerAll: true
                      }),
                  className: classes.horizontalGap,
                  item: true,
                  md: Grid$Mui.Md[4],
                  sm: Grid$Mui.Sm[6],
                  xs: Grid$Mui.Xs[12]
                }), React.createElement(Core.Grid, {
                  children: React.createElement(Common_Text.make, {
                        header: Message.Home.secondParagraphHeader,
                        paragraphs: {
                          hd: Message.Home.secondParagraph,
                          tl: /* [] */0
                        },
                        centerAll: true
                      }),
                  className: classes.horizontalGap,
                  item: true,
                  md: Grid$Mui.Md[4],
                  sm: Grid$Mui.Sm[6],
                  xs: Grid$Mui.Xs[12]
                }), React.createElement(Core.Grid, {
                  children: React.createElement(Common_Text.make, {
                        header: Message.Home.thirdParagraphHeader,
                        paragraphs: {
                          hd: Message.Home.thirdParagraph,
                          tl: /* [] */0
                        },
                        centerAll: true
                      }),
                  className: classes.horizontalGap,
                  item: true,
                  md: Grid$Mui.Md[4],
                  sm: Grid$Mui.Sm[6],
                  xs: Grid$Mui.Xs[12]
                }));
}

var CarouselItem;

var make = Home_Page;

export {
  CarouselItem ,
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
