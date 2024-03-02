import 'package:get/get.dart';import 'profile_details_item_model.dart';/// This class defines the variables used in the [profile_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileDetailsModel {Rx<List<ProfileDetailsItemModel>> profileDetailsItemList = Rx(List.generate(3,(index) => ProfileDetailsItemModel()));

 }
