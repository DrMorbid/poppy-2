open Common_Text_Type

module Text = Common_Text_Text

module Classes = {
  let listItemIcon = (~level=?) =>
    [
      Mui.Sx.Array.func(theme =>
        Mui.Sx.Array.obj({
          color: String(theme["palette"]["text"]["primary"]),
          fontSize: String("0.5rem"),
        })
      ),
    ]
    ->Array.concat(
      level
      ->Option.map(_ => [
        Mui.Sx.Array.obj({justifyContent: FlexEnd, paddingRight: String("0.5rem")}),
      ])
      ->Option.getOr([]),
    )
    ->Mui.Sx.array
  let embeddedListItem = Mui.Sx.obj({paddingTop: Number(0.), paddingBottom: Number(0.)})
}

module ItemIcon = {
  @react.component
  let make = (~number=?, ~level=?) => {
    <Mui.ListItemIcon sx={Classes.listItemIcon(~level?)}>
      {number
      ->Option.map(number =>
        <Mui.Typography> {`${number->Int.toString}.`->React.string} </Mui.Typography>
      )
      ->Option.getOr(<Common_Icon.Circle fontSize="inherit" />)}
    </Mui.ListItemIcon>
  }
}

module ItemWrapper = {
  @react.component
  let make = (~level=?, ~children) => {
    level
    ->Option.map(_ =>
      <Mui.List disablePadding=true>
        <Mui.ListItem sx=Classes.embeddedListItem> {children} </Mui.ListItem>
      </Mui.List>
    )
    ->Option.getOr(<> {children} </>)
  }
}

@react.component
let make = (~paragraphs) => {
  let intl = ReactIntl.useIntl()

  paragraphs
  ->List.mapWithIndex((paragraph, index) =>
    <Mui.Grid container=true key={`paragraph-${index->Int.toString}`}>
      {paragraph.title->Option.mapOr(React.null, title =>
        <Text>
          <Mui.Typography>
            {intl->ReactIntl.Intl.formatMessage(title)->React.string}
          </Mui.Typography>
        </Text>
      )}
      <Mui.Grid item=true xs=Number(12)>
        <Mui.List>
          {paragraph.list
          ->List.mapWithIndex((row, index) =>
            <Mui.ListItem key={`list-row-${index->Int.toString}`}>
              {switch row.content {
              | Fragments(fragments) =>
                <ItemWrapper level=?row.level>
                  <ItemIcon number=?row.number level=?row.level />
                  <Mui.Grid container=true>
                    <Mui.Grid item=true xs=Number(12)>
                      <Common_Text_Fragment fragments />
                    </Mui.Grid>
                  </Mui.Grid>
                </ItemWrapper>
              | Message(message) =>
                <ItemWrapper level=?row.level>
                  <ItemIcon number=?row.number level=?row.level />
                  <Mui.ListItemText
                    primary={intl
                    ->ReactIntl.Intl.formatMessage(message)
                    ->React.string}
                    sx=?{row.bold->Option.getOr(false)
                      ? Some(
                          [("& .MuiListItemText-primary", Common_Style.bold)]
                          ->Dict.fromArray
                          ->Mui.Sx.dict,
                        )
                      : None}
                  />
                </ItemWrapper>
              | String(string) =>
                <ItemWrapper level=?row.level>
                  <ItemIcon number=?row.number level=?row.level />
                  <Mui.ListItemText
                    primary={string->React.string}
                    sx=?{row.bold->Option.getOr(false)
                      ? Some(
                          [("& .MuiListItemText-primary", Common_Style.bold)]
                          ->Dict.fromArray
                          ->Mui.Sx.dict,
                        )
                      : None}
                  />
                </ItemWrapper>
              }}
            </Mui.ListItem>
          )
          ->List.toArray
          ->React.array}
        </Mui.List>
      </Mui.Grid>
    </Mui.Grid>
  )
  ->List.toArray
  ->React.array
}
