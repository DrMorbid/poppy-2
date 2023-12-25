open Webapi.Fetch

let fetchEmailBody = async (
  ~note=?,
  ~parentName,
  ~childName,
  ~childBirthdate=?,
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
  ->String.replaceRegExp(%re("/\${parentName}/g"), parentName)
  ->String.replaceRegExp(%re("/\${childName}/g"), childName)
  ->String.replaceRegExp(
    %re("/\${childBirthdate}/g"),
    childBirthdate
    ->Option.map(Date.toLocaleDateStringWithLocaleAndOptions(_, "cs-CZ", {dateStyle: #medium}))
    ->Option.getWithDefault(""),
  )
  ->String.replaceRegExp(%re("/\${cityOfResidence}/g"), cityOfResidence)
  ->String.replaceRegExp(%re("/\${parentPhone}/g"), parentPhone)
  ->String.replaceRegExp(%re("/\${parentEmail}/g"), parentEmail)
  ->String.replaceRegExp(%re("/\${note}/g"), note->Option.getWithDefault(""))
}
