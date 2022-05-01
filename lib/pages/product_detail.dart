import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_zilla/utilities/colors.dart';
import 'package:trade_zilla/utilities/constants.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  dynamic argumentData = Get.arguments;

  late String productName, description, item_req, address, exchange_with;
  late bool fav_state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fav_state = false;
    productName = argumentData[0]['productname'];
    description = argumentData[1]['description'];
    item_req = argumentData[2]['itemrequired'];
    address = argumentData[3]['address'];
    exchange_with = argumentData[4]['exchangewith'];
  }

  @override
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = images
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.fill, width: 1000.0),
                    ],
                  )),
            ),
          ))
      .toList();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    fav_state = !fav_state;
                  });
                },
                icon: fav_state
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border)),
          ],
          title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text('Product Details')),
          backgroundColor: organeColor),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * .88,
            width: double.infinity,
            child: Column(children: [
              Expanded(
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Product Name',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text('Description',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text('Item Required',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      item_req,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text('Location',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text('Exchange With',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      exchange_with,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
