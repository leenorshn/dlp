import 'package:http/http.dart' as http;

class DlpApi {
  DlpApi._();

  static String _baseUrl = "http://localhost:4000/";

  static verifyPhone({phone}) async {
    var response =
        await http.post(_baseUrl + "/verify-phone", body: {'phone': phone});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
