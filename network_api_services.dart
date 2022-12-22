import 'dart:io';
import 'dart:convert';
import 'package:food_delivery_app/data/api/api_urls.dart';
import 'package:food_delivery_app/utils/app_preferences.dart';
import 'package:food_delivery_app/utils/app_string.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_app/data/app_exceptions.dart';
import 'package:food_delivery_app/data/network/base_api_services.dart';
import 'package:food_delivery_app/utils/toasts.dart';

class NetworkApiServices extends BaseApiServices {

  @override
  Future getApiResponse(String url) async {
    String? token = AppPreference.getString(AppString.token);
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse('${ApiUrls.baseUrl}$url'), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    String? token = AppPreference.getString(AppString.token);
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse('${ApiUrls.baseUrl}$url'),headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }, body: jsonEncode(data)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:
      case 401:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error Occurred while communicating with server with status code : ${response.body.toString()} ');
    }
  }
}
