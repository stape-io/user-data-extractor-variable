___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "User Data Extractor",
  "description": "Allows easy getting email, phone, etc., from a user data object.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "type",
    "displayName": "Property",
    "radioItems": [
      {
        "value": "email",
        "displayValue": "email"
      },
      {
        "value": "phone_number",
        "displayValue": "phone_number"
      },
      {
        "value": "first_name",
        "displayValue": "first_name"
      },
      {
        "value": "last_name",
        "displayValue": "last_name"
      },
      {
        "value": "street",
        "displayValue": "street"
      },
      {
        "value": "city",
        "displayValue": "street"
      },
      {
        "value": "postal_code",
        "displayValue": "postal_code"
      },
      {
        "value": "region",
        "displayValue": "region"
      },
      {
        "value": "country",
        "displayValue": "country"
      }
    ],
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const getEventData = require('getEventData');
const user_data = getEventData('user_data');

if (user_data) {
  if (data.type == 'email' || data.type == 'phone_number') return user_data[data.type] || undefined;
  else if (user_data.address) return user_data.address[0][data.type] || undefined;
}

return undefined;


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "user_data"
              }
            ]
          }
        },
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 4.7.2023 13.04.05


