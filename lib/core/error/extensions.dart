import 'package:block/core/error/error.dart';
import 'package:flutter/foundation.dart';

extension ExceptionLogger on Object {
  void printDebug({String tag = ''}) {
    if(kDebugMode) {
      debugPrint('$tag: $this');
    }
  }
}

extension Message on NetworkError{
  String message(){
    switch(this){
      case NoInternet():
        return "Couldn't connect to server, please check your internet connection.";
      case ErrorMessage(:final message):
        return message;
      default:
        return 'Oops, something went wrong, please try again.';
    }
  }
}
