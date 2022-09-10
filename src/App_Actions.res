let goToPage = (page, ~dispatch) => {
  dispatch(App_Context.StoreActiveMenuItem(page))
  RescriptReactRouter.push(page->App_Page.toRoutePath)
}
