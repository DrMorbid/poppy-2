open Utils.Idb
open IdbKeyVal
open ReDate
open Js.Date

let newsReadKey = "news-read"

let setNewsRead = date => store->setString(~key=newsReadKey, ~value=date->toISOString)->ignore

let isLatestNewsRead = async () => {
  open Belt.Option

  let newDate = News_Latest.latestNews.date

  let lastDate = await store->getString(~key=newsReadKey)

  lastDate
  ->map(fromString)
  ->map(lastDate => lastDate->isAfter(newDate) || lastDate->isEqual(newDate))
  ->getWithDefault(false)
}
