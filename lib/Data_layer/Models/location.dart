// ignore_for_file: public_member_api_docs, sort_constructors_first
class Location {
  String name;
  String url;
  Location({
    required this.name,
    required this.url,
  });
  factory Location.fromJson(jsondata) {
    return Location(name: jsondata['name'], url: jsondata['url']);
  }
}
