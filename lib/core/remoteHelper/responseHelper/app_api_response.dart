import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/model.dart';

part 'app_http_code.dart';

class AppApiResponse<T extends Model> {
  String? message;
  bool? success;
  T? data;
  String? body;
  int? statusCode;
  bool? isRemote;

  AppApiResponse(
      {this.data,
      this.success,
      this.message,
      this.body,
      this.statusCode,
      this.isRemote: true}) {
    /*print("Status code ::: ${statusCode}");
    print("Body ::: ${jsonDecode(body!)["code"]}");
    print("message ::: ${message}");*/


  }

  factory AppApiResponse.data({
    T? model,
    required http.Response response,
  }) {
    return AppApiResponse(
        statusCode: response.statusCode,
        data: model,
        success: _isSuccess(response.statusCode),
        message: _handleMessage(response.statusCode, response.body),
        body: response.body);
  }
}

String? _handleMessage(int? statusCode, String? body) {
  String? _message;

  print("Status Code :: $statusCode");
  print("body :: $body");

  switch (statusCode) {
    case AppHttpCode.OK:
      _message = /*jsonDecode(body!)["message"] ??*/ "Success";
      break;

    case AppHttpCode.INTERNAL_SERVER_ERROR:
      _message = "Internal Server error";

      break;

    case AppHttpCode.ACCEPTED:
      _message = jsonDecode(body!)["message"] ?? "Accepted";
      break;
    case AppHttpCode.CREATED:
      _message = jsonDecode(body!)["message"] ?? "Created";
      break;

    case AppHttpCode.FORBIDDEN:
      _message = jsonDecode(body!)["message"] ?? "Forbidden";
      break;
    case AppHttpCode.NOT_FOUND:
      _message = jsonDecode(body!)["message"] ?? "Not Found";
      break;
    case AppHttpCode.UNAUTHORIZED:
      _message = jsonDecode(body!)["message"] ?? "Unauthorized";

      break;
    case AppHttpCode.TOO_MANY_REQUEST:
      _message = jsonDecode(body!)["message"] ?? "Too Many Requests";

      break;
    case AppHttpCode.UNPROCESSABLE_CONTENT:
      _message = jsonDecode(body!)["message"] ?? "Unprocessing Content";

      Map<String, dynamic> _data = jsonDecode(body)["errors"];

      String errorMessage = "";

      _data.values.forEach((element) {
        String error =
            element.toString().replaceAll("[", "").replaceAll("]", "");
        if (errorMessage.isEmpty) {
          errorMessage = error;
        } else {
          errorMessage = "$errorMessage\n$error";
        }

        print("Errors :: ${element.toString()}");
      });

      print("jsonDecode(body)  :: ${jsonDecode(body)}");

      break;

    case AppHttpCode.TIME_OUT:
      _message = "Time out";

      break;

    default:
      _message = "Unknown";

      break;
  }

  return _message!;
}

bool _isSuccess(int statusCode) {
  if (statusCode == 200 || statusCode == 201) {
    return true;
  } else {
    return false;
  }
}
