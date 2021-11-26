//Adding HTTP Package
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {

  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "70fb95b52b3218ce3d90"});

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      print(currencies);
      return currencies;
    } else {
      throw Exception("Failed to connect to API");
    }
  }

}