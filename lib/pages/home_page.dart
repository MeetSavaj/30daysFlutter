import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:test_1/models/catalog.dart';
import 'package:test_1/widgets/drawer.dart';
import 'package:test_1/widgets/item_widget.dart';

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
      appBar: AppBar(
        title: Text("Test_1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items!.length,
                itemBuilder: ((context, index) => ItemWidget(
                      item: CatalogModel.items![index],
                    )),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
