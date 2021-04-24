class FactsResponse {
  int id;
  String category;
  List<Facts> facts;

  FactsResponse({this.id, this.category, this.facts});

  FactsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    if (json['facts'] != null) {
      facts = <Facts>[];
      json['facts'].forEach((v) {
        facts.add(new Facts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    if (this.facts != null) {
      data['facts'] = this.facts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facts {
  int id;
  String title;
  String description;
  String imageUrl;

  Facts({this.id, this.title, this.description, this.imageUrl});

  Facts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
