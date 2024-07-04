import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/payment_method_screen/models/payment_method_model.dart';

class PaymentData {
  static List<PaymentMethodModel> getpaymentDAta() {
    return [
      PaymentMethodModel(ImageConstant.imgPaypalIcon, "Payer Maintenant"),
      PaymentMethodModel(ImageConstant.imgMasterCardIcon, "Payer à la livraison"),
    ];
  }
}
