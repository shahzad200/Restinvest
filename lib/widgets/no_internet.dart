import 'package:flutter/material.dart';
import 'package:investintrust/utils/Strings.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:investintrust/utils/my_images.dart';
import 'button.dart';

class NoInternetWgt extends StatelessWidget {
  static const _sizeImg = 200.0;
  final void Function() onTryAgain;

  const NoInternetWgt({
    required this.onTryAgain,
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _sizeImg,
          height: _sizeImg,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(MyImages.notInternet),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          Strings.noInternetConnection,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 225,
          child: RestInvestButton(
            text: 'Try Again',
            buttonColor: AppColor.blueColor,
            textColor: AppColor.whiteColor,
            onPress: onTryAgain,
          ),
        ),
      ],
    );
  }
}
