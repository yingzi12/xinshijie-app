// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:xinshijieapp/screen/active_bookings_screen.dart';
// import 'package:xinshijieapp/screen/booking_history_screen.dart';
// import 'package:xinshijieapp/utils/Colors.dart';
// import 'package:xinshijieapp/main.dart';
//
// import '../utils/Widgets.dart';
//
// class SearchFragment2 extends StatefulWidget {
//   final bool fromProfile;
//
//   const SearchFragment2({Key? key, required this.fromProfile}) : super(key: key);
//
//   @override
//   State<SearchFragment2> createState() => _SearchFragment2State();
// }
//
// class _SearchFragment2State extends State<SearchFragment2> with SingleTickerProviderStateMixin {
//   late TabController bookingTabController = TabController(length: 2, vsync: this, initialIndex: 0);
//
//   @override
//   void dispose() {
//     super.dispose();
//     bookingTabController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: transparent,
//         leading: Visibility(
//           visible: widget.fromProfile ? true : false,
//           child: IconButton(
//             icon: Icon(Icons.arrow_back, size: 20, color: appStore.isDarkModeOn ? white : Colors.black),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         title:
//           Form(
//             child: TextFormField(
//               keyboardType: TextInputType.name,
//               style: TextStyle(fontSize: 17),
//               decoration: commonInputDecoration(
//                 hintText: "搜索",
//                 suffixIcon: Icon(Icons.search, size: 18, color: appStore.isDarkModeOn ? white : black),
//               ),
//             ),
//           ),
//         bottom: TabBar(
//           controller: bookingTabController,
//           labelStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
//           labelColor: appStore.isDarkModeOn ? white : black,
//           unselectedLabelColor: Colors.grey,
//           indicatorColor: black,
//           tabs: [
//             Tab(text: "世界"),
//             Tab(text: "故事"),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: bookingTabController,
//         children: [
//           ActiveBookingsScreen(),
//           BookingHistoryScreen(),
//         ],
//       ),
//     );
//   }
// }
