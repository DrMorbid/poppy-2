open Common_Text_Type

module Fragment = Common_Text_Fragment
module TextList = Common_Text_List
module Text = Common_Text_Text
module Type = Common_Text_Type

@react.component
let make = (
  ~header=?,
  ~headerVariant: Mui.Typography.variant=H2,
  ~headerUppercase=false,
  ~afterHeader=?,
  ~body,
  ~centerAll=?,
  ~disableGutters=false,
) => {
  let intl = ReactIntl.useIntl()

  let getContainerClassname = () =>
    (disableGutters ? list{} : list{Common_Style.paragraphGap->Utils.Style.styleToSxArray})
    ->List.concat(
      centerAll->Option.mapOr(list{}, centerAll =>
        centerAll ? list{Common_Style.centeredText} : list{}
      ),
    )
    ->List.reduce([], (result, sx) => result->Array.concat([sx]))

  <Mui.Grid container=true sx={getContainerClassname()->Mui.Sx.array}>
    {header->Option.mapOr(React.null, header =>
      <Mui.Grid item=true xs=Number(12) sx={[Common_Style.centeredText]->Mui.Sx.array}>
        <Mui.Typography
          variant=headerVariant sx=?{headerUppercase ? Some(Common_Style.uppercaseText) : None}
        >
          {intl->ReactIntl.Intl.formatMessage(header)->React.string}
        </Mui.Typography>
      </Mui.Grid>
    )}
    {afterHeader->Option.mapOr(React.null, afterHeader =>
      <Mui.Grid item=true xs=Number(12)> afterHeader </Mui.Grid>
    )}
    {switch body {
    | Paragraphs(paragraphs) =>
      paragraphs
      ->List.mapWithIndex(({content, ?bold}, index) =>
        <Text key={`paragraph-${index->Int.toString}`}>
          <Mui.Typography
            sx=?{bold->Option.getOr(false) ? Some(Common_Style.bold->Mui.Sx.obj) : None}
          >
            {switch content {
            | Message(message) => intl->ReactIntl.Intl.formatMessage(message)
            | String(string) => string
            }->React.string}
          </Mui.Typography>
        </Text>
      )
      ->List.toArray
      ->React.array
    | Fragments(paragraphs) =>
      paragraphs
      ->List.mapWithIndex((fragments, index) =>
        <Text centered=?fragments.centered key={`paragraph-${index->Int.toString}`}>
          <Fragment fragments=fragments.content />
        </Text>
      )
      ->List.toArray
      ->React.array
    | Lists(paragraphs) => <TextList paragraphs />
    | Element(element) => <Text> element </Text>
    }}
  </Mui.Grid>
}
