
import 'package:xinshijieapp/utils/AppImages.dart';

List<ProviderServicesModel> providerServices = getProviderServices();

class ProviderServicesModel {
  String serviceImage;
  String serviceName;
  int servicePrice;

  ProviderServicesModel(this.serviceImage, this.serviceName, this.servicePrice);
}

List<ProviderServicesModel> getProviderServices() {
  List<ProviderServicesModel> list = [];
  list.add(ProviderServicesModel(jitu, "Sofa Cleaning", 750));
  list.add(ProviderServicesModel(jitu, "Kitchen Cleaning", 1000));
  list.add(ProviderServicesModel(jitu, "Bathroom Cleaning", 1250));
  list.add(ProviderServicesModel(jitu, "Carpet Cleaning", 750));
  list.add(ProviderServicesModel(jitu, "Full House Cleaning", 1000));
  return list;
}
