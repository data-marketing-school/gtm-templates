___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "CLIENT",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Parse All - Client",
  "brand": {
    "id": "brand_dummy",
    "displayName": "data-marketing-school"
  },
  "description": "This client can be used to send \u003cb\u003eany HTTP request\u003c/b\u003e such as webhooks to your sGTM endpoint. It will create event data from the query parameters and the request body of the incoming HTTP request.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "path",
    "displayName": "Path (Required)",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "valueHint": "/webhook",
    "help": "The path of your HTTP request. https://example.com\u003cb\u003e/this/is/path\u003c/b\u003e"
  },
  {
    "type": "TEXT",
    "name": "event_name",
    "displayName": "Event Name (Optional)",
    "simpleValueType": true,
    "valueHint": "webhook",
    "help": "If no event name is configured here, the container will run with the default \u003cb\u003eEvent\u003c/b\u003e as event name."
  }
]


___SANDBOXED_JS_FOR_SERVER___

const requestPath = require('getRequestPath')();
const runContainer = require('runContainer');
const JSON = require('JSON');
let requestBody = JSON.parse(require('getRequestBody')());
const Object = require('Object');
const queryParams = require('getRequestQueryParameters')();
const returnResponse = require('returnResponse');

if(data.path == requestPath) {
  require('claimRequest')();
  if(data.event_name) {
    requestBody.event_name = data.event_name;
  }
  runContainer(mergeObjects(requestBody, queryParams), () => returnResponse());
}

function mergeObjects(target, source) {
  Object.keys(source).forEach(key => {
    target[key] = source[key];
  });
  return target;
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "run_container",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "return_response",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 30/12/2025, 18:35:33


