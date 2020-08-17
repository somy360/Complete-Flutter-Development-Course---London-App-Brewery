import 'package:http/http.dart';

import 'Services/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

//example working api key, bitcoin price in GBP
//https://rest.coinapi.io/v1/exchangerate/BTC/GBP?apikey=0C6D9BA1-51EC-4EC5-A751-9E1A9F102E3B
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '0C6D9BA1-51EC-4EC5-A751-9E1A9F102E3B';

class CoinData {
  Future<dynamic> getCoinData(
      String traditionalCurrency, String cryptoCurrency) async {
    var url = '$coinAPIURL/$cryptoCurrency/$traditionalCurrency?apikey=$apiKey';
    NetworkHelper networkHelper = new NetworkHelper(url);
    var coinData = await networkHelper.getData();
    return coinData;
  }
}
