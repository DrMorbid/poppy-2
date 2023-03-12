open Message.Registrations
open Mui

@react.component
let make = () => {
  let (dialogOpened, setDialogOpened) = React.useState(() => false)
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))

  let onOpen = () => setDialogOpened(_ => true)

  let onClose = () => setDialogOpened(_ => false)

  <>
    <Common.Dialog isOpen=dialogOpened onClose>
      <News.Message />
    </Common.Dialog>
    <Common.Text
      header=?{isSmUp ? Some(header) : None}
      afterHeader={<Common.OpenInNewButton label=nextRegistrations onClick=onOpen />}
      body=Paragraphs(list{paragraph1, paragraph2, paragraph3, paragraph4})
    />
  </>
}
