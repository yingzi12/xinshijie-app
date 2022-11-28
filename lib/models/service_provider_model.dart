
import 'package:xinshijieapp/utils/AppImages.dart';

import 'provider_services_model.dart';
import 'services_model.dart';

List<ServiceProviderModel> likedProviders = getLikedServices();

class ServiceProviderModel {
  int id;
  String name;
  String providerImage;
  String occupation;
  String star;
  String detailDescription;
  String jobs;
  String perHourPrice;
  bool isLiked;
  List<ProviderServicesModel> providerServices;

  ServiceProviderModel(this.id, this.name, this.providerImage, this.occupation, this.star, this.detailDescription, this.jobs, this.perHourPrice, this.isLiked, this.providerServices);
}

List<ServiceProviderModel> getPlumbers() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    0,
    "Michel smith",
    jitu,
    "Plumbers",
    "3.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "120",
    "330",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(0, "Michel John", jitu, "Home Clean", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(0, "John carter", jitu, "Plumbers", "4.5", "Hi", "120", "250", false, getProviderServices()));
  list.add(ServiceProviderModel(0, "Sammy jaine", jitu, "Electrician", "4.0", "Hi", "120", "310", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getElectricians() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(1, "Michel smith", jitu, "Electrician", "3.5", "Hi", "120", "250", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "Michel smith", jitu, "painter", "3.5", "Hi", "120", "150", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "John carter", jitu, "Home Clean", "4.5", "Hi", "120", "220", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "Carry John", jitu, "plumber", "4.0", "Hi", "120", "220", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getPainters() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(2, "Michel smith", jitu, "Painters", "3.5", "Hi", "120", "450", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "Michel smith", jitu, "Painters", "3.5", "Hi", "120", "550", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "John carter", jitu, "Painters", "4.5", "Hi", "120", "500", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "Carry John", jitu, "Electrician", "4.0", "Hi", "120", "550", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getCarpenters() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(3, "Michel smith", jitu, "Carpenters", "3.5", "Hi", "120", "150", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "Michel smith", jitu, "Carpenters", "3.5", "Hi", "120", "100", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "John carter", jitu, "Carpenters", "4.5", "Hi", "120", "250", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "Carry John", jitu, "Carpenters", "4.0", "Hi", "120", "190", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getHomeCleaning() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    4,
    "John Smith",
    jitu,
    "Home Cleaning",
    "3.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "1000",
    "150",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Carry Lain",
    jitu,
    "Home Painter",
    "3.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "125",
    "100",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "John Carter",
    jitu,
    "Home plumber",
    "4.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "79",
    "250",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Marry John",
    jitu,
    "Home Cleaning",
    "4.0",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "90",
    "190",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Harry Potter",
    jitu,
    "Home Painter",
    "4.0",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "100",
    "190",
    false,
    getProviderServices(),
  ));
  return list;
}

List<ServiceProviderModel> getLikedServices() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    0,
    "John Smith",
    jitu,
    "Home Cleaning",
    "3.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "1000",
    "150",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    1,
    "Marry John",
    jitu,
    "Home Painting",
    "4.0",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "90",
    "190",
    true,
    getProviderServices(),
  ));
  return list;
}

void addFavouriteProvider(int serviceIndex, int index) {
  likedProviders.add(ServiceProviderModel(
    serviceProviders[serviceIndex].serviceProviders[index].id,
    serviceProviders[serviceIndex].serviceProviders[index].name,
    serviceProviders[serviceIndex].serviceProviders[index].providerImage,
    serviceProviders[serviceIndex].serviceProviders[index].occupation,
    serviceProviders[serviceIndex].serviceProviders[index].star,
    serviceProviders[serviceIndex].serviceProviders[index].detailDescription,
    serviceProviders[serviceIndex].serviceProviders[index].jobs,
    serviceProviders[serviceIndex].serviceProviders[index].perHourPrice,
    true,
    serviceProviders[serviceIndex].serviceProviders[index].providerServices,
  ));
}

void removeFavouriteProvider(int serviceIndex, int index) {
  for (int i = 0; i < likedProviders.length; i++) {
    if (serviceProviders[serviceIndex].serviceProviders[index].name == likedProviders[i].name) {
      likedProviders.removeAt(i);
    }
  }
}
