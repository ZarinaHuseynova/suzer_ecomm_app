import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/global/sized_box/sized_box.dart';

import '../../../../global/constants/app_colors.dart';
import '../data/product_data.dart';

class ProductGredviewWidgets extends StatelessWidget {
  const ProductGredviewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        childAspectRatio: 0.9,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: ProductData.generateProducts
            .map(
              (e) => Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                    color: Colors.grey.shade200,
                  ),
                ),
                elevation: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          e.image,
                          height: 90,
                          width: double.infinity,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: e.title,
                            style: TextStyle(
                              color: AppColors.titleTextColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        AppSizedBox.sizedBox8,
                        Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text: "\$ ${e.price}",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "\$ ${e.sale}",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: AppColors.textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                AppSizedBox.sizedBoxWith8,
                                RichText(
                                  textAlign: TextAlign.right,
                                  text: TextSpan(
                                      text: e.discount,
                                      style: TextStyle(
                                        color: AppColors.errorColor,
                                        fontSize: 16,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
