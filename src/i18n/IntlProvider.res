module Context = {
  let t = React.createContext((None, (_: Language.t) => ()))

  module Provider = {
    let make = React.Context.provider(t)
  }
}

@react.component
let make = (~children) => {
  let (selectedLanguage, setSelectedLanguage) = React.useState(() => None)

  React.useEffect(() => {
    let preselectedLanguage = Common.Storage.get(#language)
    let systemLanguage =
      (Webapi.Dom.window->Webapi.Dom.Window.navigator).language->Language.fromString

    setSelectedLanguage(_ => Some(preselectedLanguage->Option.getOr(systemLanguage)))

    None
  }, [])

  let setLanguage = language => {
    setSelectedLanguage(_ => Some(language))

    Common.Storage.set(#language, language)
  }

  <Context.Provider value=(Some(selectedLanguage), setLanguage)>
    {selectedLanguage
    ->Option.map(selectedLanguage =>
      <ReactIntl.IntlProvider
        defaultLocale={selectedLanguage->Language.toString}
        locale={selectedLanguage->Language.toString}
        messages={selectedLanguage->Translation.getTranslation}
      >
        {children}
      </ReactIntl.IntlProvider>
    )
    ->Option.getOr(<App_Loading />)}
  </Context.Provider>
}
