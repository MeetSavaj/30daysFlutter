import 'package:flutter/material.dart';
import 'package:test_1/models/catalog.dart';
import 'package:test_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darkBluishColor,
                      ),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      width: context.screenWidth,
                      color: Colors.white,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.darkBluishColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                          "Eos aliquyam vero voluptua rebum dolor tempor sed. Rebum ipsum et est ipsum ut sadipscing. Et sit sea est lorem sit vero sadipscing et. Et sadipscing dolores invidunt et tempor. Ipsum no labore sit ut, amet et eos sanctus dolore dolores voluptua. Labore erat dolor diam invidunt consetetur magna takimata.."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p16()
                        ],
                      ).py64(),
                    ))),
          ],
        ),
      ),
    );
  }
}
