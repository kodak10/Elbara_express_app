/// This class defines the variables used in the [send_package_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SendPackageModel { }


class CourierService{
  String? icon;
  String? subtitle;
  String? rating;
  String? date;
  String? charges;
  String? discription;
  CourierService(this.icon,this.subtitle,this.rating,this.date,this.charges,this.discription);
}