import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  final url;
  NetworkHelper(this.url);
  Future getData() async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = response.body;
        print(url);
        return jsonDecode(data);
        // print('$tempData°C $mainData $cityName');
      } else {
        // print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
