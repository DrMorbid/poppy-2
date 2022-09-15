type lineEmphasis = Normal | Bold | Large

type textLine = {
  emphasis: lineEmphasis,
  value: string,
}

type line = Empty | Filled(textLine)

type t = {date: Js.Date.t, content: list<line>}
