import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xinshijieapp/components/home_service_component.dart';
import 'package:xinshijieapp/components/popular_service_component.dart';
import 'package:xinshijieapp/models/customer_details_model.dart';
import 'package:xinshijieapp/models/user_model.dart';
import 'package:xinshijieapp/utils/AppColors.dart';
import 'package:xinshijieapp/utils/AppImages.dart';
import 'package:xinshijieapp/utils/AppWidget.dart';
import 'package:xinshijieapp/main.dart';
import 'package:xinshijieapp/utils/space.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  double aspectRatio = 0.0;
  List<String> bannerList = [jitu, jitu, jitu];

  final offerPagesController = PageController(viewportFraction: 0.93, keepPage: true, initialPage: 1);
  final reviewPagesController = PageController(viewportFraction: 0.93, keepPage: true, initialPage: 1);

  @override
  void dispose() {
    offerPagesController.dispose();
    reviewPagesController.dispose();
    super.dispose();
  }

  Future<void> _showLogOutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '您确定要注销吗?',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          actions: [
            TextButton(
              child: Text('不是', style: TextStyle(color: Colors.grey.withOpacity(0.4))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('确定', style: TextStyle(color: appStore.isDarkModeOn ? white : Colors.black)),
              onPressed: () {
                // finish(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);
    aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: transparent,
        iconTheme: IconThemeData(size: 30),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, size: 22),
            padding: EdgeInsets.only(right: 8),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NotificationScreen()),
              // );
            },
          ),
        ],
      ),
      drawer: getDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 17),
                  decoration: commonInputDecoration(
                    suffixIcon: Icon(Icons.search, size: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    hintText: "搜索",
                  ),
                ),
              ),
            ),
            Space(16),
            //轮播旋转图
            SizedBox(
              height: 170,
              child: PageView.builder(
                controller: offerPagesController,
                itemCount: bannerList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
                      // );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(bannerList[index], fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: offerPagesController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 8,
                activeDotColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
                expansionFactor: 2.2,
              ),
            ),
            Space(8),
            homeTitleWidget(
              titleText: "世界-分类",
              onAllTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => VerticalMenu(titleName:"世界-分类",list: serviceProviders, fromProviderDetails: false),
                //   ),
                // );
              },
            ),
            HomeServiceComponent(),
            Space(16),
            homeTitleWidget(
              titleText: "故事-分类",
              onAllTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => VerticalMenu(titleName:"故事-分类",list: serviceProviders, fromProviderDetails: false),
                //   ),
                // );
              },
            ),
            // HomeConstructionComponent(),
            Space(16),
            homeTitleWidget(
              titleText: "世界-热门推荐",
              onAllTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => WxTest(),
                //   ),
                // );
              },
            ),
            Space(4),
            PopularServiceComponent(),
            Space(24),
            homeTitleWidget(
              titleText: "故事-热门推荐",
              onAllTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AllCategoriesScreen(list: serviceProviders, fromProviderDetails: false),
                //   ),
                // );
              },
            ),
            Space(4),
            // RenovateHomeComponent(),
            Space(24),
            homeTitleWidget(
              titleText: "故事-最新",
              onAllTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AllCategoriesScreen(list: serviceProviders, fromProviderDetails: false),
                //   ),
                // );
              },
            ),
            Space(4),
            // CombosSubscriptionsComponent(),
            Space(24),
            homeTitleWidget(
              titleText: "故事-最新",
              onAllTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AllCategoriesScreen(list: serviceProviders, fromProviderDetails: false),
                //   ),
                // );
              },
            ),
            Space(4),
            // CombosSubscriptionsComponent(),
            Space(16),
          ],
        ),
      ),
    );
  }
  @override
  Widget getDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 24, right: 24, top: 40, bottom: 24),
            color: appStore.isDarkModeOn ? Colors.black : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "张三",
                    style: TextStyle(fontSize: 24.0,
                        color: appStore.isDarkModeOn ? black : white),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appStore.isDarkModeOn ? white : Colors.black,
                  ),
                ),
                Space(4),
                Text(
                  getName,
                  style: TextStyle(fontSize: 18,
                      color: appStore.isDarkModeOn ? white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Space(4),
                Text(getEmail, style: TextStyle(color: appColorAccent)),
              ],
            ),
          ),
          drawerWidget(
            drawerTitle: "我的资料",
            drawerIcon: Icons.person,
            drawerOnTap: () {
              // Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
            },
          ),
          drawerWidget(
            drawerTitle: "我的关注",
            drawerIcon: Icons.favorite,
            drawerOnTap: () {
              // Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteProvidersScreen()));
            },
          ),
          drawerWidget(
            drawerTitle: "通知",
            drawerIcon: Icons.notifications,
            drawerOnTap: () {
              // Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
            },
          ),
          drawerWidget(
            drawerTitle: "推荐和赚钱",
            drawerIcon: Icons.paid_rounded,
            drawerOnTap: () {
              Navigator.pop(context);
            },
          ),
          drawerWidget(
            drawerTitle: "联系我们",
            drawerIcon: Icons.mail,
            drawerOnTap: () {
              Navigator.pop(context);
            },
          ),
          drawerWidget(
            drawerTitle: "帮助",
            drawerIcon: Icons.question_mark_rounded,
            drawerOnTap: () {
              Navigator.pop(context);
            },
          ),
          drawerWidget(
            drawerTitle: "退出",
            drawerIcon: Icons.logout,
            drawerOnTap: () {
              Navigator.pop(context);
              _showLogOutDialog();
            },
          ),

        ],
      ),
    );
  }

}
