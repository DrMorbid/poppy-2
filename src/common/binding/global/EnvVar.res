@val
external nodeEnv: option<[#development | #production]> = "process.env.NODE_ENV"

module Email = {
  @val
  external apiKey: option<string> = "process.env.NEXT_PUBLIC_EMAIL_API_KEY"
  @val
  external recipient: option<string> = "process.env.NEXT_PUBLIC_EMAIL_RECIPIENT"
}
