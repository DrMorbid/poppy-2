open Mui
open ReactIntl
open Message.References

@react.component
let make = () => {
  let intl = useIntl()
  let classes = Common.Style.useStyles(.)
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))

  <Grid container=true>
    <Grid item=true>
      <Common.Text header=?{isSmUp ? Some(header) : None} paragraphs=list{paragraph1} />
    </Grid>
    <Grid item=true xs=Grid.Xs.\"12" className={classes["headerGap"]}>
      <Typography variant=#h5>
        {intl->Intl.formatMessage(section2Header)->React.string}
      </Typography>
    </Grid>
    <Grid item=true className={classes["headerGap"]}>
      <Grid container=true className={classes["paragraphGap"]}>
        <Grid item=true xs=Grid.Xs.\"12">
          <Typography variant=#h6>
            {intl->Intl.formatMessage(tvAndFilmHeader)->React.string}
          </Typography>
        </Grid>
        <Grid item=true xs=Grid.Xs.\"12">
          <Typography> {intl->Intl.formatMessage(tvAndFilmList)->React.string} </Typography>
        </Grid>
        <Grid item=true xs=Grid.Xs.\"12">
          <Typography variant=#h6> {intl->Intl.formatMessage(adsHeader)->React.string} </Typography>
        </Grid>
        <Grid item=true xs=Grid.Xs.\"12">
          <Typography> {intl->Intl.formatMessage(adsList)->React.string} </Typography>
        </Grid>
      </Grid>
    </Grid>
  </Grid>
}
