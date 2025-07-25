library;

class ProfileModel {
  String? name;
  String? email;
  String? role;

  ProfileModel({
    this.name,
    this.email,
    this.role,
  }) {
    name = name ?? '';
    email = email ?? '';
    role = role ?? '';
  }
}
