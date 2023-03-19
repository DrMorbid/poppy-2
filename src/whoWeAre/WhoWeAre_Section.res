open Message
open Message.WhoWeAre
open Common.Constants
open Mui
open Mui.Grid

module Person = WhoWeAre_Person

let getContact = (email): Common.Text.fragmentParagraph => {
  content: list{
    Text({
      content: Message(contact),
    }),
    Text({
      content: String(":"),
      appendSpace: true,
    }),
    Text({
      content: String(email),
    }),
  },
}

@react.component
let make = () => {
  let commonClasses = Common.Style.useStyles(.)

  <Common.Text
    header
    body={Element(
      <Grid container=true className={commonClasses["sectionGap"]}>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Person
            photoSrc="/martina-popperova.jpg"
            name=companyOwner
            description=list{
              companyOwnerDescription1,
              companyOwnerDescription2,
              companyOwnerDescription3,
            }
            email=bossEmail
          />
        </Grid>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Person
            photoSrc="/hanka-kittnarova.jpg"
            name=registrationDatabasePerson
            description=list{
              registrationDatabasePersonDescription1,
              registrationDatabasePersonDescription2,
            }
            email=registrationDatabasePersonEmail
          />
        </Grid>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Common.Text
            body={Fragments(list{
              {
                content: list{
                  Text({
                    content: Message(photographer),
                    bold: true,
                  }),
                },
                centered: true,
              },
              {
                content: list{
                  Element(
                    <Link href=photographerWebsite key="element-fragment-1">
                      {photographerWebsite->React.string}
                    </Link>,
                  ),
                },
              },
              {
                content: list{
                  Text({
                    content: Message(photographer1),
                  }),
                },
              },
            })}
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
