## API GW / Lambda integration POC

This is a POC of the API GW / lambda integration implemented with the serverless framework

### Steps to deploy

- `npm install`. Do not use pnpm as it doesn't work well with serverless

- copy `sls-local.template.yml` into `sls-local.yml` and replace
`<mystage>` with your unique name. This will be the name of the stage that your deploy to.
  The stage name is a required input parameter to the `sls deploy` command. It is recommended
  that when running development deploys each developer sets the stage name
  to their unique name, so multiple stages could be deployed in the same AWS account.
  
    The `profiles` section in `sls-local.yml` maps the stage names to AWS profile names.

- initiate the AWS profile by assuming the appropriate role

- run `npm run sls:deploy -- --stage <mystage>` where `<mystage>`, 
replacing `<mystage>` by your unique stage name. ALternatively 
  you can run `npx sls deploy --stage <mystage>`
