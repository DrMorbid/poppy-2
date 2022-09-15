open News_Type

let latestNews: t = {
  date: Js.Date.fromString("2021-06-16"),
  content: list{
    Filled({
      emphasis: Large,
      value: "Registrace nových dětí a přefocení aktuálně neprobíhá.",
    }),
    Filled({
      emphasis: Large,
      value: "Nové termíny na podzim vypíšeme zde, můžete nám dát vědět, že máte zájem a informace Vám zašleme.",
    }),
    Filled({
      emphasis: Bold,
      value: "info@poppycasting.cz / 730 826 158 - volejte ve všední dny mezi 9-18h",
    }),
    Empty,
    Filled({
      emphasis: Bold,
      value: "Zájem o novou registraci:",
    }),
    Filled({
      emphasis: Bold,
      value: "Kontaktujte nás a uveďte prosím vždy: věk dítěte, město bydliště, Váš mail a telefonní číslo.",
    }),
    Filled({
      emphasis: Bold,
      value: "Registrujeme pouze osobně.",
    }),
    Filled({
      emphasis: Bold,
      value: "Registrujeme děti ve věku: 6 měs - 18 měs a poté až od 4.narozenin do 15 let",
    }),
    Filled({
      emphasis: Bold,
      value: "Děti ve věku od 18 měs do 4.narozenin aktuálně neregistrujeme",
    }),
    Filled({
      emphasis: Normal,
      value: "kromě dětí neevropského vzhledu a jednovaječných dvojčat.",
    }),
    Filled({
      emphasis: Normal,
      value: "MIMO STANOVENÉ TERMÍNY nás v atelieru NEZASTIHNETE, online registrace neprovádíme",
    }),
    Filled({
      emphasis: Normal,
      value: "a není možné se registrovat jindy než ve vypsané dny.",
    }),
    Filled({
      emphasis: Normal,
      value: "Dítě se v daném termínu dostaví OSOBNĚ se zákonným zástupcem",
    }),
    Filled({
      emphasis: Normal,
      value: "Česky hovořící děti bez cizího přízvuku nebo rodilí mluvčí AJ.",
    }),
  },
}
