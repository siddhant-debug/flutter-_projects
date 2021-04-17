import 'package:bmakeover/bmakemodel.dart';

class WishModel {
  CatalogModel _catalogModel;

  final List<int> _itemIDs = [];

  CatalogModel get catalog => _catalogModel;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalogModel = newCatalog;
  }

  List<Item> get Items =>
      _itemIDs.map((id) => _catalogModel.getByID(id)).toList();

  num get totalPrice =>
      Items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIDs.add(item.id);
  }

  void remove(Item item) {
    _itemIDs.remove(item.id);
  }
}
