// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:test_1/models/catalog.dart';
import 'package:test_1/widgets/home_widgets/catalog_header.dart';
import 'package:test_1/widgets/home_widgets/catalog_list.dart';
import 'package:test_1/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalog_json =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalog_json);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
