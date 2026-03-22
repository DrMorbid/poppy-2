type t = En | Cs

let toString = language =>
  switch language {
  | En => "en"
  | Cs => "cs"
  }

let fromString = language => language->String.startsWith("cs") ? Cs : En
