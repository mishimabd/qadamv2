
class User {
  int? iD;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? surname;
  String? email;
  String? password;

  User(
      {this.iD,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.surname,
        this.email,
        this.password});

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'].toString();
    updatedAt = json['UpdatedAt'].toString();
    deletedAt = json['DeletedAt'].toString();
    name = json['name'].toString();
    surname = json['surname'].toString();
    email = json['Email'].toString();
    password = json['password'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD ;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['Email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

