import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:jvtd_shop_client/commons/constants/config.dart';
import 'package:jvtd_shop_client/commons/nets/constants/code.dart';
import 'package:jvtd_shop_client/commons/nets/handler.dart';
import 'package:jvtd_shop_client/commons/nets/response_data.dart';
import 'package:jvtd_shop_client/commons/nets/response_exception.dart';
import 'package:jvtd_shop_client/commons/utils/log_util.dart';

import 'interceptors/log_interceptor.dart';
import 'net_message.dart';

class Http extends DioForNative {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  // final TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  Http() {
    options.baseUrl = Config.BASE_URL;
    options.connectTimeout = 5000; //5s

    this.interceptors.add(new LogsInterceptors());
  }

  Future<ResponseData> netFetch(url,
      {Map<String, dynamic> header,
      Map<String, dynamic> params,
      method = 'get'}) async {
    Map<String, dynamic> headers = Map();
    if (header != null) {
      headers.addAll(header);
    }
    LogUtil.d(this.options);
    Options _option = new Options(method: method);
    _option.headers = headers;
    _option.contentType = CONTENT_TYPE_JSON;

    Response response;
    try {
      if (method == 'post' || method == "put") {
        response = await this.request(url, data: params, options: _option);
      } else {
        response = await this.request(url,
            data: params, queryParameters: params, options: _option);
      }
    } on DioError catch (e) {
      //关闭loading
      BotToast.closeAllLoading();
      LogUtil.d("e = ${e.message}");
      if (e.response.statusCode == Code.AUTH_ERROR) {
        throw UnAuthorizedException();
      }
      throw NotSuccessException.fromRespData(ResponseMessage(
          Handler.errorHandleFunction(e.response.statusCode), e.response.data));
    }
    return response.data;
  }
}

final Http http = Http();
