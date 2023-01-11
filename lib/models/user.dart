class User {
  int? iD;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? surname;
  String? email;
  String? password;
  bool? role;

  User(
      {this.iD,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.surname,
        this.email,
        this.password,
        this.role});

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    name = json['name'];
    surname = json['surname'];
    email = json['Email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['Email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }
}

