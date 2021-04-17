import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWorkHelpler {
  NetWorkHelpler(this.url);
  final String url;

  Future getData() async {
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decdat = jsonDecode(data);
      return decdat;
    } else {
      print(response.statusCode);
    }
  }
}
