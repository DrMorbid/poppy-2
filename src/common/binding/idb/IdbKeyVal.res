type t

@module("idb-keyval")
external createStore: (~dbName: string, ~storeName: string) => t = "createStore"

@module("idb-keyval")
external setString: (~key: string, ~value: string, t) => promise<unit> = "set"

@module("idb-keyval")
external setInt: (~key: string, ~value: int, t) => promise<unit> = "set"

@module("idb-keyval")
external setJson: (~key: string, ~value: Js.Json.t, t) => promise<unit> = "set"

@module("idb-keyval")
external setFloat: (~key: string, ~value: float, t) => promise<unit> = "set"

@module("idb-keyval")
external setBool: (~key: string, ~value: bool, t) => promise<unit> = "set"

@module("idb-keyval")
external getString: (~key: string, t) => promise<option<string>> = "get"

@module("idb-keyval")
external getInt: (~key: string, t) => promise<option<int>> = "get"

@module("idb-keyval")
external getJson: (~key: string, t) => promise<option<Js.Json.t>> = "get"

@module("idb-keyval")
external getFloat: (~key: string, t) => promise<option<float>> = "get"

@module("idb-keyval")
external getBool: (~key: string, t) => promise<option<bool>> = "get"

@module("idb-keyval")
external setManyStrings: (array<(string, string)>, t) => promise<unit> = "setMany"

@module("idb-keyval")
external setManyInts: (array<(string, int)>, t) => promise<unit> = "setMany"

@module("idb-keyval")
external setManyJsons: (array<(string, Js.Json.t)>, t) => promise<unit> = "setMany"

@module("idb-keyval")
external setManyFloats: (array<(string, float)>, t) => promise<unit> = "setMany"

@module("idb-keyval")
external setManyBools: (array<(string, bool)>, t) => promise<unit> = "setMany"

@module("idb-keyval")
external getManyStrings: (array<string>, t) => promise<array<option<string>>> = "getMany"

@module("idb-keyval")
external getManyInts: (array<string>, t) => promise<array<option<int>>> = "getMany"

@module("idb-keyval")
external getManyJsons: (array<string>, t) => promise<array<option<Js.Json.t>>> = "getMany"

@module("idb-keyval")
external getManyFloats: (array<string>, t) => promise<array<option<float>>> = "getMany"

@module("idb-keyval")
external getManyBools: (array<string>, t) => promise<array<option<bool>>> = "getMany"

@module("idb-keyval")
external updateString: (~key: string, ~updater: option<string> => string, t) => promise<unit> =
  "update"

@module("idb-keyval")
external updateInt: (~key: string, ~updater: option<int> => int, t) => promise<unit> = "update"

@module("idb-keyval")
external updateJson: (~key: string, ~updater: option<Js.Json.t> => Js.Json.t, t) => promise<unit> =
  "update"

@module("idb-keyval")
external updateFloat: (~key: string, ~updater: option<float> => float, t) => promise<unit> =
  "update"

@module("idb-keyval")
external updateBool: (~key: string, ~updater: option<bool> => bool, t) => promise<unit> = "update"

@module("idb-keyval")
external del: (~key: string, t) => promise<unit> = "del"

@module("idb-keyval")
external delMany: (array<string>, t) => promise<unit> = "delMany"

@module("idb-keyval") external clear: t => promise<unit> = "clear"

@module("idb-keyval")
external entries: t => promise<array<(string, Js.Json.t)>> = "entries"

@module("idb-keyval")
external keys: t => promise<array<string>> = "keys"

@module("idb-keyval")
external values: t => promise<array<Js.Json.t>> = "values"
