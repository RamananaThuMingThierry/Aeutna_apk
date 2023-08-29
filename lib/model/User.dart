class UserM{
  String? id, nom,prenom, email, genre, adresse,niveau, contact, image,numero_carte_aeutna, filiere,image_cin, axes, sympathisant, cin, date_naissance, lieu_naissance, facebook, roles, status;
  UserM({this.id, this.nom,this.prenom,this.facebook,this.niveau, this.roles, this.status, this.email, this.image, this.contact,this.numero_carte_aeutna, this.image_cin, this.adresse, this.genre, this.axes,this.lieu_naissance, this.filiere, this.sympathisant, this.cin, this.date_naissance});

  static UserM? current;

  factory UserM.fromJson(Map<String, dynamic> j){
    return UserM(
        email: j['email'],
        niveau: j['niveau'],
        nom: j['nom'],
        prenom: j['prenom'],
        genre: j['genre'],
        filiere: j['filiere'],
        facebook: j['facebook'],
        axes:j['axes'],
        sympathisant:j['sympathisant'],
        adresse: j['adresse'],
        contact: j['contact'],
        roles:j['roles'],
        status:j['status'],
        image: j['image'],
        cin:j['cin'],
        image_cin: j['image_cin'],
        numero_carte_aeutna:j['numero_carte_aeutna'],
        date_naissance: j['date_naissance'],
        lieu_naissance: j['lieu_naissance'],
        id: j['id']);
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "nom" : nom,
    "prenom" : prenom,
    "email" : email,
    "contact" : contact,
    "image": image,
    "adresse": adresse,
    "genre" : genre,
    "filiere": filiere,
    "axes": axes,
    "niveau": niveau,
    "roles": roles,
    "status": status,
    "cin": cin,
    "facebook": facebook,
    "numero_carte_aeutna": numero_carte_aeutna,
    "image_cin": image_cin,
    "date_naissance": date_naissance,
    "lieu_naissance": lieu_naissance,
    "sympathisant": sympathisant
  };
}