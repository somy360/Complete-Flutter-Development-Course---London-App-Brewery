import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../coin_data.dart';
import 'dart:io' show Platform;

import '../coin_data.dart';
import '../coin_data.dart';
import '../coin_data.dart';
import '../coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String btcRate;
  String ethRate;
  String ltcRate;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      style: TextStyle(fontSize: 40),
      elevation: 40,
      iconSize: 40,
      dropdownColor: Colors.lightBlue,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value;
            getData(value, 'BTC');
            getData(value, 'ETH');
            getData(value, 'LTC');
          },
        );
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData(currenciesList[selectedIndex], 'BTC');
        });
      },
      children: pickerItems,
    );
  }

  //get the
  void getData(String traditionalCurrency, String cryptoCurrency) async {
    CoinData coinData = new CoinData();
    var coinModel =
        await coinData.getCoinData(traditionalCurrency, cryptoCurrency);
    if (coinModel == null) {
      return;
    } else {
      setState(
        () {
          double currencyRate = coinModel['rate'];
          btcRate = cryptoCurrency == 'BTC'
              ? currencyRate.toStringAsFixed(2)
              : btcRate;
          ethRate = cryptoCurrency == 'ETH'
              ? currencyRate.toStringAsFixed(2)
              : ethRate;
          ltcRate = cryptoCurrency == 'LTC'
              ? currencyRate.toStringAsFixed(2)
              : ltcRate;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData('USD', 'BTC');
    getData('USD', 'ETH');
    getData('USD', 'LTC');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      drawer: Drawer(
        elevation: 20,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Info'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Welcome to Coin Ticker!!\n\nThis is a simple app which shows you the current prices of the three main crypto currencies relative to the currency of your choice (default is USD)\n\nPlease select a currency\n\nI miss you lots lots!!!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $btcRate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $ethRate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTH = $ltcRate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
