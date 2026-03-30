%%raw(`import "./theme/background.css"`)
%%raw(`import "./theme/fonts.css"`)
%%raw(`import "./theme/pickers.css"`)
%%raw(`import "flag-icons/css/flag-icons.min.css"`)

@react.component
let default = (~children) => {
  <html>
    <body>
      <Main> {children} </Main>
    </body>
  </html>
}
