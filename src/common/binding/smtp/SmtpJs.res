type t
type sendRequest = {"To": string, "From": string, "Subject": string, "Body": string}
type sendRequestWithSecureToken = {"SecureToken": string, ...sendRequest}
type sendRequestWithCredentials = {
  "Host": string,
  "Username": string,
  "Password": string,
  ...sendRequest,
}

@module external email: t = "./smtp"

@send external sendWithSecureToken: (t, sendRequestWithSecureToken) => promise<string> = "send"
@send external sendWithCredentials: (t, sendRequestWithCredentials) => promise<string> = "send"
