let text = "de"
let background = "bf"

type kind = [#text | #background | #button]

let addTransparency = (color, kind: kind) => {
  let normalizeColor = color =>
    if color->String.length == 4 {
      color->String.charAt(0) ++
      color->String.charAt(1) ++
      color->String.charAt(1) ++
      color->String.charAt(2) ++
      color->String.charAt(2) ++
      color->String.charAt(3) ++
      color->String.charAt(3)
    } else {
      color
    }

  color->normalizeColor ++
    switch kind {
    | #background => "bf"
    | #text => "f2"
    | #button => "3b"
    }
}
