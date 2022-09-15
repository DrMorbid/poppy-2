let createStore = name => IdbKeyVal.createStore(~dbName=`${name}-db`, ~storeName=`${name}-store`)

let store = "poppy"->createStore
