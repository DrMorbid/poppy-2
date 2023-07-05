open Message
open Message.WhoWeAre
open Common.Constants
open Mui
open Mui.Grid
open Common.Text

module Person = WhoWeAre_Person

@react.component
let make = () => {
  <Common.Text
    header
    body={Element(
      <Grid container=true className=Common.Style.sectionGap>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Person
            photoSrc="/team/martina-popperova.jpg"
            name=companyOwner
            description=list{
              Text({
                content: Message(companyOwnerDescription1),
              }),
              Text({
                content: Message(companyOwnerDescription2),
              }),
              Text({
                content: Message(companyOwnerDescription3),
              }),
            }
            email=bossEmail
          />
        </Grid>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Person
            photoSrc="/team/hanka-kittnarova.jpg"
            name=registrationDatabasePerson
            description=list{
              Text({
                content: Message(registrationDatabasePersonDescription1),
              }),
              Text({
                content: Message(registrationDatabasePersonDescription2),
              }),
            }
            email=registrationDatabasePersonEmail
          />
        </Grid>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Person
            photoSrc="/team/eva-kolinova.jpg"
            name=photographer
            description=list{
              Element(
                <Link href=photographerWebsite key="element-fragment-1">
                  {photographerWebsite->React.string}
                </Link>,
              ),
              Text({
                content: Message(photographer1),
              }),
            }
          />
        </Grid>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Common.Text
            body={Fragments(list{
              {
                content: list{
                  Text({
                    content: Message(assistants),
                    bold: true,
                  }),
                },
                centered: true,
              },
            })}
          />
        </Grid>
      </Grid>,
    )}
  />
}
