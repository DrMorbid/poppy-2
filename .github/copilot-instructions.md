# Poppy Casting - AI Coding Agent Instructions

## Tech Stack & Architecture

**Next.js (App Router) + ReScript + Material-UI + react-intl**

- ReScript source (`.res`) compiles to `.res.js` in-source via `rescript` compiler
- Next.js builds from compiled JS with static export (`output: "export"`)
- All ReScript components use JSX v4 with `-open RescriptCore` globally
- App Router pages in `app/` are thin JS wrappers that re-export ReScript components from `src/`

Example: [app/contact/page.js](app/contact/page.js) → `export { default } from "../../src/contact/Contact_Page.res.js"`

## Development Workflow

**Always run TWO processes concurrently:**

```bash
yarn res:dev    # ReScript watch mode (clean + watch)
yarn dev        # Next.js dev server
```

Or use the VS Code task: "Dev: ReScript + Next.js"

**For production builds:**

```bash
yarn res:build  # Compile ReScript
yarn build      # Next.js static export
```

**Internationalization:**

```bash
yarn intl       # Extract i18n messages to src/i18n/_locales/*/messages.json
```

## File Organization & Naming Patterns

### Module Namespace Pattern

Feature modules use a namespace aggregator file:

```rescript
// src/home/Home.res (namespace aggregator)
module Page = Home_Page
module CarouselItem = Home_CarouselItem
```

Actual implementations: `Home_Page.res`, `Home_CarouselItem.res`

### Naming Convention

- **Feature components**: `FeatureName_ComponentName.res` (e.g., `EmailUs_Form.res`)
- **Global components**: `App_ComponentName.res` (e.g., `App_Context.res`)
- **Common utilities**: `Common_ComponentName.res` (e.g., `Common_Button.res`)
- **Messages**: `Message_FeatureName.res` (e.g., `Message_Home.res`)

### Directory Structure

```
src/
├── App.res, App_*.res         # Top-level app components
├── Layout.res, Main.res       # Next.js layout wrappers
├── common/                    # Shared UI components
│   ├── binding/               # External JS library bindings
│   │   ├── elasticEmail/, muiNext/, pickers/, etc.
│   └── alert/, button/, text/ # Component categories
├── theme/                     # MUI theme system
│   ├── App_Theme.res          # Main theme (breakpoints, palette)
│   ├── App_Theme_Colors.res
│   ├── App_Theme_Typography.res
│   └── *.css                  # Global styles
├── i18n/                      # Internationalization
│   ├── message/               # Message definitions per feature
│   ├── _locales/              # Generated translation files
│   └── IntlProvider.res
├── home/, contact/, emailUs/  # Feature modules
│   ├── FeatureName.res        # Namespace aggregator
│   ├── FeatureName_*.res      # Component implementations
└── utils/                     # Helper modules
```

## Critical Patterns

### 1. Client Components Directive

Most components need `@@directive("'use client';")` at the top:

```rescript
@@directive("'use client';")

@react.component
let make = (~children) => { /* ... */ }
```

This is **required** for components using hooks, context, or event handlers.

### 2. Context Pattern

Global state uses `App_Context` with reducer pattern. Access via:

```rescript
let ({topRef, homeMenuItemTargets, alert}, dispatch) = React.useContext(App_Context.Context.t)

// Dispatch actions
dispatch(AddHomeMenuItemScrollableRef(WhoWeAre, whoWeAreTopRef))
dispatch(ShowAlert(errorAlert))
```

### 3. External JS Bindings

Create bindings in `src/common/binding/<library-name>/`:

```rescript
// ElasticEmail.res
@module("@elasticemail/elasticemail-client") @new
external makeEmailsApi: unit => emailApi = "EmailsApi"

@send
external emailsPost: (emailApi, EmailData.t, ~callback: ...) => unit = "emailsPost"
```

Use record types with `@as` decorators for JS object mapping:

```rescript
type recipient = {
  @as("Email") email: string,
  @as("Fields") fields?: Dict.t<string>
}
```

### 4. Styling Approach

**MUI Sx Props** (preferred):

```rescript
let buttonStyle = Mui.Sx.obj({
  position: String("fixed"),
  bottom: Breakpoint({xs: String("1rem"), md: String("2rem")}),
})
```

**ReactDOM.Style.t** (for non-MUI or mixed styles):

```rescript
let style: ReactDOM.Style.t = {height: "10vw"}
// Convert to Sx: style->Utils.Style.styleToSx
```

**JsxDOMStyle** (for complex inline styles):

```rescript
{
  JsxDOMStyle.backgroundImage: "url(/header_bg.webp)",
  backgroundColor: "white",
}->Utils.Style.styleToSx
```

### 5. Internationalization

Define messages in feature message files:

```rescript
// Message_Home.res
@@intl.messages
let welcome = {id: "home.welcome", defaultMessage: "Welcome"}
```

Use in components:

```rescript
let intl = ReactIntl.useIntl()
<Mui.Typography>
  {intl->ReactIntl.Intl.formatMessage(Message.Home.welcome)->React.string}
</Mui.Typography>
```

**Always run `yarn intl` after adding/modifying messages** to update translation files.

### 6. Responsive Design

Use theme breakpoints:

```rescript
let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)
let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)
```

**Breakpoint values**: xs (0), sm (600), md (900), lg (1200), xl (1536)

### 7. Page Components & Routing

**Page components** use `@react.component let default = () => { ... }` (lowercase "default"):

```rescript
// Home_Page.res
@react.component
let default = () => <Mui.Grid>...</Mui.Grid>
```

**Navigation**:

```rescript
let router = Next.Navigation.useRouter()
router->App_Page.goTo(EmailUs)  // Uses App_Page.toRoutePath internally
```

### 8. Environment Variables

Access via bindings in `src/common/binding/global/EnvVar.res`:

```rescript
@val external nodeEnv: option<[#development | #production]> = "process.env.NODE_ENV"

module Email = {
  @val external apiKey: option<string> = "process.env.NEXT_PUBLIC_EMAIL_API_KEY"
}
```

Use: `EnvVar.Email.apiKey->Option.forEach(authenticate)`

## Common Gotchas

1. **ReScript must compile before Next.js can run** - if you see module not found errors, check ReScript compilation
2. **App Router pages require "use client" directive** - Next.js App Router defaults to server components
3. **Refs need conversion**: `ref={topRef->Ref.domRef}` or `ref={topRef->ReactDOM.Ref.domRef}`
4. **Option handling**: Use `->Option.map()`, `->Option.getOr()`, `->Option.forEach()` for option types
5. **JSX children arrays**: Wrap in `{[ ... ]->React.array}` when mapping/filtering

## File Changes Checklist

- **New component**: Consider namespace pattern if creating related components
- **New external library**: Create bindings in `src/common/binding/<lib>/`
- **New messages**: Add to `Message_*.res`, run `yarn intl`, translate in `_locales/*/messages.json`
- **Style changes**: Use Sx props from `Common.Style` constants when available
- **Context changes**: Update `App_Context.res` types, actions, and reducer

## Key Files Reference

- [rescript.json](rescript.json) - ReScript compiler config (suffix: `.res.js`, in-source, open RescriptCore)
- [next.config.js](next.config.js) - Static export config
- [src/App_Context.res](src/App_Context.res) - Global state management
- [src/App_Theme.res](src/theme/App_Theme.res) - MUI theme with breakpoints/colors/typography
- [src/Main.res](src/Main.res) - Root component with providers (Intl, Theme, Context, MUI)
- [scripts/intlExtractor.js](scripts/intlExtractor.js) - i18n extraction logic
