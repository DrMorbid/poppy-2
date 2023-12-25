@val
external nodeEnv: option<[#development | #production]> = "process.env.NODE_ENV"

module SmtpJs = {
  @val
  external secureToken: option<string> = "process.env.NEXT_PUBLIC_SMTPJS_SECURE_TOKEN"
  @val
  external from: option<string> = "process.env.NEXT_PUBLIC_SMTPJS_FROM"
  @val
  external to: option<string> = "process.env.NEXT_PUBLIC_SMTPJS_TO"
}
