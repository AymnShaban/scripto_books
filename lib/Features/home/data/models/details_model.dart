// / status : "ok"
// / id : "1503212300"
// / title : "Invent Your Own Computer Games with Python"
// / subtitle : "A beginner's guide to computer programming in Python"
// / description : "Invent Your Own Computer Games with Python teaches you how to program in the Python language..."
// / authors : "Al Sweigart"
// / publisher : "CreateSpace"
// / pages : "367"
// / year : "2015"
// / image : "https://www.dbooks.org/img/books/1503212300s.jpg"
// / url : "https://www.dbooks.org/invent-your-own-computer-games-with-python-1503212300/"
// / download : "https://www.dbooks.org/d/1503212300-1635507922-39943ccf97e71c6e/"

class DetailsModel {
  DetailsModel({
      this.status, 
      this.id, 
      this.title, 
      this.subtitle, 
      this.description, 
      this.authors, 
      this.publisher, 
      this.pages, 
      this.year, 
      this.image, 
      this.url, 
      this.download,});

  DetailsModel.fromJson(dynamic json) {
    status = json['status'];
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    authors = json['authors'];
    publisher = json['publisher'];
    pages = json['pages'];
    year = json['year'];
    image = json['image'];
    url = json['url'];
    download = json['download'];
  }
  String? status;
  String? id;
  String? title;
  String? subtitle;
  String? description;
  String? authors;
  String? publisher;
  String? pages;
  String? year;
  String? image;
  String? url;
  String? download;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['id'] = id;
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['description'] = description;
    map['authors'] = authors;
    map['publisher'] = publisher;
    map['pages'] = pages;
    map['year'] = year;
    map['image'] = image;
    map['url'] = url;
    map['download'] = download;
    return map;
  }

}