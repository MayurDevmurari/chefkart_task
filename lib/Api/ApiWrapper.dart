import 'dart:convert';
import 'dart:developer';
import 'package:chefkart_task/Api/Config.dart';
import 'package:chefkart_task/helper/utils.dart';
import 'package:http/http.dart' as http;

//! Api Call
class ApiWrapper {
  static var headers = {
    'Content-Type': 'application/json',
  };

  static dataPost(appUrl, method) async {
    try {
      var url = Uri.parse(Config.mainApiUrl + appUrl);
      var request = await http.post(url, headers: headers, body: jsonEncode(method));
      var response = jsonDecode(request.body);

      log('$appUrl API response : $response');

      if (request.statusCode == 200) {
        return response;
      } else {
        Utils.showToastMessage(request.reasonPhrase);
        return response;
      }
    } catch (e) {
      return e;
    }
  }

  static dataGet(appUrl) async {
    try {
      var url = Uri.parse(Config.mainApiUrl + appUrl);
      var request = await http.get(url, headers: headers);
      var response = jsonDecode(request.body);

      log('API Url : $url \nAPI Response : $response}');

      if (request.statusCode == 200) {
        return response;
      } else {
        Utils.showToastMessage(request.reasonPhrase);
        return response;
      }
    } catch (e) {
      return e;
    }
  }
}
