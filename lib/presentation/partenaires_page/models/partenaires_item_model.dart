class Partenaires {
  String? icon;
  String? nom;
  String? description;
  List<String>? images; // Liste des URLs des images
  String? contact;
  String? email;
  String? webSite;
  String? facebook;
  String? instagram;
  String? tiktok;

  Partenaires({
    this.icon,
    this.nom,
    this.description,
    this.images,
    this.contact,
    this.email,
    this.webSite,
    this.facebook,
    this.instagram,
    this.tiktok,
  });

  factory Partenaires.fromMap(Map<String, dynamic> data) {
    return Partenaires(
      icon: data['logo'],
      nom: data['nom'],
      description: data['description'],
      images: [
        data['images_1'],
        data['images_2'],
        data['images_3'],
        data['images_4'],
      ],      contact: data['contact'],
      email: data['email'],
      webSite: data['webSite'],
      facebook: data['facebook'],
      instagram: data['instagram'],
      tiktok: data['tiktok'],
    );
  }
}