type t = Cs

let fromString = languageCode =>
  switch languageCode {
  | "cs" => Some(Cs)
  | "cs-CZ" => Some(Cs)
  | "cs_CZ" => Some(Cs)
  | _ => None
  }

let toString = language =>
  switch language {
  | Cs => "cs"
  }
