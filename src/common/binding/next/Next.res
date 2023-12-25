module Navigation = {
  type router

  module Router = {
    type t

    @send external push: (t, string) => unit = "push"
  }

  @module("next/navigation") external useRouter: unit => Router.t = "useRouter"
  @module("next/navigation") external usePathname: unit => string = "usePathname"
}
