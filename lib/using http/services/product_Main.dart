import 'package:api_integration/using%20http/controller/productController.dart';
import 'package:api_integration/using%20http/screen/details/productDetails.dart';
import 'package:api_integration/using%20http/screen/home/widget/productTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(GetMaterialApp(home: ProductMain(),));
}
// ignore: must_be_immutable
class ProductMain extends StatelessWidget {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shop Mee!! 🛍️"),
        backgroundColor: Colors.teal[800],
        elevation: 5,
      ),
      body: Column(
        children: [
          Text(
            "Shop Your Favourites 🛒🛍️",
            style:
                GoogleFonts.gelasio(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Obx(() {
            if (productController.isLoading.value) {
              return Center(
                child: Lottie.asset("assets/animation/shp.json"),
              );
            } else {
              return GridView.builder(
                itemCount: productController.productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                  childAspectRatio: .6),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: ()=>Get.to(ProductDetailss(productController.productList[index])),
                        child: ProductTile(productController.productList[index]));
                  });
            }
          }))
        ],
      ),
    );
  }
}