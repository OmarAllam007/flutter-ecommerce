class Category {
  String? name, image;

  Category({this.name, this.image});

  Category.fromJson(Map<dynamic, dynamic> map) {
    if (map.isNotEmpty) {
      name = map['name'];
      image = map['image'];
    }
  }

  toJson(){
    return {
      'name':name,
      'image':image
    };
  }
}
