import 'package:flutter/material.dart';
import 'package:munchin_app/common/widgets/loader.dart';
import 'package:munchin_app/features/admin/screens/add_product_screen.dart';
import 'package:munchin_app/features/admin/screens/fooditemscreen.dart';
import 'package:munchin_app/features/admin/services/admin_services.dart';
import 'package:munchin_app/models/product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  void navigateToFoodItemsScreen(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodItemsScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            backgroundColor: Color(0xFff1f5f9),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return GestureDetector(
                    onTap: () => navigateToFoodItemsScreen(productData),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              productData.images[0], // Assuming images are URLs
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    productData.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      deleteProduct(productData, index),
                                  icon: const Icon(
                                    Icons.delete_outline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff005288),
              child: const Icon(Icons.add),
              onPressed: navigateToAddProduct,
              tooltip: 'Add a Product',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
