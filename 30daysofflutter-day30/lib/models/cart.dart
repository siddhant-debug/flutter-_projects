import 'package:project1/core/store.dart';
import 'package:project1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field
  CatalogModel _catalog;

  //collection of ids
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //getitems in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}