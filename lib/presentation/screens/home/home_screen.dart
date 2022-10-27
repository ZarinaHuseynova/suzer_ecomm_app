import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/global/sized_box/sized_box.dart';
import 'package:suzer_ecom_appp/global/constants/app_assets.dart';
import 'package:suzer_ecom_appp/global/constants/app_colors.dart';
import 'package:suzer_ecom_appp/presentation/screens/home/data/product_data.dart';
import 'package:suzer_ecom_appp/presentation/screens/home/widget/product_gredview_widhets.dart';
import 'package:suzer_ecom_appp/presentation/screens/styles/app_border_radius.dart';
import 'package:suzer_ecom_appp/presentation/widgets/icons_btn_with_count.dart';
import '../../../global/constants/app_icons.dart';
import '../styles/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Iterable<Container> buildCategories() {
    return ProductData.generateProducts
        .map((e) => Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
            ))
        .toList();
  }

  int currentIndex = 0;
  final List<String> images = [
    AppAssets.superProduct,
    AppAssets.recommendedProduct
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < images.length; i++) {
      result.add(
        handler(1, list[i]),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    children: [
                      AppSizedBox.sizedBox30,
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.primaryColor,
                            ),
                            hintText: "Search Product",
                            border: OutlineInputBorder(
                                borderRadius: AppBorderRadius.borderRadius5,
                                borderSide: const BorderSide()),
                          ),
                        ),
                      ),
                      AppSizedBox.sizedBoxWith15,
                      IconBtnWithCount(
                        pngPng: AppAssets.favorite,
                        press: () {},
                      ),
                      AppSizedBox.sizedBoxWith15,
                      IconBtnWithCount(
                        pngPng: AppAssets.notificationIcon,
                        press: () {},
                        numOfItems: 3,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: CarouselSlider.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        final image = images[index];
                        return buildImage(image, index);
                      },
                      options: CarouselOptions(
                          height: 220,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          onPageChanged: ((index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                          autoPlayInterval: const Duration(seconds: 5))),
                ),
                AppSizedBox.sizedBox12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(images, (index, url) {
                    int index = images.indexOf(url);
                    return Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index
                              ? AppColors.neuturalGreyColor
                              : AppColors.neutralLightGrey),
                    );
                  }),
                ),
                AppSizedBox.sizedBox16,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Category",
                        style: AppTextStyles.middleTitleStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Text(
                        "More Category",
                        style: AppTextStyles.priceMiddleTextStyle,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 1; i < 5; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Image.asset('assets/icons/$i.png'),
                          )
                      ],
                    ),
                  ),
                ),
                AppSizedBox.sizedBox24,
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Flash Sale",
                      style: AppTextStyles.middleTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: Text(
                      "See More",
                      style: AppTextStyles.priceMiddleTextStyle,
                    ),
                  )
                ]),
                AppSizedBox.sizedBox16,
                const ProductGredviewWidgets(),
                AppSizedBox.sizedBox16,
                Stack(children: [
                  Image.asset(
                    AppAssets.recommendedProduct,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                      top: 30,
                      left: 20,
                      child: Column(
                        children: [
                          Text('   Recomended Product ',
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                          AppSizedBox.sizedBox16,
                          Text('We recomended the best product',
                              style: TextStyle(color: AppColors.whiteColor)),
                        ],
                      )),
                  //const CountdownPageState(),
                ]),
                AppSizedBox.sizedBox16,
                BottomAppBar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppSizedBox.sizedBox30,
                      IconButton(onPressed: () {}, icon: AppIcons.homeIcon, color: AppColors.neuturalGreyColor , iconSize: 32,),
                      IconButton(onPressed: () {}, icon: AppIcons.searchIcon ,color: AppColors.neuturalGreyColor , iconSize: 32),
                      IconButton(onPressed: () {}, icon: AppIcons.shoppincardIcon ,color: AppColors.neuturalGreyColor , iconSize: 32),
                      IconButton(onPressed: () {}, icon: AppIcons.offerIcon ,color: AppColors.neuturalGreyColor , iconSize: 32),
                      IconButton(onPressed: () {}, icon: AppIcons.personIcon ,color: AppColors.neuturalGreyColor , iconSize: 32),
                      AppSizedBox.sizedBox16
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildImage(String images, int index) => Stack(children: [
        Image.asset(
          images,
          fit: BoxFit.contain,
        ),
        const Positioned(
            top: 30,
            left: 20,
            child: Text(
              'Super Flash sale \n50% off',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )),
        //const CountdownPageState(),
      ]);
}



// actions: [IconButton(
//           onPressed:() async {
//           SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//           sharedPreferences.remove('email').then((value){
//             GlobalRoutes.off(context ,const LoginScreen());
//           });
//         }, icon: const Icon(Icons.logout))],
