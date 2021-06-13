async function generateResponse(queryStringParameters, pathParameters) {
  if (queryStringParameters?.generateError === 'true') {
    throw new Error('generated error')
  }
  else {
    await new Promise((resolve) => setTimeout(resolve, 1000))
    return {pathParameters, queryStringParameters, ...{a: 42}}
  }
}


async function handle(event, context) {
  context.callbackWaitsForEmptyEventLoop = false

  const {httpMethod, queryStringParameters, pathParameters, body} = event

  console.log(`pathParameters: ${JSON.stringify(pathParameters)}`)
  console.log(`queryStringParameters: ${JSON.stringify(queryStringParameters)}`)

  const resultPromise = generateResponse(queryStringParameters, pathParameters)

  return resultPromise.then(responseBody => {
    console.log(`responseBody: ${JSON.stringify(responseBody)}`)
    const response = {
      "isBase64Encoded": false,
      "statusCode": 200,
      "headers": {"Content-Type": "application/json", "customHeader": "customHeaderValue", },
      "body": JSON.stringify(responseBody)
    }
    return response
  })
  .catch(error => {
    console.log(`error: ${error}`)
    const response = {
      "isBase64Encoded": false,
      "statusCode": 500,
      "headers": {"Content-Type": "application/json", "customHeader": "customHeaderValue", },
      "body": 'Internal Error!'
    }
    return response
  })
}

module.exports = {
  handle
}
