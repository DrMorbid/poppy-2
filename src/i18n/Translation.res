type label = {
  message: string,
  description: option<string>,
}

@module("./_locales/cs/messages.json") external cs: Dict.t<label> = "default"

let getTranslation = (language: Language.t) => {
  switch language {
  | Cs => cs
  }
  ->Dict.toArray
  ->Array.map(((messageId, {message, _})) => (messageId, message))
  ->Dict.fromArray
}
