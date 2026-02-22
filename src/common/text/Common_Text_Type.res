type paragraphContent = Message(ReactIntl.message) | String(string)

type paragraph = {content: paragraphContent, bold?: bool}

type fragmentContent =
  Message(ReactIntl.message) | String(string) | Link({content: string, href: string})

type fragment =
  | Text({
      content: fragmentContent,
      bold?: bool,
      italic?: bool,
      color?: [#error],
      appendSpace?: bool,
    })
  | Element(Jsx.element)

type fragmentParagraph = {content: list<fragment>, centered?: bool}

type listRowContent = Fragments(list<fragment>) | Message(ReactIntl.message)

type listRow = {content: listRowContent, bold?: bool, level?: int, number?: int}

type listParagraph = {
  title?: ReactIntl.message,
  list: list<listRow>,
}

type body =
  | Paragraphs(list<paragraph>)
  | Fragments(list<fragmentParagraph>)
  | Lists(list<listParagraph>)
  | Element(Jsx.element)
