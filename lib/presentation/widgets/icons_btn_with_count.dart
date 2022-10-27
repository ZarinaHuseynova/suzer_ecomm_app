import 'package:flutter/material.dart';

import '../../global/constants/app_colors.dart';

class IconBtnWithCount extends StatelessWidget {
  const IconBtnWithCount({
    Key? key,
    required this.pngPng,
    this.numOfItems = 0,
    required this.press,
  }) : super(key: key);
  final String pngPng;
  final int numOfItems;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image(
              image: AssetImage(pngPng),
              height: 25,
              width: 25,
              fit: BoxFit.fitWidth,
              color: AppColors.neuturalGreyColor,
            ),
          ),
          if (numOfItems != 0)
            Positioned(
              right: 0,
              top: -1.5,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: AppColors.errorColor,
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 1.5, color: AppColors.whiteColor)),
                child: Center(
                  child: Text(
                    '$numOfItems',
                    style: TextStyle(
                        fontSize: 10, color: AppColors.whiteColor, height: 1),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}