## Most Likely To Succeed

This is a Rails App using Comfortable Mexican Sofa for CMS functionality.

## Deployment Info

###### Transferring data from local dev database to Heroku (Production):

```bash
heroku pg:reset postgresql-angular-7650 --app mlts --confirm mlts && heroku pg:push mlts_development postgresql-angular-7650 --app mlts
```
###### Transferring data from Heroku to local dev database:
```bash
dropdb mlts_development
heroku pg:pull postgresql-angular-7650 mlts_development --app mlts
```

###### Transferring data from local dev database to Heroku (Staging):

```bash
heroku pg:reset postgresql-infinite-58961 --app mlts-staging --confirm mlts-staging && heroku pg:push mlts_development postgresql-infinite-58961 --app mlts-staging
```
###### Transferring data from Heroku to local dev database:
```bash
dropdb mlts_development
heroku pg:pull postgresql-infinite-58961 mlts_development --app mlts-staging
```
