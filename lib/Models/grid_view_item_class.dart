import 'package:flutter/material.dart';

class GridProductItem {
  final String id;
  final String image;
  final String productName;
  final String exchangewith;
  final String address;

  const GridProductItem(
      {required this.id,
      required this.exchangewith,
      required this.address,
      required this.productName,
      required this.image});
}
