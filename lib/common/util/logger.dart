
class LogUtil {
  static bool debug = true;
  static void d(String tag, String msg) {
    if(debug) {
      print('$tag - $msg');
    }
  }

  static void i(String msg, {String tag}) {
    if(debug) {
      if(null == tag) {
        print("$msg");
      } else {
        print('$tag - $msg');
      }

    }
  }
}