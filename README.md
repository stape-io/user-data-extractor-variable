# User Data Extractor Variable for Google Tag Manager Server Container

The **User Data Extractor Variable** allows you to extract specific pieces of user information from incoming events on the server side, such as email addresses, phone numbers, names, or addresses. This can be highly useful for marketing and tracking purposes when enriching event data to improve targeting and attribution.

It extracts the values from the `user_data` common Event Data parameter and is especially useful for retrieving **email** and **address** information (e.g., city, street, name etc.). They can come in different structures: **email** may be under `email` or `email_address`, and **address** may be structured as array, plain object or nested within an object containing only the '0' property. This variable helps eliminate the need to create multiple Event Data variables to handle these variations.

![User Data Extractor](https://github.com/stape-io/user-data-extractor-variable/blob/main/image.png?raw=true)

## Useful resources

- [User Data Extractor variable in the Template Gallery](https://tagmanager.google.com/gallery/#/owners/stape-io/templates/user-data-extractor-variable)
- [User Data Extractor variable for Google Tag Manager server container step-by-step guide](https://stape.io/blog/user-data-extractor-variable-for-google-tag-manager-server-container)

## Open Source

Initial development was done by [Lars Friis](https://www.linkedin.com/in/lars-friis/).

The **User Data Extractor Variable** for GTM Server is developed and maintained by [Stape Team](https://stape.io/) under the Apache 2.0 license.
