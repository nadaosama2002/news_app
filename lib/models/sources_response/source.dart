class Source {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  const Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  @override
  String toString() {
    return 'Source(id: $id, name: $name, description: $description, url: $url, category: $category, language: $language, country: $country)';
  }

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        category: json['category'] as String?,
        language: json['language'] as String?,
        country: json['country'] as String?,
      );
}
