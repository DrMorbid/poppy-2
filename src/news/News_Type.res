type lineEmphasis = Normal | Bold

type line = {
  emphasis: lineEmphasis,
  value: string,
  nextLineEmpty: bool,
}

let makeLine = (~emphasis=Normal, ~nextLineEmpty=false, value) => {
  emphasis,
  value,
  nextLineEmpty,
}

type t = {date: Js.Date.t, title: list<string>, content: list<line>}
