@val
external mode: option<[#development | #production]> = "import.meta.env.MODE"
module SmtpJs = {
  @val
  external secureToken: option<string> = "import.meta.env.VITE_SMTPJS_SECURE_TOKEN"
  @val
  external from: option<string> = "import.meta.env.VITE_SMTPJS_FROM"
  @val
  external to: option<string> = "import.meta.env.VITE_SMTPJS_TO"
}
