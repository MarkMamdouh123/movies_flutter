/// id : 344
/// logo_path : "/xenuUvcunUNpbaDOYGhWZERaym7.png"
/// name : "Mosfilm"
/// origin_country : "SU"

class ProductionCompanies {
  ProductionCompanies({
      this.id, 
      this.logoPath, 
      this.name, 
      this.originCountry,});

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;
ProductionCompanies copyWith({  int? id,
  String? logoPath,
  String? name,
  String? originCountry,
}) => ProductionCompanies(  id: id ?? this.id,
  logoPath: logoPath ?? this.logoPath,
  name: name ?? this.name,
  originCountry: originCountry ?? this.originCountry,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }

}