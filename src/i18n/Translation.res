type label = {
  message: string,
  description: option<string>,
}

@module("./_locales/cs/messages.json") external cs: Js.Dict.t<label> = "default"

let getTranslation = (language: Language.t) =>
  switch language {
  | Cs => cs
  } |> Js.Dict.map((. {message, _}) => message)
