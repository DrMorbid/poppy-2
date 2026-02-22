open Message.PhotosRetake

@react.component
let default = () => {
  let currentPhotosRetakeDatesTopRef = React.useRef(null)

  <Common.Text
    header
    body=Element(
      <App_ScrollableSections
        sections={list{
          {
            element: <PhotosRetake_UpcomingDates />,
            topRef: currentPhotosRetakeDatesTopRef,
            accented: Yellow,
          },
        }}
        coloredSections=Odd
      />,
    )
  />
}
