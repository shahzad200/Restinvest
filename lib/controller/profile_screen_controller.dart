
import 'package:get/get.dart';
import 'package:investintrust/utils/constants.dart';

class ProfileScreenController extends GetxController {

  int index = 0;
  String accountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
  @override
  void onInit() {
    accountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
    super.onInit();
  }


  int findIndex(String folio){
   int index = Constant.loginModel!.response!.accounts!.indexWhere((element) => element.folioNumber == folio);
    return index;
  }

}