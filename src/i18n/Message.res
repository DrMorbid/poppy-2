open ReactIntl

@@intl.messages

let appName =
  @intl.description("The name of the application")
  {id: "1c7ff9c8-a7f2-40bf-a645-f7ac48cdfbd9", defaultMessage: "Poppy Casting"}

module Menu = {
  @@intl.messages

  let aboutUs =
    @intl.description("Top menu item - About us")
    {id: "0371f3b2-5b62-4c6b-baac-a3925b811458", defaultMessage: "O nás"}
  let registrations =
    @intl.description("Top menu item - Registrations")
    {id: "b54fd38e-5cab-4dc6-9db0-c3f2bc180395", defaultMessage: "Registrace"}
  let references =
    @intl.description("Top menu item - References")
    {id: "6bf7df3e-31ef-4204-863a-9cf963d73779", defaultMessage: "Reference"}
  let contact =
    @intl.description("Top menu item - Contact")
    {id: "73b571e6-4145-4efb-a2ae-6fd9f4933981", defaultMessage: "Kontakt"}
  let news =
    @intl.description("Top menu item - News")
    {id: "ead3a1d1-bc04-41b2-bd64-bca14c7583e4", defaultMessage: "Aktuální info"}
}

module AboutUs = {
  @@intl.messages

  let header =
    @intl.description("About Us page - the header")
    {
      id: "cb394fa9-9b9e-4b10-8d3e-7c78a1e75dc7",
      defaultMessage: "Casting dětí - POPPY CASTING - castingová agentura",
    }
  let paragraph1 =
    @intl.description("About Us page - the first paragraph")
    {
      id: "9c048db6-f90d-48da-a31e-06187c783a60",
      defaultMessage: "Agenturu Poppy Casting založila herečka, produkční a dabingová režisérka Martina Popperová, která se od roku 2003 herecky podílela například na těchto projektech: Sametoví vrazi, Strážce duší, Ulice, To horké léto v Marienbadu, Žil jsem s cizinkou, Láska v Praze, Trapasy, Hop nebo Trop, Nepolepšitelný, Vyprávěj, Zdivočelá země, Seznam.cz...a další. Hrála v několika divadlech, jak v České republice tak i na Slovensku. Realizovala nahrávání mnoha mluvených TV a rádio spotů, jak herecky tak i režijně a produkčně.",
    }
  let paragraph2 =
    @intl.description("About Us page - the second paragraph")
    {
      id: "91953b1a-c603-4b24-b821-ad620b073b48",
      defaultMessage: "Od roku 2005 pracovala ve společnosti Baby Casting jako hlavní produkční a castingová manažerka, kde se věnovala práci s dětmi a získala bohaté zkušenosti v daném oboru.",
    }
  let paragraph3 =
    @intl.description("About Us page - the third paragraph")
    {
      id: "6f71e6a6-a34a-4a73-9806-bac49a58092b",
      defaultMessage: "Agentura Poppy casting je určena dětem od 6 měsíců do 15 let. Spolupracujeme s mnohými agenturami, produkcemi, televizemi a dabingovými studii při obsazování dětských rolí do filmů, seriálů, točených i focených reklam a dabingových spotů. Naším cílem je objevit talentované a zajímavé děti a poskytnout jim příležitost uplatnit se ve filmovém či reklamním prostředí.",
    }
  let paragraph4 =
    @intl.description("About Us page - the fourth paragraph")
    {
      id: "08d300a0-aa59-4a78-8de1-00dd40ae6ce7",
      defaultMessage: "Součástí této práce je také vzdělávání dětí formou herecké přípravy, naučit je jak se chovat před kamerou tak, aby je to bavilo a cítily se přirozeně. Každoročně pořádáme Letní filmový tábor Filmák, nebo různé dabingové a herecké workshopy. O všech možnostech herecké přípravy budeme informovat na těchto stránkách.",
    }
}

module Registrations = {
  @@intl.messages

