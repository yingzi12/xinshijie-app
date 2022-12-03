import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:xinshijieapp/models/CSDataModel.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/screens/AppSplashScreen.dart';
import 'package:xinshijieapp/store/AppStore.dart';
import 'package:xinshijieapp/utils/AppTheme.dart';
import 'package:xinshijieapp/routes.dart';

import 'common/Global.dart';
import 'utils/AppConstant.dart';
//endregion

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

List<CSDataModel> getCloudboxList = getCloudboxData();
List<CSDrawerModel> getCSDrawerList = getCSDrawer();
int currentIndex = 0;

late String darkMapStyle;
late String lightMapStyle;

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();

  // Stripe.publishableKey = STRIPE_PAYMENT_PUBLISH_KEY;
  //初始化nb_utils
  await initialize();

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  darkMapStyle = await rootBundle.loadString('assets/mapStyles/dark.json');
  lightMapStyle = await rootBundle.loadString('assets/mapStyles/light.json');

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  if (isMobile || isWeb) {
    // Firebase.initializeApp().then((value) {
    //   MobileAds.instance.initialize();
    //
    //   //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // });

    if (isMobile) {
      try {
        await OneSignal.shared.setAppId(OneSignalId);
      } catch (e) {
        print('${e.toString()}');
      }

      OneSignal.shared.setNotificationWillShowInForegroundHandler(
          (OSNotificationReceivedEvent? event) {
        return event?.complete(event.notification);
      });

      OneSignal.shared.disablePush(false);
      OneSignal.shared.consentGranted(true);
      OneSignal.shared.requiresUserPrivacyConsent();
    }
  }
  Global.init().then((e) => runApp(MyApp()));
  // runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
      ],
      child: Consumer<UserModel>(
        builder: (BuildContext context, UserModel,child) {
          return Observer(
            builder: (_) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
              home: AppSplashScreen(),
              theme: !appStore.isDarkModeOn
                  ? AppThemeData.lightTheme
                  : AppThemeData.darkTheme,
              routes: routes(),
              navigatorKey: navigatorKey,
              scrollBehavior: SBehavior(),
              // supportedLocales: LanguageDataModel.languageLocales(),
              // localizationsDelegates: [AppLocalizations(), GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
              // localeResolutionCallback: (locale, supportedLocales) => locale,
            ),
          );
        },
      ),
    );
  }
}
