open Mui

type t = LatestNews | AboutUs | References | Contact

let toLabel = page => {
  open Message.Menu

  switch page {
  | LatestNews => news
  | AboutUs => aboutUs
  | References => references
  | Contact => contact
  }
}

@react.component
let make = (~anchor as id, ~children) => {
  <>
    <Grid item=true id>
      <hr />
    </Grid>
    <Grid item=true> children </Grid>
  </>
}
