## Most Likely To Succeed

This is a Rails App using Comfortable Mexican Sofa for CMS functionality.

## Deployment Info

###### Transferring data from local dev database to Heroku:

```bash
heroku pg:reset postgresql-angular-7650
heroku pg:push mlts_development postgresql-angular-7650
```
###### Transferring data from Heroku to local dev database:
```bash
dropdb mlts_development
heroku pg:pull postgresql-angular-7650 mlts_development
```
