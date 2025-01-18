open Message
open Message.WhoWeAre
open Common.Constants
open Common.Text

module Person = WhoWeAre_Person

@react.component
let make = () => {
  let intl = ReactIntl.useIntl()

  <Common.Text
    header
    body={Element(
      <Mui.Grid container=true sx=Common.Style.sectionGap>
        <Mui.Grid item=true xs=Number(12) xl=Number(12)>
          <Person
            photoSrc="/team/martina-popperova.jpg"
            name=String(
              intl->ReactIntl.Intl.formatMessageWithValues(
                companyOwner,
                {"name": companyOwnerName},
              ),
            )
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
            allwaysFullWidth=true
          />
        </Mui.Grid>
        <Mui.Grid item=true xs=Number(12) xl=Number(6)>
          <Person
            photoSrc="/team/hanka-kittnarova.jpg"
            name=String(Common.Constants.registrationDatabasePersonName)
            description=list{
              Text({
                content: Message(registrationDatabasePersonDescription1),
              }),
              Text({
                content: Message(registrationDatabasePersonDescription2),
              }),
            }
            email=registrationDatabasePersonEmail
            tel=infoPhone
          />
        </Mui.Grid>
        <Mui.Grid item=true xs=Number(12) xl=Number(6)>
          <Person
            photoSrc="/team/eva-kolinova.jpg"
            name=String(Common.Constants.photographerName)
            description=list{
              Text({
                content: Message(photographer1),
              }),
              Element(
                <Mui.Link href=photographerWebsite key="element-fragment-1">
                  {photographerWebsite->React.string}
                </Mui.Link>,
              ),
            }
          />
        </Mui.Grid>
      </Mui.Grid>,
    )}
  />
}
