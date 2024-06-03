class WorkerSendUser {
  bool? status;
  Data? data;

  WorkerSendUser({this.status, this.data});

  WorkerSendUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  UserData? userData;
  List<Posts>? posts;

  Data({this.userData, this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

}

class UserData {
  String? sId;
  String? name;
  String? email;
  String? photo;
  String? role;
  String? birthdate;
  String? city;
  int? rateAverage;
  String? job;
  String? bio;
  String? countryCode;
  String? id;

  UserData(
      {this.sId,
        this.name,
        this.email,
        this.photo,
        this.role,
        this.birthdate,
        this.city,
        this.rateAverage,
        this.job,
        this.bio,
        this.countryCode,
        this.id});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    role = json['role'];
    birthdate = json['birthdate'];
    city = json['city'];
    rateAverage = json['rateAverage'];
    job = json['job'];
    bio = json['bio'];
    countryCode = json['countryCode'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['birthdate'] = this.birthdate;
    data['city'] = this.city;
    data['rateAverage'] = this.rateAverage;
    data['job'] = this.job;
    data['bio'] = this.bio;
    data['countryCode'] = this.countryCode;
    data['id'] = this.id;
    return data;
  }
}

class Posts {
  String? sId;
  User? user;
  String? description;
  List<String>? image;
  String? job;
  String? createdAt;
  String? updatedAt;
  String? date;
  String? id;

  Posts(
      {this.sId,
        this.user,
        this.description,
        this.image,
        this.job,
        this.createdAt,
        this.updatedAt,
        this.date,
        this.id});

  Posts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    description = json['description'];

    job = json['job'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    date = json['Date'];
    id = json['id'];
  }


}

class User {
  String? sId;
  String? name;
  String? photo;
  String? role;
  String? id;

  User({this.sId, this.name, this.photo, this.role, this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['id'] = this.id;
    return data;
  }
}
