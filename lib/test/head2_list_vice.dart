// import 'dart:async';
//
// // import 'package:bruno/bruno.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_refresh/easy_refresh.dart';
// import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
// import 'package:get/get.dart';
// import 'package:xinshijieapp/utils/skeleton_item.dart';
// import 'package:xinshijieapp/utils/space.dart';
//
// class Head2ListViewPage extends StatefulWidget {
//   const Head2ListViewPage({Key? key}) : super(key: key);
//
//   @override
//   Head2ListViewPageState createState() {
//     return Head2ListViewPageState();
//   }
// }
//
// class Head2ListViewPageState extends State<Head2ListViewPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   int _tabIndex = 0;
//   int _listCount = 20;
//   int _gridCount = 20;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context);
//     return Scaffold(
//       body: ExtendedNestedScrollView(
//         onlyOneScrollInBody: true,
//         //pinnedHeaderSliverHeightBuilder: 在pinnedHeaderSliverHeightBuilder回调中设置全部pinned的header的高度， demo里面高度为 状态栏高度+SliverAppbar的高度
//         pinnedHeaderSliverHeightBuilder: () {
//           return MediaQuery.of(context).padding.top + kToolbarHeight;
//         },
//         ///headerSliverBuilder: 在内部滚动视图之前的任何小部件的构建器(由[body]给出)。
//         ///通常这是用来创建[SliverAppBar]与[TabBar]。
//         headerSliverBuilder: (context, innerBoxIsScrolled) {
//           return <Widget>[
//             const SliverAppBar(
//               pinned: true,
//               title: Text('pull to refresh in header'),
//             ),
//             SliverToBoxAdapter(
//               child: Container(
//                 color: Colors.red,
//                 alignment: Alignment.center,
//                 height: 50,
//                 child:   Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: BrnEnhanceNumberCard(
//                         itemChildren: [
//                           BrnNumberInfoItemModel(
//                               title: '推荐比',
//                               number: '3',
//                               lastDesc: '%',
//                               iconTapCallBack: (data) {}),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: Center(child: Column(
//                         children: [
//                           Space(5),
//                           SizedBox(
//                             width: 200,
//                             //进度条显示50%
//                             child: LinearProgressIndicator(
//                               backgroundColor: Colors.grey[200],
//                               valueColor: AlwaysStoppedAnimation(Colors.blue),
//                               minHeight: 10,
//                               value: .5,
//                             ),
//                           ),
//                           Space(5),
//                           //进度条显示50%
//                           SizedBox(
//                             width: 200,
//                             //进度条显示50%
//                             child: LinearProgressIndicator(
//                               backgroundColor: Colors.grey[200],
//                               valueColor: AlwaysStoppedAnimation(Colors.blue),
//                               minHeight: 10,
//                               value: .5,
//                             ),
//                           ),
//                           Space(5),
//                           //进度条显示50%
//                           SizedBox(
//                             width: 200,
//                             //进度条显示50%
//                             child: LinearProgressIndicator(
//                               backgroundColor: Colors.grey[200],
//                               valueColor: AlwaysStoppedAnimation(Colors.blue),
//                               minHeight: 10,
//                               value: .5,
//                             ),
//                           ),
//                         ],
//                       ),),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ];
//         },
//         body: Column(
//           children: <Widget>[
//
//             //TabBar 为 TabBarView 的导航标题
//             TabBar(
//               controller: _tabController,
//               labelColor: themeData.colorScheme.primary,
//               indicatorColor: themeData.colorScheme.primary,
//               onTap: (index) {
//                 setState(() {
//                   _tabIndex = index;
//                 });
//               },
//               tabs: const <Widget>[
//                 Tab(
//                   text: 'List',
//                 ),
//                 Tab(
//                   text: 'Grid',
//                 ),
//               ],
//             ),
//             Expanded(
//               child: IndexedStack(
//                 index: _tabIndex,
//                 children: <Widget>[
//                   // ExtendedVisibilityDetector 组件来指出当前可见的列表
//                   ExtendedVisibilityDetector(
//                     uniqueKey: const Key('List'),
//                     //在子作用域中，所有滚动组件将共享一个物理场。如果有滚动嵌套，使用EasyRefresh.builder或者用ScrollConfiguration设置作用域
//                     child: EasyRefresh(
//                       header: ClassicHeader(
//                         dragText: 'Pull to refresh'.tr,
//                         armedText: 'Release ready'.tr,
//                         readyText: 'Refreshing...'.tr,
//                         processingText: 'Refreshing...'.tr,
//                         processedText: 'Succeeded'.tr,
//                         noMoreText: 'No more'.tr,
//                         failedText: 'Failed'.tr,
//                         messageText: 'Last updated at %T'.tr,
//                         safeArea: false,
//                       ),
//                       footer: ClassicFooter(
//                         position: IndicatorPosition.locator,
//                         dragText: 'Pull to load'.tr,
//                         armedText: 'Release ready'.tr,
//                         readyText: 'Loading...'.tr,
//                         processingText: 'Loading...'.tr,
//                         processedText: 'Succeeded'.tr,
//                         noMoreText: 'No more'.tr,
//                         failedText: 'Failed'.tr,
//                         messageText: 'Last updated at %T'.tr,
//                       ),
//                       // CustomScrollView 组件来帮助我们创建一个公共的 Scrollable 和 Viewport ，然后它的 slivers 参数接受一个 Sliver 数组
//                       child: CustomScrollView(
//                         slivers: [
//                           //SliverList只需要设置delegate属性就可以，可以滑动的列表，常常用于滑动组件嵌套的场景
//                           SliverList(
//                               delegate:
//                                   //SliverChildListDelegate和SliverChildBuilderDelegate的区别：
//                               // SliverChildListDelegate一般用来构item建数量明确的列表，会提前build好所有的子item，所以在效率上会有问题，适合item数量不多的情况。
//                               // SliverChildBuilderDelegate构建的列表理论上是可以无限长的。
//                               // 两者的区别有些类似于ListView和ListView.builder()的区别。
//                                   SliverChildBuilderDelegate((context, index) {
//                             return SkeletonItem(index);
//                           }, childCount: _listCount)),
//                           const FooterLocator.sliver(),
//                         ],
//                       ),
//                       onRefresh: () async {
//                         await Future.delayed(const Duration(seconds: 2), () {
//                           if (mounted) {
//                             setState(() {
//                               print("onRefresh");
//                               _listCount = 20;
//                             });
//                           }
//                         });
//                       },
//                       onLoad: () async {
//                         await Future.delayed(const Duration(seconds: 2), () {
//                           if (mounted) {
//                             setState(() {
//                               print("_listCount");
//                               _listCount += 10;
//                             });
//                           }
//                         });
//                       },
//                     ),
//                   ),
//                   ExtendedVisibilityDetector(
//                     uniqueKey: const Key('Tab1'),
//                     child: EasyRefresh(
//                       header: ClassicHeader(
//                         dragText: 'Pull to refresh'.tr,
//                         armedText: 'Release ready'.tr,
//                         readyText: 'Refreshing...'.tr,
//                         processingText: 'Refreshing...'.tr,
//                         processedText: 'Succeeded'.tr,
//                         noMoreText: 'No more'.tr,
//                         failedText: 'Failed'.tr,
//                         messageText: 'Last updated at %T'.tr,
//                         safeArea: false,
//                       ),
//                       footer: ClassicFooter(
//                         position: IndicatorPosition.locator,
//                         dragText: 'Pull to load'.tr,
//                         armedText: 'Release ready'.tr,
//                         readyText: 'Loading...'.tr,
//                         processingText: 'Loading...'.tr,
//                         processedText: 'Succeeded'.tr,
//                         noMoreText: 'No more'.tr,
//                         failedText: 'Failed'.tr,
//                         messageText: 'Last updated at %T'.tr,
//                       ),
//                       child: CustomScrollView(
//                         slivers: [
//                           SliverGrid(
//                               delegate:
//                                   SliverChildBuilderDelegate((context, index) {
//                                 return  SkeletonItem(index,
//                                   direction: Axis.horizontal,
//                                 );
//                               }, childCount: _gridCount),
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 childAspectRatio: 6 / 7,
//                               )),
//                           const FooterLocator.sliver(),
//                         ],
//                       ),
//                       onRefresh: () async {
//                         await Future.delayed(const Duration(seconds: 2), () {
//                           if (mounted) {
//                             setState(() {
//                               _gridCount = 30;
//                             });
//                           }
//                         });
//                       },
//                       onLoad: () async {
//                         await Future.delayed(const Duration(seconds: 2), () {
//                           if (mounted) {
//                             setState(() {
//                               _gridCount += 10;
//                             });
//                           }
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
