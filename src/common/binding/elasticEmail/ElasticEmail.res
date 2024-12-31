type apiClientInstance
type apiKeyAuthentication
type authentications = {"apikey": apiKeyAuthentication}
type emailApi

module EmailData = {
  type recipient = {@as("Email") email: string, @as("Fields") fields?: Dict.t<string>}
  type contentType = [#HTML | #PlainText | #AMP | #CSS]
  type charset = [#"utf-8"]
  type bodyItem = {
    @as("ContentType") contentType: contentType,
    @as("Charset") charset?: charset,
    @as("Content") content?: string,
  }
  type content = {
    @as("From") from: string,
    @as("Subject") subject?: string,
    @as("Body") body?: array<bodyItem>,
  }
  type t = {@as("Recipients") recipients: array<recipient>, @as("Content") content: content}
}

module Error = {
  type body = {@as("Error") error: string}
  type response = {body: body}
  type t = {response: response, status: int}
}

type data = {
  @as("MessageID") messageID: string,
  @as("TransactionID") transactionID: string,
}

@module("@elasticemail/elasticemail-client") @scope("ApiClient")
external instance: apiClientInstance = "instance"

@get external authentications: apiClientInstance => authentications = "authentications"

@set external apiKey: (apiKeyAuthentication, string) => unit = "apiKey"

@module("@elasticemail/elasticemail-client") @new
external makeEmailsApi: unit => emailApi = "EmailsApi"

@send
external emailsPost: (
  emailApi,
  EmailData.t,
  ~callback: (~error: Nullable.t<Error.t>, ~data: Nullable.t<data>) => unit,
) => unit = "emailsPost"
