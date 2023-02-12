// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Styles from "@material-ui/core/styles";

function getColors(prefersDarkTheme) {
  return {
          primary: prefersDarkTheme ? "#303030" : "#fafafa"
        };
}

function theme(prefersDarkTheme) {
  var colors = getColors(prefersDarkTheme);
  return Styles.createTheme({
              palette: {
                error: {
                  main: "#de0522"
                },
                info: {
                  main: "#ffe401"
                },
                primary: {
                  main: colors.primary
                },
                secondary: {
                  main: "#009ada"
                },
                success: {
                  main: "#68a130"
                },
                type: prefersDarkTheme ? "dark" : "light",
                warning: {
                  main: "#f1a300"
                }
              },
              typography: {
                fontFamily: "Maven Pro",
                h1: {
                  fontFamily: "Comfortaa",
                  fontSize: "2.8rem",
                  fontWeight: "800"
                },
                h2: {
                  fontFamily: "Comfortaa",
                  fontSize: "2.3rem",
                  fontWeight: "700"
                },
                h3: {
                  fontFamily: "Comfortaa",
                  fontSize: "1.9rem",
                  fontWeight: "600"
                },
                h4: {
                  fontFamily: "Comfortaa",
                  fontSize: "1.6rem",
                  fontWeight: "600"
                },
                h5: {
                  fontFamily: "Comfortaa",
                  fontSize: "1.4rem",
                  fontWeight: "500"
                },
                h6: {
                  fontFamily: "Comfortaa",
                  fontSize: "1.2rem",
                  fontWeight: "500"
                }
              }
            });
}

export {
  getColors ,
  theme ,
}
/* @material-ui/core/styles Not a pure module */
