import 'package:flutter/material.dart';
import 'package:munchin_app/features/cart/services/cart_services.dart';
import 'package:munchin_app/features/product_details/services/product_details_services.dart';
import 'package:munchin_app/models/product.dart';

class CartProduct extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProduct({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsServices productDetailsServices = ProductDetailsServices();
    final CartServices cartServices = CartServices();

    void increaseQuantity() {
      productDetailsServices.addToCart(
        context: context,
        product: product,
      );
    }

    void decreaseQuantity() {
      cartServices.removeFromCart(
        context: context,
        product: product,
      );
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: 77,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5BFDC).withOpacity(0.49),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    product.images[0],
                    fit: BoxFit.contain,
                    height: 135,
                    width: 135,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 220,
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 220,
                      child: Text(
                        'Rs ${product.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 220,
                      child: const Text('Eligible for FREE Shipping'),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    InkWell(
                      onTap: increaseQuantity,
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.add,
                          size: 18,
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1.5),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: Text(
                          quantity.toString(),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: decreaseQuantity,
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.remove,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
