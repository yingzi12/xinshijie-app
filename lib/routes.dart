import 'package:flutter/material.dart';
import 'package:xinshijieapp/models/AppModel.dart';
import 'package:xinshijieapp/screens/ProKitScreenListing.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ProKitScreenListing.tag: (context) => ProKitScreenListing(ProTheme()),
  };
}
