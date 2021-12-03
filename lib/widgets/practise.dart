// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:mizdah/utils/colors.dart';
// import 'package:mizdah/utils/common_function.dart';
// import 'package:mizdah/widgets/chat/colored_safearea_view.dart';
// import 'package:mizdah/widgets/custom_divider.dart';
// import 'package:mizdah/widgets/common_style.dart';
// import 'package:mizdah/widgets/common_widgets.dart';
// import 'package:mizdah/widgets/custom_textformfield.dart';
// import 'package:date_field/date_field.dart';

// class ScheduleMeetingScreen extends StatelessWidget {
//   const ScheduleMeetingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     return GetBuilder<ScheduleMeetingScreenController>(
//         init: ScheduleMeetingScreenController(),
//         builder: (_) {
//           return ColoredSafeArea(
//             child: Scaffold(
//                 body: Padding(
//               padding: screenPadding,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // getTitleText(text: 'Meeting Screen', isAsterisk: true),
//                     HeadingTitle('Meeting',color: AppColor.blueColor,weight: FontWeight.w800,isAsterisk: true,),
//                     CustomTextFormField(
//                       hint: "",
//                       onTextChange: (text) {},
//                       isRounded: false,
//                       hasIcon: false,
//                     ),
//                     const SizedBox(height: 10,),
//                      HeadingTitle('Description',color: AppColor.blueColor,weight: FontWeight.w800,),
//                   //  HeadingTitle('',color: AppColor.black,weight: FontWeight.w900,),
//                     CustomTextFormField(
//                       hint: "",
//                       onTextChange: (text) {},
//                       isRounded: false,
//                       hasIcon: false,
//                     ),
//                     const CustomDivider(),
//                    const SizedBox(height: 10,),
//                     HeadingTitle('Meeting details',color: AppColor.black,weight: FontWeight.w800,),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               // getTitleText(text: 'Day', isAsterisk: true),
//                                HeadingTitle('Day',color: AppColor.blueColor,weight: FontWeight.w800,isAsterisk: true,),
//                               DateTimeFormField(  initialValue: DateTime.now(),
//                                 decoration: const InputDecoration(
//                                   hintStyle: TextStyle(color: Colors.black45),
//                                   errorStyle:
//                                       TextStyle(color: Colors.redAccent),
//                                   border: OutlineInputBorder(),
//                                   suffixIcon: Icon(Icons.event_note),
//                                   // labelText: 'Only time',
//                                 ),
//                                 dateFormat: DateFormat('dd/MM/yyyy'),
//                                 mode: DateTimeFieldPickerMode.date,
//                                 autovalidateMode: AutovalidateMode.always,
//                                 validator: (e) => (e?.day ?? 0) == 1
//                                     ? 'Please not the first day'
//                                     : null,
//                                 onDateSelected: (DateTime value) {
//                                   print(value);
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 2,
//                         ),
//                         Expanded(
//                             child: Column(
//                           children: [
//                             // getTitleText(text: 'Time', isAsterisk: true),
//                              HeadingTitle('Time',color: AppColor.blueColor,weight: FontWeight.w800,isAsterisk:true,),
                            
