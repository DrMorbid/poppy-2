type t = Home | Registrations | Contact | QAndA | References | EmailUs | PhotosRetake

module RoutePath = {
  let home = "/"
  let registrations = "/registrations"
  let contact = "/contact"
  let qAndA = "/qAndA"
  let references = "/references"
  let emailUs = "/emailUs"
  let photosRetake = "/photosRetake"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  | QAndA => qAndA
  | References => references
  | EmailUs => emailUs
  | PhotosRetake => photosRetake
  }
}

let toLabel = page => {
  open Message.Menu

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  | QAndA => qAndA
  | References => references
  | EmailUs => emailUs
  | PhotosRetake => photosRetake
  }
}

let goTo = (router, page) => router->Next.Navigation.Router.push(page->toRoutePath)

let isHomePage = pathname => pathname->String.equal(RoutePath.home)

let isRegistrationsPage = pathname => pathname->String.equal(RoutePath.registrations)

let isPhotosRetakePage = pathname => pathname->String.equal(RoutePath.photosRetake)
