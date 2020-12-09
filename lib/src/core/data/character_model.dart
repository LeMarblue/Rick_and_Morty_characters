import 'package:meta/meta.dart';
import 'package:rick_and_morty_characters/src/core/data/genders_enum.dart';
import 'package:rick_and_morty_characters/src/core/data/status_enum.dart';

class Character {
  Character({
    @required this.gender,
    @required this.id,
    @required this.image,
    @required this.location,
    @required this.name,
    @required this.origin,
    @required this.species,
    @required this.status,
    @required this.type,
  })  : assert(gender != null),
        assert(id != null),
        assert(image != null),
        assert(location != null),
        assert(name != null),
        assert(origin != null),
        assert(species != null),
        assert(status != null),
        assert(type != null);

  final Genders gender;
  final int id;
  final String image;
  final String location;
  final String name;
  final String origin;
  final String species;
  final Status status;
  final String type;

  String get statusAsString {
    String result;
    switch (status) {
      case Status.alive:
        result = 'Alive 💓';
        break;
      case Status.dead:
        result = 'Dead 💀';
        break;
      case Status.unknown:
        result = 'Unknown ❓';
        break;
    }
    return result;
  }

  String get genderAsString {
    String result;
    switch (gender) {
      case Genders.female:
        result = 'Female';
        break;
      case Genders.male:
        result = 'Male';
        break;
      case Genders.genderless:
        result = 'Genderless';
        break;
      case Genders.unknown:
        result = 'Unknown';
        break;
    }
    return result;
  }

  static List<Character> fromList(List<dynamic> jsonList) =>
      jsonList.map(fromDynamic).toList();

  static Character fromDynamic(dynamic json) {
    Genders gender;
    switch (json['gender']) {
      case 'Female':
        gender = Genders.female;
        break;
      case 'Male':
        gender = Genders.male;
        break;
      case 'Genderless':
        gender = Genders.genderless;
        break;
      case 'unknown':
      default:
        gender = Genders.unknown;
        break;
    }

    Status status;
    switch (json['status']) {
      case 'Alive':
        status = Status.alive;
        break;
      case 'Dead':
        status = Status.dead;
        break;
      case 'unknown':
      default:
        status = Status.unknown;
        break;
    }

    return Character(
      gender: gender,
      id: json['id'],
      image: json['image'],
      location: json['location']['name'],
      name: json['name'],
      origin: json['origin']['name'],
      species: json['species'],
      status: status,
      type: json['type'],
    );
  }
}
