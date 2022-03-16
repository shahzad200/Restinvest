import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nit/controller/profile_screen_controller.dart';
import 'package:nit/data/models/login_model.dart';
import 'package:nit/utils/colors.dart';
import 'package:nit/utils/constants.dart';
import 'package:nit/widgets/constant_widget.dart';
import 'package:nit/widgets/custom_divider.dart';
import 'package:nit/widgets/drawer.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder<ProfileScreenController>(
        init: ProfileScreenController(),
        builder: (_) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const LogoNit(height: 60, width: 60,),
        backgroundColor: AppColor.whiteColor,
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: AppColor.blueColor,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10),
               child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const RestInvestTitle(
                          text: "Account No.",
                          textColor: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                        Spacer(),
                        Container(
                          // margin: EdgeInsets.all(10.0),
                          padding:
                          const EdgeInsets.only(left: 10.0, right: 5.0),
                          height: 35,
                          width: Get.width/2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              border: Border.all(
                                  width: 1, color: AppColor.black)),
                          child: Center(
                            child: DropdownButton(
                              isExpanded: true,
                              underline: Container(
                                color: AppColor.whiteColor,
                              ),

                              borderRadius: BorderRadius.circular(6),
                              // value: _.dropdownvalue,
                              hint: RestInvestTitle(
                                text: _.accountValue == null ||
                                    _.accountValue == ""
                                    ? ""
                                    : _.accountValue,
                                textColor: AppColor.black,
                              ),
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: AppColor.blueColor, size: 35),
                              items: _.listAccount.map<
                                  DropdownMenuItem<Accounts>>((Accounts? value) {
                                return DropdownMenuItem<Accounts>(
                                  value: value,
                                  child: Text(value!.folioNumber!),
                                );
                              }).toList(),
                              onChanged: (Accounts? value) {
                                _.accountValue = value!.folioNumber!;
                                _.index = _.findIndex(value.folioNumber ?? _.accountValue);
                                _.update();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
             ),
            Container(
              color: AppColor.blueColor,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    RestInvestTitle(
                      fontSize: 16,
                      textColor: AppColor.whiteColor,
                      text: "Basic Information:",
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Name:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.title ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Father/Husb. Name:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.fatherName ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "CNIC:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.cnic ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "CNIC Expiry Date:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.cnicExpiryDate!
                        .replaceAll('00:00:00 PKT', '') ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            Container(
              color: AppColor.blueColor,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: RestInvestTitle(
                      fontSize: 16,
                      textColor: AppColor.whiteColor,
                      text: "Contact Information:",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: const [
                  RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Phone:",
                    textColor: AppColor.black,
                  ),
                  SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Cell:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.cell ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Email:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 20,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.email ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Address:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 20,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!
                        .registeredAddress ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            Container(
              color: AppColor.blueColor,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    RestInvestTitle(
                      fontSize: 16,
                      textColor: AppColor.whiteColor,
                      text: "Account information:",
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Zakat Status:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.zakatStatus ??
                        '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "WHG / CGT:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.wht ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Account Type:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.accountType ??
                        '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Authorization:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.user!.authorization ??
                        '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            Container(
              color: AppColor.blueColor,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    RestInvestTitle(
                      fontSize: 16,
                      textColor: AppColor.whiteColor,
                      text: "Bank Information:",
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children:  [
                 const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Account Number:",
                    textColor: AppColor.black,
                  ),
                  SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.accounts![_.index].bankDetails!.accountNumber ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Bank Account Title:",
                    textColor: AppColor.black,
                  ),
                const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.accounts![_.index].bankDetails!.bankAccTitle ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Bank Name:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.accounts![_.index].bankDetails!.bankName ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
            CustomDivider(
              color: AppColor.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 10, top: 14, bottom: 14),
              child: Row(
                children: [
                  const RestInvestTitle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    text: "Bank Address:",
                    textColor: AppColor.black,
                  ),
                  const SizedBox(width: 10,),
                  RestInvestTitle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    //  Constant.loginModel!.response!.user!.title
                    text: Constant.loginModel!.response!.accounts![_.index].bankDetails!.bankAddress ?? '',
                    textColor: AppColor.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
  }
}
