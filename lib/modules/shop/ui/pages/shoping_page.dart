import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/core/themes/font_weight_helper.dart';
import 'package:stylish_app/modules/home/product_cubit/product_cubit.dart';
import 'package:stylish_app/modules/home/ui/widgets/build_product_list.dart';
import 'package:stylish_app/modules/home/ui/widgets/custom_page_view.dart';
import 'package:stylish_app/modules/shop/ui/widgets/custom_button.dart';
import 'package:stylish_app/modules/shop/ui/widgets/custom_out_lined_with_icon.dart';

class ShopingPage extends StatefulWidget {
  const ShopingPage({super.key});
  static const String routeName = 'shop_page';

  @override
  State<ShopingPage> createState() => _ShopingPageState();
}

class _ShopingPageState extends State<ShopingPage> {
  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios_new),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomPageView(),
                  Text(
                    "Size: ${cubit.sizes[cubit.selectedSizeIndex]} UK",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeightHelper.semiBold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      cubit.sizes.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: ChoiceChip(
                          showCheckmark: false,
                          selectedColor: const Color(0xFFFA7189),
                          side: const BorderSide(color: Color(0xFFFA7189)),
                          label: Text(
                            "${cubit.sizes[index]} UK",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeightHelper.semiBold,
                              color: cubit.selectedSizeIndex == index
                                  ? Colors.white
                                  : const Color(0xFFFA7189),
                            ),
                          ),
                          selected: cubit.selectedSizeIndex == index,
                          onSelected: (selected) {
                            setState(() {
                              cubit.selectedSizeIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "NIKE Sneakers",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeightHelper.semiBold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Vision Alta Men's Shoes Size (All Colors)",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeightHelper.regular,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  //  RateWidget(
                  //   product: products as ProductModel,
                  //   fontSize: 14,
                  //   starSize: 18,
                  //   color: Color(0xFF828282),
                  // ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "₹2,999",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeightHelper.regular,
                          color: const Color(0xFF808488),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "₹1,500",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeightHelper.medium,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "50% Off",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeightHelper.semiBold,
                          color: const Color(0xFFFA7189),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Product Details",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeightHelper.medium,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Perhaps the most iconic sneaker of all-time, this original 'Chicago'? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeightHelper.regular,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      CustomOutLinedWithIcon(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomOutLinedWithIcon(
                          icon: Icon(
                            Icons.lock_outline_rounded,
                            color: Color(0xFF828282),
                            size: 16,
                          ),
                          label: 'VIP',
                        ),
                      ),
                      CustomOutLinedWithIcon(
                        icon: Icon(
                          Icons.local_shipping_outlined,
                          color: Color(0xFF828282),
                          size: 16,
                        ),
                        label: 'Return policy',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Go to cart button
                      CustomButton(),
                      SizedBox(width: 35),
                      // Buy Now button
                      CustomButton(
                        label: 'Buy Now',
                        icon: Icons.shopping_bag_outlined,
                        firstColor: Color(0xFF71F9A9),
                        secondColor: Color(0xFF31B769),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xFFFFCCD5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery in",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeightHelper.semiBold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "1 Within Hour",
                          style: GoogleFonts.montserrat(
                            fontSize: 21,
                            fontWeight: FontWeightHelper.semiBold,
                            color: const Color(0xFF010101),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomOutLinedWithIcon(
                        size: const Size(182, 48),
                        color: const Color(0xFFD9D9D9),
                        label: 'View Similar',
                        labelStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeightHelper.medium,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color(0xFF232327),
                          size: 24,
                        ),
                      ),
                      CustomOutLinedWithIcon(
                        size: const Size(182, 48),
                        color: const Color(0xFFD9D9D9),
                        label: 'Add to Compare',
                        labelStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeightHelper.medium,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        icon: const Icon(
                          Icons.compare_arrows_outlined,
                          color: Color(0xFF232327),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Similar Products",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeightHelper.semiBold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BuildProductList(
                    isLoading: cubit.isLoading,
                    products: cubit.products,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
