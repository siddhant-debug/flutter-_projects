import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/pages/home_detailpage.dart';
//import 'package:project1/utils/routes.dart';
//import 'package:project1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'addtocart.dart';
//import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailPage(
                                catalog: catalog,
                              ))),
                  child: CatalogItem(catalog: catalog));
            })
        : VxSwiper.builder(
            height: 500,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
            scrollDirection: Axis.horizontal,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailPage(
                                catalog: catalog,
                              ))),
                  child: CatalogItem(catalog: catalog));
            });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white10),
      margin: EdgeInsets.only(left: 12.0, right: 12.0),
      child: GridTile(
        child: Hero(
          tag: Key(catalog.id.toString()),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.network(
              catalog.image,
            ),
          ),
        ),
        footer: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      catalog.name,
                      style: GoogleFonts.acme(fontSize: 20, letterSpacing: 2),
                    ),
                    Text(
                      catalog.desc,
                      style: GoogleFonts.acme(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\u20B9${catalog.price.toString()}',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                    ),
                    AddToCart(
                      catalog: catalog,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
