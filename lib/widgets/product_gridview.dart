import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  final String id;
  final String image;
  final String productName;
  final String exchangewith;
  final String address;
  final String description;

  ProductGridView(this.id, this.image, this.productName, this.exchangewith,
      this.address, this.description);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  void selectCategory(BuildContext ctx, String ProductName, String Description,
      String ItemRequired, String Location, String Exchangewith) {
    print('pressed');
    Get.toNamed('/productdetail', arguments: [
      {'productname': ProductName},
      {'description': Description},
      {'itemrequired': ItemRequired},
      {'address': Location},
      {'exchangewith': Exchangewith},
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectCategory(
          context,
          widget.productName,
          widget.description,
          widget.productName,
          widget.address,
          widget.exchangewith,
        );
      },
      child: Stack(children: <Widget>[
        Container(
          height: 500,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: 1,
          child: Container(
            color: Colors.black54,
            width: 200,
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Product Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.productName,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
              const Text('Exchange with',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.exchangewith,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
              const Text('Address',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.address,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
