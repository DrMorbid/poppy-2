open ReactDOM

%%raw(`import "./theme/background.css"`)
%%raw(`import "./theme/fonts.css"`)

querySelector("#root")
->Belt.Option.getExn
->Client.createRoot
->Client.Root.render(
  <React.StrictMode>
    <Root />
  </React.StrictMode>,
)