  let header =
    @intl.description("Registrations page - the header")
    {
      id: "952d7587-71ba-4883-9516-086adfd2360b",
      defaultMessage: "Registrace",
    }
  let nextRegistrations =
    @intl.description(
      "Registrations page - the button that shows info about the next registrations"
    )
    {
      id: "f3a4a4f8-c01a-4e62-bff1-d669fc364f6e",
      defaultMessage: "Příští Registrace",
    }
  let paragraph1 =
    @intl.description("Registrations page - the first paragraph")
    {
      id: "9ba60cdb-647c-47b4-b48f-7eb19dd99190",
      defaultMessage: "Termíny registrací jsou pravidelně aktualizovány v běžícím červeném boxu pod menu stránky. Když se objeví termín registrace, můžete v daný den a čas přijít vaše dítě zaregistrovat, pokud je starší 4 let. Pokud je mladší než 4 roky, objednejte se na registraci telefonicky a domluvte si konkrétní hodinu. Obvykle probíhá v ten samý den před registrací starších dětí. Pokud vám daný termín nevyhovuje, počkejte, další termín se včas objeví. Registrace probíhají většinou 2-3x měsíčně.",
    }
  let paragraph2 =
    @intl.description("Registrations page - the second paragraph")
    {
      id: "c5cde1ec-d9e0-4c79-b672-f03f79eb34b8",
      defaultMessage: "U registrace dětí od 4 do 15 let se platí jednorázový registrační poplatek ve výši 1 500 Kč. Část poplatku se hradí na místě u registrace, zbytek až z prvního honoráře, tzn. 500 Kč se platí hned u registrace, 1000 kč se odečte až z prvního honoráře. Pokud se nám nepodaří uplatnit vaše dítě v některém z našich projektů, bude vás to stát jenom 500 Kč. Reg. poplatek kryje náklady související s registrací, pořízením fotografií, zařazením do databáze a následnou pravidelnou aktualizací fotek formou opětovného focení, až dítě vyroste nebo změní vzhled (délku nebo barvu vlasů…)",
    }
  let paragraph3 =
    @intl.description("Registrations page - the third paragraph")
    {
      id: "0ae2b88c-ca8a-4741-9851-20dcf18796b6",
      defaultMessage: "U registrací dětí od 6 měsíců do 4 let si registrační poplatek ve výši 1500,- Kč účtujeme přímo u registrace. Důvodem je komplikovanější a časově náročnější práce s malým dítětem, proto vyžadujeme objednání předem, abychom měli na vaše dítě dostatek času a vy nemuseli čekat. Tento poplatek je jednorázový a i když budeme vaše dítě fotit častěji než je to běžné u starších dětí, jak jistě sami víte, děti se v tomto věku mění velice rychle, žádný další registrační poplatek vám už účtován nebude. Jako bonus dostanete od nás pořízené záběry na památku. Fotky posíláme ve zmenšeném formátu mailem.",
    }
  let paragraph4 =
    @intl.description("Registrations page - the fourth paragraph")
    {
      id: "5bea953c-5bd7-4af7-942b-46c390062287",
      defaultMessage: "Na registraci nepotřebujete nic, doporučujeme tričko bez výrazných nápisů, v létě se vyhýbejte šatům na ramínka, dobré je mít alespoň krátký rukáv, ať dítě nevypadá „polonaze“. Vyplníte registrační dotazník, my si dítě nafotíme, tudíž není potřeba nosit sebou vlastní fotografie.",
    }
}

module References = {
  @@intl.messages

  let header =
    @intl.description("References page - the header")
    {
      id: "0e472007-df8d-4a91-a94f-eff8c767d5d0",
      defaultMessage: "Reference",
    }
  let paragraph1 =
    @intl.description("References page - the first paragraph")
    {
      id: "765fae82-7614-4248-a37a-970de2afd959",
      defaultMessage: "Agentura Poppy casting prioritně spolupracuje s castingovou agenturou Echo casting při obsazování dětských rolí do retro seriálu 1. Republika.",
    }
  let section2Header =
    @intl.description("References page - the header for the second section")
    {
      id: "37bf2554-1fdb-453b-87bf-b622bf23026b",
      defaultMessage: "Martina Popperová jako produkční a casting manažerka se podílela na dětském obsazení například těchto projektů:",
    }
  let tvAndFilmHeader =
    @intl.description("References page - the header for the TV + film list")
    {
      id: "8368e4a2-3264-4990-9112-5a03bf312a80",
      defaultMessage: "TV + film",
    }
  let tvAndFilmList =
    @intl.description("References page - the TV + film list")
    {
      id: "e44f49fa-5ea5-43af-8f10-833614cb0c79",
      defaultMessage: "Vyprávěj, Ulice, Soukromé pasti, Hop nebo trop, Kdopak by se vlka bál, Návraty domů, Cold feet, Ženy v pokušení, Roseanne, Černá sanitka, V peřině, Ententyky, 1.Republika, Crossing Lines, 3 Mušketýři, Borgia, Krásno, Něžné vlny, Sturmfrei, 10 pravidel…",
    }
  let adsHeader =
    @intl.description("References page - the header for the Ads list")
    {
      id: "5cff0bd8-c4bc-4548-b70e-032c74af205c",
      defaultMessage: "Reklama",
    }
  let adsList =
    @intl.description("References page - the Ads list")
    {
      id: "f990488b-d0bc-4e99-96c6-c22a409b5c86",
      defaultMessage: "Albert, Nesquick, KB banka, Tatra banka, Unicredit Bank, Raiffeisen Bank, Aukro, Hami, Kenvelo, Figaro, Pillsbury, Evian, Jeux Olympiques, Dash, Ariel, B&Q, Head and Shoulders, Champomy, Tesco, Škoda, Nestlé, K Mart, Hello Kitty, Figaro, Český rozhlas, Reddi Wip, Microsoft, Nintendo, Orion, Little Woods, Macy's, Brumík, T-mobile, Hewlet Packard, Xbox, Exxon, Huggies, Pribina, Opavia, Dash, McDonalds, Tatranky, Diesel, Vodafone, Tesco Mobile, Degree, AF Gruppen, Apetito, Garnier, Coop, Česká spořitelna, ČEZ, Drylock, Era, Falck, Flinstones, Kia, Malajské aerolinky, Marťánci, Monoprix, Muller, Prospan, Protex, Sunar, Tobetoo, Topgal, Scotch, R+V, Arktika, Frigidaire, Ikea, Kleenex, Lego, Listerine, Lysol, Mixle Pixle, Mapy.cz, Panadol, Tantum Verde, Teta, Unicef, Wustenrot, upoutávky FTV Pima a NOVA … a dabingové reklamní spoty.",
    }
}

