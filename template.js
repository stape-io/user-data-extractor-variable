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
