module TextFragment = {
  type emphasis = Normal | Bold
  type space = Left | Right | Both
  type t = {
    emphasis: emphasis,
    value: string,
    hyperlink?: string,
    space?: space,
  }

  let make = (~emphasis=Normal, ~hyperlink=?, ~space=?, value) => {
    emphasis,
    value,
    ?hyperlink,
    ?space,
  }
}

module Line = {
  type t = {
    value: list<TextFragment.t>,
    nextLineEmpty: bool,
  }

  let make = (~nextLineEmpty=false, value) => {
    value,
    nextLineEmpty,
  }
}

type t = {title: list<string>, content: list<Line.t>}
