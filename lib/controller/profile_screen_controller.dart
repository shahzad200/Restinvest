
import 'package:get/get.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/utils/constants.dart';

class ProfileScreenController extends GetxController {

  List<Accounts> listAccount = [];
  int index = 0;
  String accountValue = Constant.loginModel!.response!.accounts![Constant.accountIndex].folioNumber ?? '';
  @override
  void onInit() {
    Constant.loginModel!.response!.accounts!.forEach((element) {
      // if(element.vpsAccount != true){
        listAccount.add(element);
      // }
    });
    // accountValue = Constant.loginModel!.response!.accounts![0].folioNumber ?? '';
    super.onInit();
  }


  int findIndex(String folio){
   int index = Constant.loginModel!.response!.accounts!.indexWhere((element) => element.folioNumber == folio);
    return index;
  }

}