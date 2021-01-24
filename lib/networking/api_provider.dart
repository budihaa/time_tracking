import 'package:time_tracking/networking/custom_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  final String _baseUrl = "https://sambelteteh.com/";

  Future<dynamic> get(String url) async {
    // print('API GET, url: $_baseUrl$url');

    var responseJson;

    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  dynamic _response(http.Response response) {
    final String bodyResponse = response.body.toString();

    // print(bodyResponse);

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(bodyResponse);
        return responseJson;
      case 400:
        throw BadRequestException(bodyResponse);
      case 401:
      case 403:
        throw UnauthorisedException(bodyResponse);
      case 422:
        throw InvalidInputException(bodyResponse);
      case 500:

      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
