open Message.UpcomingDates

let dates = list{
  Date.fromString("2026-04-09"),
  Date.fromString("2026-04-22"),
  Date.fromString("2026-05-05"),
  Date.fromString("2026-05-25"),
  Date.fromString("2026-06-10"),
}

let additionalLines = list{upcomingDatesAdditionalLine}

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
    ~locales=[Common.Storage.get(#language)],
    ~options={dateStyle: #full},
  )->Intl.DateTimeFormat.format(date)
}

@react.component
let make = (~asList=false) => {
  <Common.Text
    body={asList
      ? Lists(list{
          {
            list: dates
            ->List.mapWithIndex((date, index): Common.Text.Type.listRow => {
              content: String(`${indexToEmojiNumber(index + 1)} ${date->format}`),
              bold: true,
            })
            ->List.concat(
              additionalLines->List.map((message): Common.Text.Type.listRow => {
                content: Message(message),
              }),
            ),
          },
        })
      : Paragraphs(
          dates
          ->List.mapWithIndex((date, index): Common.Text.Type.paragraph => {
            content: String(`${indexToEmojiNumber(index + 1)} ${date->format}`),
            bold: true,
          })
          ->List.concat(
            additionalLines->List.map((message): Common.Text.Type.paragraph => {
              content: Message(message),
            }),
          ),
        )}
  />
}
