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
        "displayValue": "city"
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

if (!user_data) return;

switch (data.type) {
  case 'phone_number':
    return user_data[data.type];
  case 'email':
    return user_data[data.type] || user_data.email_address;
  default:
    if (user_data.address) {
      const userAddress = user_data.address[0] || user_data.address;
      return userAddress[data.type];
    }
    return;
}


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

scenarios:
- name: Should return the email address when selected
  code: "mockData.type = 'email';\n\n['email', 'email_address'].forEach((emailParam)\
    \ => {\n  const user_data = {\n    phone_number: expectedPhone,\n    address:\
    \ expectedAddress\n  };\n  user_data[emailParam] = expectedEmail;\n  \n  mock('getEventData',\
    \ (param) => {\n    if (param === 'user_data') return user_data;\n  });\n  \n\
    \  const variableResult = runCode(mockData);\n  assertThat(variableResult).isEqualTo(expectedEmail);\n\
    });\n\n"
- name: Should return the phone number when selected
  code: |-
    mockData.type = 'phone_number';

    mock('getEventData', (param) => {
      if (param === 'user_data') {
        return {
          email: expectedEmail,
          phone_number: expectedPhone,
          address: expectedAddress
        };
      }
    });

    const variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(expectedPhone);
- name: Should return the X (city, street etc) property of the address when selected
  code: "[\n  expectedAddress,\n  { 0: expectedAddress },\n  [expectedAddress]\n].forEach((addressScenario)\
    \ => {\n  ['first_name', 'last_name', 'street', 'city', 'postal_code', 'region',\
    \ 'country'].forEach((type) => {\n    mockData.type = type;\n    mock('getEventData',\
    \ (param) => {\n      if (param === 'user_data') {\n        return {\n       \
    \   email: expectedEmail,\n          phone_number: expectedPhone,\n          address:\
    \ addressScenario\n        };\n      }\n    });\n    \n    const variableResult\
    \ = runCode(mockData);\n    // Although it outputs only the last result in the\
    \ Preview pane (>), it runs through all values (just put a logToConsole to see).\n\
    \    assertThat(variableResult).isEqualTo(expectedAddress[type]);\n  });\n});\n\
    \n"
setup: |+
  const mockData = {};

  const expectedEmail = 'test@example.com';
  const expectedPhone = '123456';
  const expectedAddress = {
    first_name: 'firstname',
    last_name: 'lastname',
    street: 'street',
    city: 'city',
    postal_code: 'postalcode',
    region: 'region',
    country: 'country'
  };


___NOTES___

Created on 4.7.2023 13.04.05

