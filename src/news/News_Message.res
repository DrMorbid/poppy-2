open News_Latest
open News_Type.TextFragment

module Classes = {
  let spaceValue = 0.5
  let textFragmentSpacing = (space): Mui.System.props =>
    switch space {
    | Left => {marginLeft: Number(spaceValue)}
    | Right => {marginRight: Number(spaceValue)}
    | Both => {marginLeft: Number(spaceValue), marginRight: Number(spaceValue)}
    }
}

module Title = {
  @react.component
  let make = (~variant) => {
    latestNews.title
    ->List.mapWithIndex((titleLine, index) =>
      <Mui.Typography variant key={`news-title-line-${index->Int.toString}`}>
        {titleLine->React.string}
      </Mui.Typography>
    )
    ->List.toArray
    ->React.array
  }
}

let createStyling = (~space=?, emphasis) =>
  switch (emphasis, space) {
  | (Normal, Some(space)) => Some(space->Classes.textFragmentSpacing->Mui.Sx.obj)
  | (Normal, None) => None
  | (Bold, Some(space)) =>
    Some(
      [
        Common.Style.bold->Mui.Sx.Array.obj,
        space->Classes.textFragmentSpacing->Mui.Sx.Array.obj,
      ]->Mui.Sx.array,
    )
  | (Bold, None) => Some(Common.Style.bold->Mui.Sx.obj)
  }

@react.component
let make = () => {
  <Mui.Grid container=true>
    <Mui.Grid item=true>
      <Title variant=H5 />
      <Mui.Grid container=true direction=Column alignItems=Stretch sx=Common.Style.marginTopSm>
        {latestNews.content
        ->List.mapWithIndex(({value, nextLineEmpty}, rowIndex) =>
          <Mui.Grid
            item=true
            sx=?{if nextLineEmpty {
              Some(Common.Style.marginBottomSm)
            } else {
              None
            }}
            key={`news-line-${rowIndex->Int.toString}`}>
            <Mui.Grid container=true direction=Row>
              {value
              ->List.mapWithIndex(({value, emphasis, ?hyperlink, ?space}, index) =>
                <Mui.Grid
                  item=true
                  key={`news-line-${rowIndex->Int.toString}-fragment-${index->Int.toString}`}>
                  {hyperlink
                  ->Option.map(
                    href =>
                      <Mui.Link href sx=?{emphasis->createStyling(~space?)}>
                        {value->React.string}
                      </Mui.Link>,
                  )
                  ->Option.getOr(
                    <Mui.Typography sx=?{emphasis->createStyling(~space?)}>
                      {value->React.string}
                    </Mui.Typography>,
                  )}
                </Mui.Grid>
              )
              ->List.toArray
              ->React.array}
            </Mui.Grid>
          </Mui.Grid>
        )
        ->List.toArray
        ->React.array}
      </Mui.Grid>
    </Mui.Grid>
  </Mui.Grid>
}
