import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

Future<double> getPrice(String id) async {
  try {
    var url = "https://api.coingecko.com/api/v3/coins/" + id;
    final Uri u = Uri.parse(url);
    var response = await http.get(u);
    var json = jsonDecode(response.body);
    var value = json['market_data']['current_price']['inr'].toString();
    return double.parse(value);
  } catch (e) {
    print(e.toString()+ " getPrice");
    return 0.0;
  }
}
