import 'dart:async';
import 'dart:io';

class CustomExceptions {
  static checkExcp(expArg) {
    var storeExp;
    switch (expArg) {

      // this doesnt detect ( cause , with timeout exception,
      // there comes formatexception first)
      case TimeoutException:
        storeExp = 'Server time out error';
        break;

      case FormatException:
        storeExp = 'Server error';
        break;

      case SocketException: // this socketExp dont works for some reason
        storeExp = 'No Internet connection';
        break;

      default:
        storeExp =
            'Unknown Error, please check your \ninternet connection  or try again later';
        break;
    }
    return storeExp;
  }
}
