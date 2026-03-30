@react.component
let make = () => {
  <main>
    <Mui.Container maxWidth=Xl sx=Common.Style.appContainer>
      <Mui.Grid
        container=true direction=Column sx={Common.Style.paragraphGap->Utils.Style.styleToSx}
      >
        <Mui.Grid item=true>
          <Mui.Stack spacing={Number(2.)}>
            <Mui.Skeleton variant={Rectangular} height={String("10vh")} />
            <Mui.Skeleton variant={Rectangular} height={String("30vh")} />
            <Mui.Skeleton variant={Rectangular} height={String("20vh")} />
            <Mui.Skeleton variant={Rectangular} height={String("10vh")} />
            <Mui.Skeleton variant={Rectangular} height={String("30vh")} />
          </Mui.Stack>
        </Mui.Grid>
      </Mui.Grid>
    </Mui.Container>
  </main>
}
