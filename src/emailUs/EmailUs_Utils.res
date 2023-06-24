open Webapi.Fetch

let fetchEmailBody = async (
  ~note=?,
  ~parentName,
  ~childName,
  ~childBirthdate,
  ~cityOfResidence,
  ~parentPhone,
  ~parentEmail,
) => {
  let response = await "./email-body.html"->fetchWithInit(
    RequestInit.make(
      ~headers=HeadersInit.make({
        "Content-Type": "text/html",
        "Accept": "text/html",
      }),
      (),
    ),
  )

  let emailBody = await response->Response.text

  emailBody
  ->String.replaceRegExp(%re("/\${parentName}/"), parentName)
  ->String.replaceRegExp(%re("/\${childName}/"), childName)
  ->String.replaceRegExp(
    %re("/\${childBirthdate}/"),
    childBirthdate->Date.toLocaleDateStringWithLocaleAndOptions("cs-CZ", {dateStyle: #medium}),
  )
  ->String.replaceRegExp(%re("/\${cityOfResidence}/"), cityOfResidence)
  ->String.replaceRegExp(%re("/\${parentPhone}/"), parentPhone)
  ->String.replaceRegExp(%re("/\${parentEmail}/"), parentEmail)
  ->String.replaceRegExp(%re("/\${note}/"), note->Option.getWithDefault(""))
}
