import 'package:dio/dio.dart';
import 'package:receipt_online_shop/library/interceptor/dio_interceptor.dart';
import 'package:receipt_online_shop/model/transaction_online.dart';
import 'package:receipt_online_shop/service/restclient.dart';

class Api {
  // static const String baseUrl = "http://192.168.0.163:8000/api/";
  static const String baseUrl = "http://192.168.0.200:8000/api/";

  static restClient() async {
    final dio = Dio();
    dio.interceptors.clear();
    dio.interceptors.add(DioInterceptors(dio));
    // dio.options.headers["Authorization"] = await Session.get("authorization");
    return RestClient(dio, baseUrl: baseUrl);
  }

  static Future postOrder(TransactionOnline dataOnline) async {
    final client = await Api.restClient();
    var data = client.postTransactionOnline(dataOnline);
    return data;
  }
}
