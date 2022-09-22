open News_Type

let latestNews: t = {
  date: Js.Date.fromString("2022-09-25"),
  title: list{
    "Registrace nových dětí a přefocení aktuálně neprobíhá.",
    "Nové termíny na podzim vypíšeme zde, můžete nám dát vědět, že máte zájem a informace Vám zašleme.",
  },
  content: list{
    "info@poppycasting.cz / 730 826 158 - volejte ve všední dny mezi 9-18h"->makeLine(
      ~emphasis=Bold,
      ~nextLineEmpty=true,
    ),
    "Zájem o novou registraci:"->makeLine(~emphasis=Bold),
    "Kontaktujte nás a uveďte prosím vždy: věk dítěte, město bydliště, Váš mail a telefonní číslo."->makeLine(
      ~emphasis=Bold,
    ),
    "Registrujeme pouze osobně."->makeLine(~emphasis=Bold),
    "Registrujeme děti ve věku: 6 měs - 18 měs a poté až od 4.narozenin do 15 let"->makeLine(
      ~emphasis=Bold,
    ),
    "Děti ve věku od 18 měs do 4.narozenin aktuálně neregistrujeme"->makeLine(~emphasis=Bold),
    "kromě dětí neevropského vzhledu a jednovaječných dvojčat."->makeLine,
    "MIMO STANOVENÉ TERMÍNY nás v atelieru NEZASTIHNETE, online registrace neprovádíme"->makeLine,
    "a není možné se registrovat jindy než ve vypsané dny."->makeLine,
    "Dítě se v daném termínu dostaví OSOBNĚ se zákonným zástupcem"->makeLine,
    "Česky hovořící děti bez cizího přízvuku nebo rodilí mluvčí AJ."->makeLine,
  },
}
