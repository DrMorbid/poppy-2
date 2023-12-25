%%raw(`import "./theme/background.css"`)
%%raw(`import "./theme/fonts.css"`)
%%raw(`import "./theme/pickers.css"`)

@react.component
let default = (~children) => {
  <html lang="cs">
    <body>
      <Main> {children} </Main>
    </body>
  </html>
}
