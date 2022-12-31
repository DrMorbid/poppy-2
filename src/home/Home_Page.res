module CarouselItem = Home_CarouselItem

@react.component
let make = () => {
  <ReactMaterialUiCarousel autoPlay=false indicators=false animation=#slide>
    {[
      <CarouselItem image="/kids/pexels-bess-hamiti-35188.jpg" />,
      <CarouselItem image="/kids/pexels-lukas-296301.jpg" />,
      <CarouselItem image="/kids/pexels-samer-daboul-1212805.jpg" />,
      <CarouselItem image="/kids/pexels-samer-daboul-1815257.jpg" />,
    ]}
  </ReactMaterialUiCarousel>
}
