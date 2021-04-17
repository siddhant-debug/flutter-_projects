import 'dart:convert';

class CatalogModel {
  static List<Item> Items;

  Item getByID(int id) =>
      Items.firstWhere((element) => element.id == id, orElse: null);
  Item getByPosition(int pos) => Items[pos];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String image;

  Item({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.image,
  });

  Item copyWith({
    num id,
    String name,
    String desc,
    num price,
    String image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        image.hashCode;
  }
}
