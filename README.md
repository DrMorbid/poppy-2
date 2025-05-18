# Poppy Casting

## Local Startup

1. Install yarn according to [official documentation](https://yarnpkg.com/getting-started/install)
1. Create file `.env.development.local` and fill it with
    ```
    NEXT_PUBLIC_EMAIL_API_KEY=*****
    ```
1. Execute `yarn res:dev`
1. In another terminal execute `yarn dev`

## Deployment

1. Create file `.env.production.local` and fill it with
    ```
    NEXT_PUBLIC_EMAIL_API_KEY=*****
    ```
1. Execute `yarn res:dev`
1. In another terminal execute `yarn build`
