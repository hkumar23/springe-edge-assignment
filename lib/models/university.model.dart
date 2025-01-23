class University {
  String? stateProvince;
  String alphaTwoCode;
  List<String> domains;
  List<String> webPages;
  String country;
  String name;

  University({
    this.stateProvince,
    required this.alphaTwoCode,
    required this.domains,
    required this.webPages,
    required this.country,
    required this.name,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      stateProvince: json['state-province'],
      alphaTwoCode: json['alpha_two_code'],
      domains: List<String>.from(json['domains']),
      webPages: List<String>.from(json['web_pages']),
      country: json['country'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state-province': stateProvince,
      'alpha_two_code': alphaTwoCode,
      'domains': domains,
      'web_pages': webPages,
      'country': country,
      'name': name,
    };
  }
}
