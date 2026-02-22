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
  ->String.replaceRegExp(/\${parentName}/g, parentName)
  ->String.replaceRegExp(/\${childName}/g, childName)
  ->String.replaceRegExp(
    /\${childBirthdate}/g,
    childBirthdate
    ->Option.map(
      Date.toLocaleDateStringWithLocaleAndOptions(
        _,
        Common.Constants.defaultLocale,
        {dateStyle: #medium},
      ),
    )
    ->Option.getOr(""),
  )
  ->String.replaceRegExp(/\${cityOfResidence}/g, cityOfResidence)
  ->String.replaceRegExp(/\${parentPhone}/g, parentPhone)
  ->String.replaceRegExp(/\${parentEmail}/g, parentEmail)
  ->String.replaceRegExp(/\${note}/g, note->Option.getOr(""))
}

let authenticate = apiKeyValue => {
  open ElasticEmail

  let elasticEmail = instance
  let apiKeyAuthentication = (elasticEmail->authentications)["apikey"]
  apiKeyAuthentication->apiKey(apiKeyValue)
}

let send = (~sender as from, ~recipient as email, ~subject, ~onSuccess, ~onError, content) => {
  open ElasticEmail

  let emailApi = makeEmailsApi()
  let emailData: EmailData.t = {
    recipients: [{email: email}],
    content: {from, subject, body: [{contentType: #HTML, charset: #"utf-8", content}]},
  }

  emailApi->emailsPost(emailData, ~callback=(~error, ~data as _) => {
    switch error->Nullable.toOption {
    | Some({response: {body: {error}}, status}) => onError(`${status->Int.toString}: ${error}`)
    | None => onSuccess()
    }
  })
}