//                             DateTimeFormField(
//                               initialValue: DateTime.now(),
//                               decoration: const InputDecoration(
//                                 hintStyle: TextStyle(color: Colors.black45),
//                                 errorStyle: TextStyle(color: Colors.redAccent),
//                                 border: OutlineInputBorder(),
//                                 suffixIcon: Icon(Icons.event_note),
//                                 // labelText: 'Only time',
//                               ),
//                               mode: DateTimeFieldPickerMode.time,
//                               autovalidateMode: AutovalidateMode.always,
//                               validator: (e) => (e?.day ?? 0) == 1
//                                   ? 'Please not the first day'
//                                   : null,
//                               onDateSelected: (DateTime value) {
//                                 print(value);
//                               },
//                             ),
//                           ],
//                         ))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               // getTitleText(text: "Duration", isAsterisk: true),
//                                HeadingTitle('Duration',color: AppColor.blueColor,weight: FontWeight.w800,isAsterisk: false,),
//                               Container(
//                                 height: 50,
//                                 width: 170,
//                                 padding: const EdgeInsets.only(left: 5),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     DropdownButton<String>(
//                                       menuMaxHeight: 500,
//                                       value: _.dropdownValue.value,
//                                       icon: const Icon(Icons.arrow_drop_down),
//                                       iconSize: 24,
//                                       // dropdownColor: Colors.red,
//                                       underline: Container(
//                                         height: 0,
//                                         color: Colors.white,
//                                       ),
//                                       // elevation: 16,
//                                       style: const TextStyle(
//                                           color: Colors.black, fontSize: 18),
//                                       onChanged: (duration) {
//                                         _.updateDuration(duration);
//                                       },
//                                       items: _.spinnerItems
//                                           .map<DropdownMenuItem<String>>(
//                                               (String value) {
//                                         return DropdownMenuItem<String>(
//                                           value: value,
//                                           child: Text(value),
//                                         );
//                                       }).toList(),
//                                     ),
//                                     const Icon(
//                                       Icons.event_note,
//                                       color: Colors.black54,
//                                     )
//                                   ],
//                                 ),
//                                 decoration: BoxDecoration(
//                                     color: AppColor.whiteColor,
//                                     border: Border.all(color: Colors.black26)),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 2,
//                         ),
//                         Expanded(
//                             flex: 2,
//                             child: Column(
//                               children: [
//                                 // getTitleText(text: 'Time', isAsterisk: true),
//                                  HeadingTitle('Time zone',color: AppColor.blueColor,weight: FontWeight.w800,isAsterisk: false,),
//                                 Container(
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                       color: AppColor.whiteColor,
//                                       border:
//                                           Border.all(color: Colors.black26)),
//                                 )
//                               ],
//                             ))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                           child: Checkbox(
//                             value: _.checkValue,
//                             onChanged: (value) {
//                               _.checkValue = value!;
//                               _.update();
//                             },
//                             activeColor: AppColor.blueColor,
//                           ),
//                         ),
//                         const Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 15),
//                               child: TitleText(
//                           text: 'This is a Recurring meeting',
//                           fontSize: 18,
//                         ),
//                             )),
//                       ],
//                     ),
//                   // const  SizedBox(height: 10,),
//                    const CustomDivider(),
//                     // getTitleText(text: 'Secure your meeting', isAsterisk: true),
//                      HeadingTitle('Secure your meeting',color: AppColor.black,weight: FontWeight.w800,isAsterisk: true,),
//                     // getTitleText(
//                     //     text: 'Password',
//                     //     isAsterisk: false,
//                     //     color: Colors.blue),
//                      HeadingTitle('Passsword',color: AppColor.blueColor,weight: FontWeight.w800,isAsterisk: false,),
//                     CustomTextFormField(controller: _.passwordController,
//                       hint: "",
//                       onTextChange: (text) {},
//                       isRounded: false,
//                       hasIcon: false,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     // // getTitleText(
//                     // //     text: 'Privacy', isAsterisk: false, color: Colors.blue),
//                      HeadingTitle('Privacy',color: AppColor.blueColor,weight: FontWeight.w800,isAsterisk: false,),
//                     CustomRadioButton(text:'title1',onPress: (value){},onchanged: (value){
//                    _.updatePrivacyId(value);
//                  },title1: 'public',title2: 'private',controller: _.meetingPrivacyId,),
                   
//                     // const TitleText(text: 'Public:  Anyone can join the meeting with link.\nprivate:  Only invited people are allowed to join meeting.',fontSize: 13,textColor: AppColor.goldenColor, ),
//                    HeadingTitle('Public:  Anyone can join the meeting with link.\nprivate:  Only invited people are allowed to join meeting.',color: AppColor.goldenColor,weight: FontWeight.w800,isAsterisk: false,size: 14,),
                  
//                   const SizedBox(height: 10,),
//                   Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                           child: Checkbox(
//                             value: _.checkValue2,
//                             onChanged: (value) {
//                               _.checkValue2 = value!;
//                               _.update();
//                             },
//                             activeColor: AppColor.blueColor,
//                           ),
//                         ),
//                         const Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 15),
//                               child: TitleText(
//                           text: 'Request permission on join',
//                           fontSize: 18,
//                         ),
//                             )),
//                       ],
//                     ),
//                       HeadingTitle('  Only people who have meeting link or password can\n Join meeting.',size: 14,color: AppColor.goldenColor, ),

                
//                  const CustomDivider(),
//                  const SizedBox(height: 10,),
//                 //  getTitleText(text: "Show Vedio ", isAsterisk:false,color:Colors.black),
//                  HeadingTitle('Show Vedio',size: 18,color: AppColor.black,weight: FontWeight.w800, ),
//                   HeadingTitle( 'If enabled,your camera will start when you join\nand other will be able to see you',color: AppColor.goldenColor,size: 14,
                   
//                  ),
              
//                 //  getTitleText(text: "Host ", isAsterisk:false,color:Colors.blue),
//                  HeadingTitle('Host',size: 18,color: AppColor.blueColor,weight: FontWeight.w800, ),
//               CustomRadioButton(text:'title1',onPress: (value){},onchanged: (value){
//                    _.updateParticipantId(value);
//                  },title1: 'on',title2: 'off',controller: _.meetingparticipantId,),
//                      const SizedBox(height:10),
//                        HeadingTitle( "Enabled audio ", isAsterisk:false,color:AppColor.black,size: 18,weight: FontWeight.w800,),
//                  const TitleText(text: 'If enabled,your Mic will start when you join\nand other will be able to see you',textColor: AppColor.goldenColor,
                   
