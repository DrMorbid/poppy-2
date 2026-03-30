open Dom.Storage2

type storageKey = [#language]

let set = (storageKey: storageKey, value) =>
  localStorage->setItem((storageKey :> string), value->Language.toString)

let get = (storageKey: storageKey) =>
  localStorage
  ->getItem((storageKey :> string))
  ->Option.map(Language.fromString)
