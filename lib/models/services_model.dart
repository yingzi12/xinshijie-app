import 'package:flutter/material.dart';
import 'package:xinshijieapp/test/easy_refresh/ERMain.dart';
import 'package:xinshijieapp/test/extended_nested_scroll_view_exam/ENSCVMain.dart';
import 'package:xinshijieapp/test/head2_list_vice.dart';
import 'package:xinshijieapp/test/head_list_comment_vice.dart';
import 'package:xinshijieapp/test/head_list_vice.dart';
import 'package:xinshijieapp/test/nested_scroll_view.dart';
import 'package:xinshijieapp/test/test_main_streen.dart';
import 'package:xinshijieapp/utils/AppImages.dart';

import 'service_provider_model.dart';


List<ServicesModel> serviceProviders = getServices();

class ServicesModel {
  int id;
  String serviceName;
  String subName;
  String shortDescription;
  String serviceImage;
  IconData serviceIcon;
  List<ServiceProviderModel> serviceProviders;
  bool isSelected;
  Widget widget;

  ServicesModel(this.id, this.serviceName, this.shortDescription, this.subName, this.serviceProviders, this.serviceImage, this.serviceIcon, this.widget,{this.isSelected = false});
}

List<ServicesModel> getServices() {
  List<ServicesModel> list = List.empty(growable: true);
  list.add(ServicesModel(1, "列表", "Who helps you in plumbing works", "列表", getPlumbers(), jitu, Icons.plumbing,const TestMainStreen() ,isSelected: true));
  list.add(ServicesModel(2, "带头的", "Who helps you in electrical works", "带头的", getElectricians(), jitu, Icons.cable_outlined,const HeadListViewPage()));
  list.add(ServicesModel(3, "带评论的", "Who helps you in painting anything", "带评论的", getPainters(), jitu, Icons.format_paint,const HeadListCommentViewPage()));
  list.add(ServicesModel(4, "ENSCVMain demo", "Who helps you in carpenting works", "ENSCVMain demo", getCarpenters(), jitu, Icons.other_houses_sharp, ENSCVMain()));
  list.add(ServicesModel(5, "带头的", "Who helps you in cleaning the house", "带头的2", getHomeCleaning(), jitu, Icons.cleaning_services_sharp,const Head2ListViewPage()));
  list.add(ServicesModel(5, "Car Washers", "Who helps you in cleaning the car", "ERMain demo", getHomeCleaning(), jitu, Icons.car_repair_outlined, ERMain()));
  list.add(ServicesModel(6, "Car repairing", "Who helps in car repairing", "Car experts", getElectricians(), jitu, Icons.home_repair_service,const NestedScrollViewPage()));
  return list;
}

void setLiked(int serviceIndex, int index) {
  if (serviceProviders[serviceIndex].serviceProviders[index].isLiked) {
    serviceProviders[serviceIndex].serviceProviders[index].isLiked = false;
    removeFavouriteProvider(serviceIndex, index);
  } else {
    serviceProviders[serviceIndex].serviceProviders[index].isLiked = true;
    addFavouriteProvider(serviceIndex, index);
  }
}
