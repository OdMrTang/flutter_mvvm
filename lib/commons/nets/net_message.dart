

import 'package:jvtd_shop_client/commons/utils/http_error_util.dart';
import 'package:jvtd_shop_client/commons/utils/message.dart';

class RequestMessage extends Message{
  String message;
  RequestMessage({this.message});
}

class ResponseMessage extends Message{
  String message;
  ResponseMessage(String message,var data){
    if(data is Map){
      this.message=message+':'+HttpError.getErrorData(data);
    }
    else{
      this.message=message+':'+HttpError.getListErrorData(data);
    }
  }
}