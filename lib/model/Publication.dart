class Publication{
  String? id, titre,description,images, date, like, commentaires;
  Publication({this.id, this.titre, this.date, this.description, this.images, this.commentaires, this.like});

  static Publication? current;

  factory Publication.fromJson(Map<String, dynamic> j){
    return Publication(
        titre: j['titre'],
        description: j['description'],
        images: j['images'],
        date: j['date'],
        commentaires: j['commentaires'],
        like: j['like'],
        id: j['id']);
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "titre": titre,
    "description": description,
    "images": images,
    "date": date,
    "commentaires": commentaires,
    "like":like
  };

}