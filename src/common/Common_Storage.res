open Dom.Storage2

type storageKey = [#language]

let defaultLanguage = "en"

let set = (storageKey: storageKey, value) => sessionStorage->setItem((storageKey :> string), value)

let get = (storageKey: storageKey) =>
  sessionStorage->getItem((storageKey :> string))->Option.getOr(defaultLanguage)
