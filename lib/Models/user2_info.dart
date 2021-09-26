class UserDetailsModel {
  String? displayName;
  String? email;
  String? photoURL;

  UserDetailsModel({this.displayName, this.email, this.photoURL});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    photoURL = json["photoURL"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = <String, dynamic>{};

    mapData["displayName"] = displayName;
    mapData["email"] = email;
    mapData["photoURL"] = photoURL;

    return mapData;
  }
}
