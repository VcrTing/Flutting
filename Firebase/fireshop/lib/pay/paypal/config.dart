Map<dynamic, dynamic> defaultCurrency = {
  "symbol": "USD ",
  "decimalDigits": 2,
  "symbolBeforeTheNumber": true,
  "currency": "USD"
};

bool isEnableShipping = false;
bool isEnableAddress = false;

String returnURL = 'https://www.baidu.com/s?wd=return';
String cancelURL = 'https://www.baidu.com/s?wd=cancel';

// =>
// Domain
String domain = "https://api.sandbox.paypal.com"; // for sandbox mode
// String domain = "https://api.paypal.com"; // for production mode

// change clientId and secret with your own, provided by paypal
String clientId =
    'AQMaKs2G6ZXZk_NAlf9UanpDOd0d6GhZ-ZiAcPFwO4zlq5VtwFYlgiE5Y9EEZwkuZbkMArJ2C6AaPNHn';
String secret =
    'EO4f3nJAi2WaRPO41FvWzChggOzuFM7hRRlVBGcWAQrTpa_30RHvVD62cLGqtOwfomuMvhoT7p6E25CN';

/*
// =>
// item name, price and quantity
String itemName = 'iPhone X'; // 商品名称
String itemPrice = '1.99'; // 价格
int quantity = 1; // 数量

// checkout invoice details
String totalAmount = '1.99'; // 总付价格
String subTotalAmount = '1.99';
String shippingCost = '0'; // 运费
int shippingDiscountCost = 0; // 运费折扣

// =>
// Address
String userFirstName = 'Gulshan';
String userLastName = 'Yadav';
String addressCity = 'Delhi';
String addressStreet = 'Mathura Road';
String addressZipCode = '110014';
String addressCountry = 'India';
String addressState = 'Delhi';
String addressPhoneNumber = '+919990119091';

Map addressMsg = {
  'userFirstName': userFirstName,
  'userLastName': userLastName,
  'addressCity': addressCity,
  'addressStreet': addressStreet,
  'addressZipCode': addressZipCode,
  'addressCountry': addressCountry,
  'addressState': addressState,
  'addressPhoneNumber': addressPhoneNumber
};
*/
