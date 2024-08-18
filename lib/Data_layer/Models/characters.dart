// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rickandmorty/Data_layer/Models/location.dart';
import 'package:rickandmorty/Data_layer/Models/origin.dart';

class Character {
  int id;
  String name;
  String status;
  String species;
  String gender;
  Origin origin;
  Location location;
  String image;
  // List<String> episode;
  String url;
  String created;
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    // required this.episode,
    required this.url,
    required this.created,
  });
  factory Character.fromJson(jsondata) {
    return Character(
      id: jsondata['id'],
      name: jsondata['name'],
      status: jsondata['status'],
      species: jsondata['species'],
      gender: jsondata['gender'],
      origin: Origin.fromJson(jsondata['origin']),
      location: Location.fromJson(jsondata['location']),
      image: jsondata['image'],
      // episode: jsondata['episode'],
      url: jsondata['url'],
      created: jsondata['created'],
    );
  }
}
