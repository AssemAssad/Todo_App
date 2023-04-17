import 'package:flutter/Material.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();

  static Future<String> navigationWidget(Widget widget) async {
    dynamic x =
        await Navigator.of(navkey.currentContext!).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
    return x;
  }

  static popRoute() {
    Navigator.of(navkey.currentContext!).pop();
  }

  static navigationPushReplacementWidget(Widget widget) {
    Navigator.of(navkey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: ((context) {
      return widget;
    })));
  }
}