//                  ),
//                 const SizedBox(height: 10,),
//                  HeadingTitle( "Participant ", isAsterisk:false,color:AppColor.blueColor),
//                 CustomRadioButton(text:'title1',onPress: (value){},onchanged: (value){
//                    _.updateHostId(value);
//                  },title1: 'on ',title2: 'off',controller: _.meetingHostId,),
//                     const SizedBox(height: 10,),
//                      HeadingTitle( "Enabled Chat ", isAsterisk:false,color:Colors.black),
//                  const TitleText(text: 'If enabled,you will be able to chat with the\nparticipant of the meeting',textColor: AppColor.goldenColor,
                   
//                  ),
//                      const SizedBox(height:10),
                
//                  CustomRadioButton(text:'title1',onPress: (value){},onchanged: (value){
//                    _.updateScheduleId(value);
//                  },title1: 'on',title2: 'off',controller: _.meetingScheduleId),
//                    const SizedBox(height: 10,),
//                     HeadingTitle('Participant',color: AppColor.blueColor,size: 18,weight: FontWeight.w800,),
//             //  CustomRadioButton(text:'title1',onPress: (value){},onchanged: (value){
//             //        _.updateChattId(value);
//             //      },title1: 'public',title2: 'private',controller: _.meetingChattId,),
//                   ],
//                 ),
//               ),
//             )),
//           );
//         });
//   }

// }

// class CustomRadioButton extends StatelessWidget {
//   const CustomRadioButton
  
  
  
//   ({
//    required this.text,
//    required this.onPress,  
//    this.controller, 
//   required this.onchanged,
//   required this.title1,
//   required this.title2,  
    
//     Key? key,
//   }) : super(key: key);
//    final String text;
//   final Function(int) onPress;
//   final String title1;
//   final String title2;
//   final dynamic controller;
//   final Function(dynamic) onchanged;


//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment:MainAxisAlignment.start,
//          children: [
//            SizedBox(width: 25,
//              child: Radio(
//                  value: 0,
//                  groupValue: controller,
//                   onChanged:onchanged),
//            ),
//          //  const SizedBox(width: 6,),
//           const SizedBox(width: 45,
//              child:  TitleText(text:'on',textColor: AppColor.black,fontSize: 14,fontWeight: FontWeight.w800,margin: EdgeInsets.only(left: 10),
//              ),
//            ),
//            Radio(
//                value: 1,
//                groupValue: controller,
//                // activeColor: Colors.red,
//                onChanged:onchanged),
//             const SizedBox(width: 45,
//              child:  TitleText(text:'off',textColor: AppColor.black,fontSize: 14,fontWeight: FontWeight.w800,margin: EdgeInsets.only(left: 5),
//              ),
             
             
//            ),
//           //  Radio(
//           //      value: 10,
//           //      groupValue: controller,
//           //      // activeColor: Colors.red,
//           //      onChanged:onchanged),
//           //   const SizedBox(width: 45,
//           //    child:  TitleText(text:
//           //      "Host only",textColor: AppColor.black,fontSize: 14,fontWeight: FontWeight.w800,
//           //    ),
//           //    ) 
//           ],
//        );
//   }
// }

// class ScheduleMeetingScreenController extends GetxController {
//   bool checkValue = false;
//   bool checkValue2 =false;
//   var meetingPrivacyId=0;
//   var meetingparticipantId=0;
//    var meetingHostId=0;
//     var meetingChatId=0;
//      var meetingScheduleId=0;

//   TextEditingController passwordController=TextEditingController();

//   @override
//   void onInit() {
//     passwordController.text=randomString();
//   }

//   int? value = 1;
//   var dropdownValue = '1'.obs;
//   List<String> spinnerItems = [
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//     '10',
//     '11',
//     '12',
//     '13',
//     '4',
//     '15',
//     '16',
//     '17',
//     '18',
//     '19',
//     '20',
//     '21',
//     '22',
//     '23',
//     '24',
//     '25',
//   ];
//   void updatePrivacyId(value){
//     meetingPrivacyId=value;
//     update();
//   }
//   void updateParticipantId(value){
//     meetingparticipantId=value;
//     update();
//   }
//   void updateDuration(duration) {
//     dropdownValue(duration);
//     update();
//   }
//    void updateHostId(value){
//     meetingHostId=value;
//     update();
//   }
//   void updateChatId(value){
//     meetingChatId=value;
//   }
//    void updateScheduleId(value){
//     meetingScheduleId=value;
//   }

// }
