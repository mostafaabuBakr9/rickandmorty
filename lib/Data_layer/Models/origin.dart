class Origin {
  String name;
  String url;
  Origin({
    required this.name,
    required this.url,
  });
  factory Origin.fromJson(jsondata) {
    return Origin(name: jsondata['name'], url: jsondata['url']);
  }
}
