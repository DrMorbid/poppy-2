open Message
open Message.WhoWeAre
open Common.Constants
open Common.Text

module Person = WhoWeAre_Person

@react.component
let make = () => {
  <Common.Text
    header
    body={Element(
      <Mui.Grid container=true sx=Common.Style.sectionGap>
        <Mui.Grid item=true xs=Number(12) xl=Number(6)>
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
        </Mui.Grid>
        <Mui.Grid item=true xs=Number(12) xl=Number(6)>
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
        </Mui.Grid>
        <Mui.Grid item=true xs=Number(12) xl=Number(6)>
          <Person
            photoSrc="/team/eva-kolinova.jpg"
            name=photographer
            description=list{
              Element(
                <Mui.Link href=photographerWebsite key="element-fragment-1">
                  {photographerWebsite->React.string}
                </Mui.Link>,
              ),
              Text({
                content: Message(photographer1),
              }),
            }
          />
        </Mui.Grid>
        <Mui.Grid item=true xs=Number(12) xl=Number(6)>
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
        </Mui.Grid>
      </Mui.Grid>,
    )}
  />
}
