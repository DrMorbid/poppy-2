open Language

@react.component
let make = (~children) => {
  let (systemLanguage, setSystemLanguage) = React.useState(() => "en")
  let (selectedLanguage, setSelectedLanguage) = React.useState(() => En)

  React.useEffect0(() => {
    setSystemLanguage(_ => (Webapi.Dom.window->Webapi.Dom.Window.navigator).language)

    None
  })

  React.useEffect(() => {
    setSelectedLanguage(_ => systemLanguage->Language.fromString)

    Common.Storage.set(#language, systemLanguage)

    None
  }, [systemLanguage])

  <ReactIntl.IntlProvider
    defaultLocale={selectedLanguage->toString}
    locale={selectedLanguage->toString}
    messages={selectedLanguage->Translation.getTranslation}
  >
    {children}
  </ReactIntl.IntlProvider>
}
