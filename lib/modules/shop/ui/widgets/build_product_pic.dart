import 'package:flutter/material.dart';
import 'package:stylish_app/modules/home/data/models/product_model.dart';

class BuildProductPic extends StatelessWidget {
  const BuildProductPic({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}