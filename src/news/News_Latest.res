open News_Type
open Common.Constants

let latestNews: News_Type.t = {
  title: list{"Aktuální termíny registrací a přefocení do databáze:"},
  content: list{
    list{
      "pondělí 8. 9., úterý 23. 9. 2025 - objednejte se"->TextFragment.make(~emphasis=Bold),
    }->Line.make(~nextLineEmpty=true),
    list{"Ateliér: Františka Křížka 1, Praha 7, 2.patro"->TextFragment.make}->Line.make,
    list{
      "Je nutné se objednat:"->TextFragment.make(~space=Right),
      `${infoEmail}`->TextFragment.make(~hyperlink=`mailto:${infoEmail}`),
      `/ ${infoPhone}`->TextFragment.make(~space=Left),
    }->Line.make,
    list{
      "a) mimča 6 měs - 18 měs:"->TextFragment.make(~emphasis=Bold),
      "sloty mezi 9-13:30"->TextFragment.make(~space=Left),
    }->Line.make,
    list{
      "b) děti 4 - 15 let:"->TextFragment.make(~emphasis=Bold),
      "dejte nám vědět, že dorazíte, daný den lze přijít kdykoli mezi 14-18h"->TextFragment.make(
        ~space=Left,
      ),
    }->Line.make(~nextLineEmpty=true),
    list{"Zájem o novou registraci:"->TextFragment.make(~emphasis=Bold)}->Line.make,
    list{
      "Kontaktní formulář vyplňte"->TextFragment.make(~emphasis=Bold, ~space=Right),
      "zde"->TextFragment.make(~emphasis=Bold, ~hyperlink="https://1url.cz/@Poppy"),
      "a zašleme Vám podrobné informace."->TextFragment.make(~emphasis=Bold, ~space=Left),
    }->Line.make,
    list{
      "Registrujeme pouze osobně, děti ve věku: 6 měs - 18 měs a poté až od 4.narozenin do 15 let"->TextFragment.make(
        ~emphasis=Bold,
      ),
    }->Line.make,
    list{
      "Děti ve věku od 18 měs do 4.narozenin aktuálně neregistrujeme"->TextFragment.make(
        ~emphasis=Bold,
      ),
    }->Line.make,
    list{
      "kromě dětí neevropského vzhledu a jednovaječných dvojčat."->TextFragment.make,
    }->Line.make,
    list{
      "MIMO STANOVENÉ TERMÍNY nás v atelieru NEZASTIHNETE, online registrace neprovádíme"->TextFragment.make,
    }->Line.make,
    list{
      "a není možné se registrovat jindy než ve vypsané dny."->TextFragment.make,
    }->Line.make,
    list{
      "Dítě se v daném termínu dostaví OSOBNĚ se zákonným zástupcem"->TextFragment.make,
    }->Line.make,
    list{
      "Česky hovořící děti bez cizího přízvuku nebo rodilí mluvčí AJ."->TextFragment.make,
    }->Line.make,
  },
}
