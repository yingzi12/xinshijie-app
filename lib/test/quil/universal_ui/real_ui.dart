import 'dart:ui' as ui;

// class PlatformViewRegistry {
//   static void registerViewFactory(String viewId, dynamic cb) {
//     // ui.platformViewRegistry.registerViewFactory(viewId, cb);
//   }
// }

// ignore: camel_case_types
class PlatformViewRegistry {
  static registerViewFactory(String viewId, dynamic cb) {
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewId, cb);
  }
}
