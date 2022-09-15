open Promise
open Utils.Idb
open IdbKeyVal
open ReDate
open Js.Date

let newsReadKey = "news-read"

let setNewsRead = date => store->setString(~key=newsReadKey, ~value=date->toISOString)->ignore

let isNewsRead = date => {
  open Belt.Option

  store
  ->getString(~key=newsReadKey)
  ->thenResolve(lastDate => lastDate->map(fromString)->map(isEqual(date))->getWithDefault(false))
}
