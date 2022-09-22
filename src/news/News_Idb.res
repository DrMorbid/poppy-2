open Promise
open Utils.Idb
open IdbKeyVal
open ReDate
open Js.Date

let newsReadKey = "news-read"

let setNewsRead = date => store->setString(~key=newsReadKey, ~value=date->toISOString)->ignore

let isLatestNewsRead = () => {
  open Belt.Option

  let newDate = News_Latest.latestNews.date

  store
  ->getString(~key=newsReadKey)
  ->thenResolve(lastDate =>
    lastDate
    ->map(fromString)
    ->map(lastDate => lastDate->isAfter(newDate) || lastDate->isEqual(newDate))
    ->getWithDefault(false)
  )
}
