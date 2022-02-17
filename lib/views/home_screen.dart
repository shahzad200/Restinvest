import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants.dart';

import '../widgets/no_internet.dart';
import '../widgets/web_view.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/home_screen_controller.dart';
import '../routes/routes.dart';

import '../utils/colors.dart';
import '../widgets/constant_widget.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColor.whiteColor,
              leading: InkWell(
                onTap: () {
                  if(controller.isLoading == false &&
                      controller.noInternet == false) {
                    controller.scaffoldKey.currentState!.openDrawer();
                  }
                },
                child: const Icon(
                  Icons.menu,
                  color: AppColor.blueColor,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(right: 50),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    'assets/images/logonit.png',
                    fit: BoxFit.contain,
                    height: 60,
                    width: 60,
                  )
                ]),
              ),
            ),
            drawer: const CustomDrawer(),
            key: controller.scaffoldKey,
            body: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: AppColor.blueColor,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.isLoading == false &&
                                        controller.noInternet == false
                                    ? Get.to(WebViewScreen(
                                        title: 'NAV History',
                                        link:
                                            '${Constant.socialMediaLink!.response!.homeLinks!.latestNav}',
                                      ))
                                    : printInfo(info: 'Do Nothing');
                              },
                              child: IconButtonText(
                                icon: const Nav(),
                                text: "Nav History",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.isLoading == false &&
                                        controller.noInternet == false
                                    ? Get.to(WebViewScreen(
                                        title: 'Branches',
                                        link:
                                            '${Constant.socialMediaLink!.response!.homeLinks!.branchLocator}',
                                      ))
                                    : printInfo(info: 'Do Nothing');
                              },
                              child: IconButtonText(
                                icon: const Branches(),
                                // color: AppColor.whiteColor,
                                text: "BRANCHES",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.isLoading == false &&
                                        controller.noInternet == false
                                    ? Get.to(WebViewScreen(
                                        title: 'Learning',
                                        link:
                                            '${Constant.socialMediaLink!.response!.homeLinks!.learning}',
                                      ))
                                    : printInfo(info: 'Do Nothing');
                              },
                              child: IconButtonText(
                                  icon: const Learning(), text: "LEARNING"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Expanded(
                              child: ContainerBox(
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.black,
                            ),
                            textColor: AppColor.blueColor,
                            text: 'OPEN  DIGITAL\n   ACCOUNT',
                            voidcallback: () {
                              controller.isLoading == false &&
                                      controller.noInternet == false
                                  ?
                              // Get.toNamed(AppRoute.accountOpenUploadScreen)
                              Get.toNamed(AppRoute.accountopeningrequest)
                                  : printInfo(info: 'Do Nothing');
                            },
                            containerColor: AppColor.whiteColor,
                          )),
                          Constant.userId == '-0456'
                              ? Expanded(
                                  child: ContainerBox(
                                  icon: const Portofol(),
                                  textColor: AppColor.blueColor,
                                  text: 'LOGIN',
                                  voidcallback: () {
                                    controller.isLoading == false &&
                                            controller.noInternet == false
                                        ? (){
                                      Constant.drawerIndex = 9;
                                      Get.offAllNamed(AppRoute.loginRoute);
                                    }()
                                        : printInfo(info: 'Do Nothing');
                                  },
                                  containerColor: AppColor.liteblue,
                                ))
                              : Expanded(
                                  child: ContainerBox(
                                  icon: const Portofol(),
                                  textColor: AppColor.blueColor,
                                  text: 'DASHBOARD',
                                  voidcallback: () {
                                    controller.isLoading == false &&
                                            controller.noInternet == false
                                        ? (){
                                      Constant.drawerIndex = 3;
                                      Get.offAllNamed(AppRoute.portofolioRoute);
                                    }()
                                        : printInfo(info: 'Do Nothing');
                                  },
                                  containerColor: AppColor.liteblue,
                                ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Expanded(
                              child: ContainerBox(
                            icon: const FundManager(),
                            textColor: AppColor.blueColor,
                            text: 'FUND MANAGER\n       REPORT',
                            voidcallback: () {
                              controller.isLoading == false &&
                                      controller.noInternet == false
                                  ? Get.to(WebViewScreen(
                                      title: 'Fund Manager Reports',
                                      link:
                                          'https://nit.com.pk/newnit/ConsolidatedFMR.aspx',
                                    ))
                                  : printInfo(info: 'Do Nothing');
                            },
                            containerColor: AppColor.liteblue,
                          )),
                          Expanded(
                              child: ContainerBox(
                            textColor: AppColor.blueColor,
                            icon: const News(),
                            text: 'NEWS',
                            voidcallback: () {
                              controller.isLoading == false &&
                                      controller.noInternet == false
                                  ? Get.to(WebViewScreen(
                                      title: 'News',
                                      link:
                                          'https://nit.com.pk/newnit/News.aspx',
                                    ))
                                  : printInfo(info: 'Do Nothing');
                            },
                            containerColor: AppColor.whiteColor,
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Expanded(
                              child: ContainerBox(
                            icon: const Product(),
                            textColor: AppColor.blueColor,
                            text: 'PRODUCTS',
                            voidcallback: () {
                              controller.isLoading == false &&
                                      controller.noInternet == false
                                  ? Get.to(WebViewScreen(
                                      title: 'Products',
                                      link:
                                          '${Constant.socialMediaLink!.response!.homeLinks!.products}',
                                    ))
                                  : printInfo(info: 'Do Nothing');
                            },
                            containerColor: AppColor.whiteColor,
                          )),
                          Expanded(
                              child: ContainerBox(
                            icon: const PicFund(),
                            textColor: AppColor.blueColor,
                            text: 'PICK YOUR FUND',
                            voidcallback: () {
                              controller.isLoading == false &&
                                      controller.noInternet == false
                                  ? Get.to(WebViewScreen(
                                      title: 'Pick Your Fund',
                                      link:
                                          'https://nit.com.pk/newnit/Pickyourfunds.aspx',
                                    ))
                                  : printInfo(info: 'Do Nothing');
                            },
                            containerColor: AppColor.liteblue,
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Expanded(
                              child: ContainerBox(
                            icon: const Market(),
                            textColor: AppColor.blueColor,
                            text: 'MARKET',
                            voidcallback: () {
                              controller.isLoading == false &&
                                      controller.noInternet == false
                                  ? Get.to(WebViewScreen(
                                      title: 'Market',
                                      link:
                                          '${Constant.socialMediaLink!.response!.homeLinks!.market}',
                                    ))
                                  : printInfo(info: 'Do Nothing');
                            },
                            containerColor: AppColor.liteblue,
                          )),
                          // Constant.userId == '-0456'
                          //     ?
                          Expanded(
                                  child: ContainerBox(
                                  icon: const Chat(),
                                  textColor: AppColor.blueColor,
                                  text: 'ABOUT',
                                  voidcallback: () {
                                    controller.isLoading == false &&
                                            controller.noInternet == false
                                        ? Get.to(WebViewScreen(
                                            title: 'About Us',
                                            link: Constant.linkAboutUs,
                                          ))
                                        : printInfo(info: 'Do Nothing');
                                  },
                                  containerColor: AppColor.whiteColor,
                                ))
                              // : Expanded(
                              //     child: ContainerBox(
                              //     icon: const Portofol(),
                              //     textColor: AppColor.whiteColor,
                              //     text: 'DashBoard',
                              //     voidcallback: () {
                              //       controller.isLoading == false &&
                              //               controller.noInternet == false
                              //           ? Get.toNamed(AppRoute.portofolioRoute)
                              //           : printInfo(info: 'Do Nothing');
                              //     },
                              //     containerColor: AppColor.liteblue,
                              //   ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Expanded(
                              child: ContainerBox(
                            icon: const Calculator(),
                            textColor: AppColor.blueColor,
                            text: 'TAX CALCULATOR',
                            voidcallback: () {
                              controller.isLoading == false &&
                                      controller.noInternet == false
                                  ? Get.toNamed(AppRoute.taxcalculatorRoute)
                                  : printInfo(info: 'Do Nothing');
                            },
                            containerColor: AppColor.whiteColor,
                          )),
                          Expanded(
                              child: ContainerBox(
                                  icon: const DailyNav(),
                                  textColor: AppColor.blueColor,
                                  text: 'DAILY NAV',
                                  voidcallback: () {
                                    controller.isLoading == false &&
                                            controller.noInternet == false
                                        ? Get.toNamed(AppRoute.dailynavRoute)
                                        : printInfo(info: 'Do Nothing');
                                  },
                                  containerColor: AppColor.liteblue)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: RowContainerBox(
                                  containerColor:
                                      AppColor.blueColor.withOpacity(.8),
                                  text: "Call",
                                  textColor: AppColor.whiteColor,
                                  voidcallback: () {
                                    controller.isLoading == false &&
                                            controller.noInternet == false
                                        ? customLaunch(
                                            'tel:${Constant.socialMediaLink!.response!.homeLinks!.advisorSms}')
                                        : printInfo(info: 'Do Nothing');
                                  },
                                  icon: const Call())),
                          const SizedBox(
                            width: 2,
                          ),
                          Expanded(
                              child: RowContainerBox(
                                  containerColor:
                                      AppColor.blueColor.withOpacity(.8),
                                  text: "SMS",
                                  textColor: AppColor.whiteColor,
                                  voidcallback: () {
                                    customDialogPin(context,
                                        "For SMS subscription please call 0800-00648");
                                    // controller.isLoading == false &&
                                    //         controller.noInternet == false
                                    //     ? customLaunch(
                                    //         'sms: ${Constant.socialMediaLink!.response!.homeLinks!.advisorSms} ')
                                    //     : printInfo(info: 'Do Nothing');
                                  },
                                  icon: const Sms())),
                          const SizedBox(
                            width: 2,
                          ),
                          Expanded(
                              child: RowContainerBox(
                                  containerColor:
                                      AppColor.blueColor.withOpacity(.8),
                                  text: "EMAIL",
                                  textColor: AppColor.whiteColor,
                                  voidcallback: () {
                                    controller.isLoading == false &&
                                            controller.noInternet == false
                                        ? customLaunch(
                                            'mailto:${Constant.socialMediaLink!.response!.homeLinks!.advisorEmail}')
                                        : printInfo(info: 'Do Nothing');
                                  },
                                  icon: const Mail())),
                          const SizedBox(
                            width: 2,
                          ),
                          // Expanded(
                          //     child: RowContainerBox(
                          //         containerColor:
                          //             AppColor.blueColor.withOpacity(.8),
                          //         text: "ABOUT US",
                          //         textColor: AppColor.whiteColor,
                          //         voidcallback: () {
                          //           controller.isLoading == false &&
                          //                   controller.noInternet == false
                          //               ? Get.to(WebViewScreen(
                          //                   title: 'About Us',
                          //                   link: Constant.linkAboutUs,
                          //                 ))
                          //               : printInfo(info: 'Do Nothing');
                          //         },
                          //         icon: const Chat()
                          //     ))
                        ],
                      ),
                    )
                  ],
                ),
                controller.isLoading
                    ? const Center(
                        child: DialogBox(),
                      )
                    : controller.noInternet
                        ? Positioned(
                            bottom: 0,
                            child: Container(
                              height: 180,
                              width: Get.width,
                              color: Colors.white,
                              child: NoInternetWgt(
                                onTryAgain: controller.getSocialLinks,
                              ),
                            ),
                          )
                        : const SizedBox()
              ],
            ),
            // controller.isLoading
            //     ? const Center(child: CircularProgressIndicator())
            //     : controller.noInternet
            //         ? NoInternetWgt(
            //             onTryAgain: controller.getSocialLinks,
            //             key: controller.scaffoldKey)
            //         :
          );
        });
  }

  void openMail(BuildContext context, String emailAddress) async {
    EmailContent email = EmailContent(
      to: [
        emailAddress,
      ],
      subject: 'Info NIT',
    );

    OpenMailAppResult result = await OpenMailApp.composeNewEmailInMailApp(
        nativePickerTitle: 'Select email app to compose', emailContent: email);
    if (!result.didOpen && !result.canOpen) {
      printInfo(info: 'No App for email');
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) => MailAppPickerDialog(
          mailApps: result.options,
          emailContent: email,
        ),
      );
    }
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      printInfo(info: ' could not launch $command');
    }
  }
}
