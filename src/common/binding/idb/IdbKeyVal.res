type t

@module("idb-keyval")
external createStore: (~dbName: string, ~storeName: string) => t = "createStore"

@module("idb-keyval")
external setString: (~key: string, ~value: string, t) => Js.Promise.t<unit> = "set"

@module("idb-keyval")
external setInt: (~key: string, ~value: int, t) => Js.Promise.t<unit> = "set"

@module("idb-keyval")
external setJson: (~key: string, ~value: Js.Json.t, t) => Js.Promise.t<unit> = "set"

@module("idb-keyval")
external setFloat: (~key: string, ~value: float, t) => Js.Promise.t<unit> = "set"

@module("idb-keyval")
external setBool: (~key: string, ~value: bool, t) => Js.Promise.t<unit> = "set"

@module("idb-keyval")
external getString: (~key: string, t) => Js.Promise.t<option<string>> = "get"

@module("idb-keyval")
external getInt: (~key: string, t) => Js.Promise.t<option<int>> = "get"

@module("idb-keyval")
external getJson: (~key: string, t) => Js.Promise.t<option<Js.Json.t>> = "get"

@module("idb-keyval")
external getFloat: (~key: string, t) => Js.Promise.t<option<float>> = "get"

@module("idb-keyval")
external getBool: (~key: string, t) => Js.Promise.t<option<bool>> = "get"

@module("idb-keyval")
external setManyStrings: (array<(string, string)>, t) => Js.Promise.t<unit> = "setMany"

@module("idb-keyval")
external setManyInts: (array<(string, int)>, t) => Js.Promise.t<unit> = "setMany"

@module("idb-keyval")
external setManyJsons: (array<(string, Js.Json.t)>, t) => Js.Promise.t<unit> = "setMany"

@module("idb-keyval")
external setManyFloats: (array<(string, float)>, t) => Js.Promise.t<unit> = "setMany"

@module("idb-keyval")
external setManyBools: (array<(string, bool)>, t) => Js.Promise.t<unit> = "setMany"

@module("idb-keyval")
external getManyStrings: (array<string>, t) => Js.Promise.t<array<option<string>>> = "getMany"

@module("idb-keyval")
external getManyInts: (array<string>, t) => Js.Promise.t<array<option<int>>> = "getMany"

@module("idb-keyval")
external getManyJsons: (array<string>, t) => Js.Promise.t<array<option<Js.Json.t>>> = "getMany"

@module("idb-keyval")
external getManyFloats: (array<string>, t) => Js.Promise.t<array<option<float>>> = "getMany"

@module("idb-keyval")
external getManyBools: (array<string>, t) => Js.Promise.t<array<option<bool>>> = "getMany"

@module("idb-keyval")
external updateString: (~key: string, ~updater: option<string> => string, t) => Js.Promise.t<unit> =
  "update"

@module("idb-keyval")
external updateInt: (~key: string, ~updater: option<int> => int, t) => Js.Promise.t<unit> = "update"

@module("idb-keyval")
external updateJson: (
  ~key: string,
  ~updater: option<Js.Json.t> => Js.Json.t,
  t,
) => Js.Promise.t<unit> = "update"

@module("idb-keyval")
external updateFloat: (~key: string, ~updater: option<float> => float, t) => Js.Promise.t<unit> =
  "update"

@module("idb-keyval")
external updateBool: (~key: string, ~updater: option<bool> => bool, t) => Js.Promise.t<unit> =
  "update"

@module("idb-keyval")
external del: (~key: string, t) => Js.Promise.t<unit> = "del"

@module("idb-keyval")
external delMany: (array<string>, t) => Js.Promise.t<unit> = "delMany"

@module("idb-keyval") external clear: t => Js.Promise.t<unit> = "clear"

@module("idb-keyval")
external entries: t => Js.Promise.t<array<(string, Js.Json.t)>> = "entries"

@module("idb-keyval")
external keys: t => Js.Promise.t<array<string>> = "keys"

@module("idb-keyval")
external values: t => Js.Promise.t<array<Js.Json.t>> = "values"
