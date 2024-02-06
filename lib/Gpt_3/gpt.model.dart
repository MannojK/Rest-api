// user.dart

class DataModel {
  final List<User> results;
  final Info info;

  DataModel({
    required this.results,
    required this.info,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    final List<User> parsedResults = List.from(json['results'])
        .map((e) => User.fromJson(e))
        .toList();

    final Info parsedInfo = Info.fromJson(json['info']);

    return DataModel(
      results: parsedResults,
      info: parsedInfo,
    );
  }
}

class User {
  final Name name;
  final Dob dob;
  final Picture picture;

  User({
    required this.name,
    required this.dob,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: Name.fromJson(json['name']),
      dob: Dob.fromJson(json['dob']),
      picture: Picture.fromJson(json['picture']),
    );
  }
}

class Name {
  final String first;
  final String last;
  final String title;

  Name({
    required this.first,
    required this.last,
    required this.title,

  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      first: json['first'],
      last: json['last'],
title: json['title'],
    );
  }
}

class Dob {
  final int age;

  Dob({
    required this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      age: json['age'],
    );
  }
}

class Picture {
  final String medium;

  Picture({
    required this.medium,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      medium: json['medium'],
    );
  }
}

class Info {
  final String seed;
  final int results;
  final int page;
  final String version;

  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      seed: json['seed'],
      results: json['results'],
      page: json['page'],
      version: json['version'],
    );
  }
}
