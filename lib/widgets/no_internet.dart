import 'package:flutter/material.dart';
import 'package:nit/utils/Strings.dart';
import 'package:nit/utils/colors.dart';

import 'button.dart';

class NoInternetWgt extends StatelessWidget {
  static const _sizeImg = 200.0;
  final void Function() onTryAgain;

  const NoInternetWgt({
    required this.onTryAgain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/no_internet.jpg'),
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