module Contact = {
  @@intl.messages

  let header =
    @intl.description("Contact page - the header")
    {
      id: "5f6482c3-2285-43e2-ab32-1cd9c3a387dd",
      defaultMessage: "Kontakt",
    }
  let openingTimes =
    @intl.description("Contact page - the opening times")
    {
      id: "6ca7da80-4f64-4787-a6b8-29737d98fecc",
      defaultMessage: "Pracovní doba pro vaše dotazy v pracovní dny 9.00 - 18.00.",
    }
  let companyName =
    @intl.description("Contact page - the company name")
    {
      id: "5ecee400-bdeb-4d52-a101-25fe293e61e1",
      defaultMessage: "Poppy casting, s.r.o.",
    }
  let companyOwner =
    @intl.description("Contact page - the company owner")
    {
      id: "588ddae1-8b2e-4141-b776-4cd9dfbc4447",
      defaultMessage: "Mgr.art. Martina Popperová",
    }
  let companyEmail =
    @intl.description("Contact page - the company email")
    {
      id: "05876c12-2be7-44d9-b6b0-afc7b8d87595",
      defaultMessage: "e-mail:",
    }
  let infoContactHeader =
    @intl.description("Contact page - the info contact header")
    {
      id: "ef604b18-1b95-45e8-9e9f-730c20f03f9b",
      defaultMessage: "Objednávky, informace a dotazy k registracím na:",
    }
  let infoContactPhone =
    @intl.description("Contact page - the info contact phone")
    {
      id: "706db97d-376a-4bb7-b45c-b9f563cbd7cc",
      defaultMessage: "tel.čísle:",
    }
  let infoContactEmail =
    @intl.description("Contact page - the info contact email")
    {
      id: "4e09e2cc-319f-467c-a4c4-76bac3c87815",
      defaultMessage: "nebo e-mailem:",
    }
  let registrationAddressHeader =
    @intl.description("Contact page - the registration address header")
    {
      id: "cee207c1-c522-410c-8199-3625b0b5a84f",
      defaultMessage: "Registrace probíhá v ateliéru na adrese:",
    }
  let registrationAddress =
    @intl.description("Contact page - the registration address")
    {
      id: "46d77863-5004-4936-b476-88356481eef9",
      defaultMessage: "Františka Křížka 362/1, Praha 7, 2. patro",
    }
  let registrationAddressConnection =
    @intl.description("Contact page - the registration address connection")
    {
      id: "34f4a860-cc7d-4e81-af81-c2e81e4b7849",
      defaultMessage: "MHD tram 1,8,12,25,26 Kamenická nebo 6,8,17,26 Strossmayerovo náměstí",
    }
  let registrationAddressParkingLabel =
    @intl.description("Contact page - the registration address parking label")
    {
      id: "ed313c03-79ff-4dd2-8912-00855ab0cd73",
      defaultMessage: "Parkování:",
    }
  let registrationAddressParking =
    @intl.description("Contact page - the registration address parking")
    {
      id: "93df4d63-d1ac-4861-8be5-2029c23fbfaf",
      defaultMessage: "Praha 7 Letná má modré parkovací zóny, kde bez karty pro P7 nesmíte stát autem, placená stání:",
    }
  let registrationAddressPaidParking1 =
    @intl.description("Contact page - the registration address paid parking 1")
    {
      id: "766a0ab3-5083-4fb1-87ac-87165933df44",
      defaultMessage: "ul. Kostelní nebo pod Technickým muzeem 40Kč/h",
    }
  let registrationAddressPaidParking2 =
    @intl.description("Contact page - the registration address paid parking 2")
    {
      id: "5efc3bbe-887a-4fbf-8a22-654d0a07a2c9",
      defaultMessage: "ul. Milady Horákové 40Kč/h",
    }
  let facturationAddressLabel =
    @intl.description("Contact page - the facturation address plabel")
    {
      id: "bb731b22-3892-4e85-a51e-7ad558f7e5bd",
      defaultMessage: "korespondenční a fakturační adresa:",
    }
  let facturationAddress =
    @intl.description("Contact page - the facturation address")
    {
      id: "8c3c6989-a6fa-4111-886f-81389325486a",
      defaultMessage: "Paťanka 5, 160 00 Praha 6",
    }
  let idNumber =
    @intl.description("Contact page - the ID number")
    {
      id: "72a13e6a-5639-4ca0-9aa9-2e7d8e298ccc",
      defaultMessage: "IČO: 047 40 165",
    }
}
