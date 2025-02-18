import 'dart:convert';
import 'package:betalent_mobile/core/constants/api_urls.dart';
import 'package:betalent_mobile/core/utils/http_error_handler.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<dynamic>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.getEmployees));

      if (response.statusCode == 200) {
        var data = utf8.decode(response.bodyBytes);
        var decodedData = json.decode(data);
        return decodedData;
      } else {
        final warning = HttpErrorHandler.handleHttpResponse(response);
        throw Exception(warning);
      }
    } catch (e) {
      final errorMessage = HttpErrorHandler.handleException(e);
      throw Exception(errorMessage);
    }
  }
}
