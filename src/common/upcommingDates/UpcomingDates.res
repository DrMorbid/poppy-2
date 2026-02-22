let dates = list{Date.fromString("2026-03-03"), Date.fromString("2026-03-16")}

let indexToEmojiNumber = index =>
  switch index {
  | 1 => "1️⃣"
  | 2 => "2️⃣"
  | 3 => "3️⃣"
  | 4 => "4️⃣"
  | 5 => "5️⃣"
  | 6 => "6️⃣"
  | 7 => "7️⃣"
  | 8 => "8️⃣"
  | 9 => "9️⃣"
  | _ => "🔟"
  }

let format = date => {
  Intl.DateTimeFormat.make(
    ~locales=[Common.Constants.defaultLocale],
    ~options={dateStyle: #full},
  )->Intl.DateTimeFormat.format(date)
}

@react.component
let make = (~asList=false) => {
  <Common.Text
    body={asList
      ? Lists(list{
          {
            list: dates->List.mapWithIndex((date, index): Common.Text.Type.listRow => {
              content: String(`${indexToEmojiNumber(index + 1)} ${date->format}`),
              bold: true,
            }),
          },
        })
      : Paragraphs(
          dates->List.mapWithIndex((date, index): Common.Text.Type.paragraph => {
            content: String(`${indexToEmojiNumber(index + 1)} ${date->format}`),
            bold: true,
          }),
        )}
  />
}
