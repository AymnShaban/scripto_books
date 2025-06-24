// id : "1098127463"
// title : "Security as Code"
// subtitle : "DevSecOps Patterns with AWS"
// authors : "BK Sarthak Das, Virginia Chu"
// image : "https://www.dbooks.org/img/books/1098127463s.jpg"
// url : "https://www.dbooks.org/security-as-code-1098127463/"

class BooksModel {
  BooksModel({
      this.id, 
      this.title, 
      this.subtitle, 
      this.authors, 
      this.image, 
      this.url,});

  BooksModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'];
    image = json['image'];
    url = json['url'];
  }
  String? id;
  String? title;
  String? subtitle;
  String? authors;
  String? image;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['authors'] = authors;
    map['image'] = image;
    map['url'] = url;
    return map;
  }

}
