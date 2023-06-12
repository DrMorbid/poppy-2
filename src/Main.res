open ReactDOM

%%raw(`import "./theme/background.css"`)
%%raw(`import "./theme/fonts.css"`)
%%raw(`import "./theme/pickers.css"`)

querySelector("#root")
->Option.getExn
->Client.createRoot
->Client.Root.render(
  <React.StrictMode>
    <Root />
  </React.StrictMode>,
)
