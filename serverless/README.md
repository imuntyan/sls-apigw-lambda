## API GW / Lambda integration POC

This is a POC of the API GW / lambda integration implemented with the serverless framework

### Steps to deploy

- `npm install`. Do not use pnpm as it doesn't work well with serverless

- copy `sls-local.template.yml` into `sls-local.yml` and replace
`<stage>` with your unique name. This will be the name of the stage that your deploy to.
  The stage name is a required input parameter to the `sls deploy` command. It is recommended
  that when running development deploys each developer sets the stage name
  to their unique name, so multiple stages could be deployed in the same AWS account.
  
    The `profiles` section in `sls-local.yml` maps the stage names to AWS profile names.

- initiate the AWS profile by assuming the appropriate role

- run `npm run sls:deploy -- --stage <stage>` where `<stage>`, 
replacing `<stage>` by your unique stage name. Alternatively 
  you can run `npx sls deploy --stage <stage>`
  
- when you are done, remove everything with `npx sls remove --stage <stage>`

### List of generated objects

- API Gateway `<stage>-poc-apigw-s3-proxy`
- Lambda function `poc-apigw-s3-proxy-<stage>-get`
- Lambda Role `poc-apigw-s3-proxy-lambda-role-<stage>`
- Lambda Log Group `/aws/lambda/poc-apigw-s3-proxy-<stage>-get`
- CloudFormation stack `poc-apigw-s3-proxy-<stage>`
