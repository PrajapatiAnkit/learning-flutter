import 'package:learning/models/catalog.dart';

class CartModel {
  late CatalogModal _catalog;
  final List<int> _itemIds = [];

  CatalogModal get catalog => _catalog;

  set catalog(CatalogModal newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
