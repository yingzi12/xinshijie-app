// import 'package:flutter/material.dart';
// import 'package:xinshijieapp/component/home_world_other_component.dart';
// import 'package:xinshijieapp/screen/all_world_screen.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:xinshijieapp/component/combos_subscriptions_component.dart';
// import 'package:xinshijieapp/component/home_service_component.dart';
// import 'package:xinshijieapp/component/popular_service_component.dart';
// import 'package:xinshijieapp/component/renovate_home_component.dart';
// import 'package:xinshijieapp/custom_widget/space.dart';
// import 'package:xinshijieapp/screen/service_providers_screen.dart';
// import 'package:xinshijieapp/screen/sign_in_screen.dart';
// import 'package:xinshijieapp/utils/Images.dart';
// import 'package:xinshijieapp/utils/Widgets.dart';
// import 'package:xinshijieapp/main.dart';
// import '../model/services_model.dart';
// import '../screen/all_categories_screen.dart';
// import '../utils/Colors.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class WorldFragment extends StatefulWidget {
//   const WorldFragment({Key? key}) : super(key: key);
//
//   @override
//   State<WorldFragment> createState() => _WorldFragmentState();
// }
//
// class _WorldFragmentState extends State<WorldFragment> {
//   double aspectRatio = 0.0;
//   List<String> bannerList = [jitu, jitu, jitu];
//
//   final offerPagesController = PageController(viewportFraction: 0.93, keepPage: true, initialPage: 1);
//   final reviewPagesController = PageController(viewportFraction: 0.93, keepPage: true, initialPage: 1);
//
//   @override
//   void dispose() {
//     offerPagesController.dispose();
//     reviewPagesController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _showLogOutDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             '您确定要注销吗?',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
//           ),
//           actions: [
//             TextButton(
//               child: Text('不是', style: TextStyle(color: Colors.grey.withOpacity(0.4))),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('确定', style: TextStyle(color: appStore.isDarkModeOn ? white : Colors.black)),
//               onPressed: () {
//                 finish(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     aspectRatio = MediaQuery.of(context).size.aspectRatio;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: transparent,
//         title: Text(
//           "世界",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: appStore.isDarkModeOn ? white : black),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child:Expanded( child: Column(
//           children: <Widget>[
//
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Form(
//                 child: TextFormField(
//                   keyboardType: TextInputType.name,
//                   style: TextStyle(fontSize: 17),
//                   decoration: commonInputDecoration(
//                     suffixIcon: Icon(Icons.search, size: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
//                     hintText: "搜索",
//                   ),
//                 ),
//               ),
//             ),
//             Space(16),
//             //轮播旋转图
//             SizedBox(
//               height: 170,
//               child: PageView.builder(
//                 controller: offerPagesController,
//                 itemCount: bannerList.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
//                       );
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.all(8),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.asset(bannerList[index], fit: BoxFit.cover),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SmoothPageIndicator(
//               controller: offerPagesController,
//               count: 3,
//               effect: ExpandingDotsEffect(
//                 dotHeight: 7,
//                 dotWidth: 8,
//                 activeDotColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
//                 expansionFactor: 2.2,
//               ),
//             ),
//             Space(8),
//             homeTitleWidget(
//               titleText: "分类",
//               onAllTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AllCategoriesScreen(list: serviceProviders, fromProviderDetails: false),
//                   ),
//                 );
//               },
//             ),
//             HomeServiceComponent(),
//             Space(16),
//             homeTitleWidget(
//               titleText: "推荐",
//               onAllTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AllCategoriesScreen(list: serviceProviders, fromProviderDetails: false),
//                   ),
//                 );
//               },
//             ),
//             Space(4),
//             PopularServiceComponent(),
//             Space(24),
//             homeTitleWidget(
//               titleText: "热门",
//               onAllTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AllWorldScreen(list: serviceProviders, fromProviderDetails: false),
//                   ),
//                 );
//               },
//             ),
//             Space(4),
//             RenovateHomeComponent(),
//             Space(24),
//             homeTitleWidget(
//               titleText: "最新",
//               onAllTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AllCategoriesScreen(list: serviceProviders, fromProviderDetails: false),
//                   ),
//                 );
//               },
//             ),
//             Space(4),
//             CombosSubscriptionsComponent(),
//             Space(24),
//             homeTitleWidget(
//               titleText: "故事-最新",
//               onAllTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AllCategoriesScreen(list: serviceProviders, fromProviderDetails: false),
//                   ),
//                 );
//               },
//             ),
//             Space(4),
//             CombosSubscriptionsComponent(),
//             Space(24),
//             homeTitleWidget(
//               titleText: "其他",
//               onAllTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AllCategoriesScreen(list: serviceProviders, fromProviderDetails: false),
//                   ),
//                 );
//               },
//             ),
//             Space(4),
//             HomeWorldOtherComponent(),
//             Space(16),
//
//           ],
//         ),
//         ),
//       ),
//     );
//   }
// }
