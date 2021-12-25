import 'package:flutter/material.dart';
import 'package:project1/models/catalog.dart';
//import 'package:project1/utils/routes.dart';
import 'package:project1/widgets/home_widgets/addtocart.dart';
//import 'package:project1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\u20B9${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalog: catalog,
            ).wh(100, 50)
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
                height: 25.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          child:
                              'ahjasiaisdiasjsiadj iasid jsaidj iajsdij iasds,a,d a,s,d,asasdjkask daskakskdksakkkkkkkkkkkkkkdaskdkaskdddddkaskkdakdkaskdkaskdaksdkaskdkaksdkasdkaksdkaskdaksdkaskdkasdkaskdkasdkaskdkadkakdkaskdkasdkakkjak kskk a  ajsdj aksdkjk a'
                                  .text
                                  .make(),
                        ),
                      ),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
