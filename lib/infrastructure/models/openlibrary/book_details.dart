class BookDetails {
  final String firstPublishDate;
  final String subtitle;
  final String title;
  final List<String> subjectPlaces;
  final List<String> lcClassifications;
  final String key;
  final List<Author> authors;
  final List<String> deweyNumber;
  final Type type;
  final List<String> subjects;
  final List<int> covers;
  final Created description;
  final List<String> subjectPeople;
  final int latestRevision;
  final int revision;
  final Created created;
  final Created lastModified;

  BookDetails({
    required this.firstPublishDate,
    required this.subtitle,
    required this.title,
    required this.subjectPlaces,
    required this.lcClassifications,
    required this.key,
    required this.authors,
    required this.deweyNumber,
    required this.type,
    required this.subjects,
    required this.covers,
    required this.description,
    required this.subjectPeople,
    required this.latestRevision,
    required this.revision,
    required this.created,
    required this.lastModified,
  });

  factory BookDetails.fromJson(Map<String, dynamic> json) => BookDetails(
        firstPublishDate: _parseString(json, "first_publish_date",
            defaultValue: '1998', extractYear: true),
        subtitle:
            _parseString(json, 'description', defaultValue: 'sin subtitulo'),
        title: _parseString(json, "title", defaultValue: 'Sin título'),
        subjectPlaces: _parseStringList(json, "subject_places"),
        lcClassifications: _parseStringList(json, "lc_classifications"),
        key: _parseString(json, "key", defaultValue: ''),
        authors: _parseAuthors(json, "authors"),
        deweyNumber: _parseStringList(json, "dewey_number"),
        type: _parseType(json, "type"),
        subjects: _parseStringList(json, "subjects"),
        covers: _parseIntList(json, "covers"),
        description: _parseCreated(json, "description",
            defaultType: 'Desconocido',
            defaultValue:
                'In ea cillum laborum qui nulla adipisicing labore reprehenderit ea occaecat et exercitation. Id reprehenderit nisi nulla nostrud ea amet tempor veniam. Amet reprehenderit ullamco in irure sit anim fugiat.'),
        subjectPeople: _parseStringList(json, "subject_people"),
        latestRevision: _parseInt(json, "latest_revision", defaultValue: 0),
        revision: _parseInt(json, "revision", defaultValue: 0),
        created: _parseCreated(json, "created",
            defaultType: 'Desconocido', defaultValue: 'Sin fecha'),
        lastModified: _parseCreated(json, "last_modified",
            defaultType: 'Desconocido', defaultValue: 'Sin fecha'),
      );

  Map<String, dynamic> toJson() => {
        "first_publish_date": firstPublishDate,
        "subtitle": subtitle,
        "title": title,
        "subject_places": List<dynamic>.from(subjectPlaces.map((x) => x)),
        "lc_classifications":
            List<dynamic>.from(lcClassifications.map((x) => x)),
        "key": key,
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "dewey_number": List<dynamic>.from(deweyNumber.map((x) => x)),
        "type": type.toJson(),
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
        "covers": List<dynamic>.from(covers.map((x) => x)),
        "description": description.toJson(),
        "subject_people": List<dynamic>.from(subjectPeople.map((x) => x)),
        "latest_revision": latestRevision,
        "revision": revision,
        "created": created.toJson(),
        "last_modified": lastModified.toJson(),
      };

  static String _extractYear(String dateStr, {required String defaultYear}) {
    final RegExp regex = RegExp(r'\b(\d{4})\b');
    final match = regex.firstMatch(dateStr);
    if (match != null) {
      return match.group(1)!;
    }
    return defaultYear;
  }

  static String _parseString(Map<String, dynamic> json, String key,
      {required String defaultValue, bool extractYear = false}) {
    if (json.containsKey(key) && json[key] != null) {
      String value = json[key].toString();
      if (extractYear) {
        return _extractYear(value, defaultYear: defaultValue);
      }
      return value;
    }
    return defaultValue;
  }

  static List<String> _parseStringList(Map<String, dynamic> json, String key) {
    if (json.containsKey(key) && json[key] is List) {
      return List<String>.from(json[key].map((x) => x.toString()));
    }
    return [];
  }

  static List<int> _parseIntList(Map<String, dynamic> json, String key) {
    if (json.containsKey(key) && json[key] is List) {
      return List<int>.from(
          json[key].map((x) => x is int ? x : int.tryParse(x.toString()) ?? 0));
    }
    return [];
  }

  static int _parseInt(Map<String, dynamic> json, String key,
      {required int defaultValue}) {
    if (json.containsKey(key)) {
      if (json[key] is int) {
        return json[key];
      } else if (json[key] is String) {
        return int.tryParse(json[key]) ?? defaultValue;
      }
    }
    return defaultValue;
  }

  static Type _parseType(Map<String, dynamic> json, String key) {
    if (json.containsKey(key) && json[key] is Map<String, dynamic>) {
      return Type.fromJson(json[key]);
    }
    return Type(key: 'Desconocido');
  }

  static Created _parseCreated(Map<String, dynamic> json, String key,
      {required String defaultType, required String defaultValue}) {
    if (json.containsKey(key) && json[key] is Map<String, dynamic>) {
      return Created.fromJson(json[key]);
    }
    return Created(type: defaultType, value: defaultValue);
  }

  static List<Author> _parseAuthors(Map<String, dynamic> json, String key) {
    if (json.containsKey(key) && json[key] is List) {
      return List<Author>.from(json[key].map((x) =>
          x != null && x is Map<String, dynamic>
              ? Author.fromJson(x)
              : Author(
                  author: Type(key: 'Desconocido'),
                  type: Type(key: 'Desconocido'))));
    }
    return [];
  }
}

class Author {
  final Type author;
  final Type type;

  Author({
    required this.author,
    required this.type,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        author: json.containsKey("author") && json["author"] != null
            ? Type.fromJson(json["author"])
            : Type(key: 'Desconocido'),
        type: json.containsKey("type") && json["type"] != null
            ? Type.fromJson(json["type"])
            : Type(key: 'Desconocido'),
      );

  Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "type": type.toJson(),
      };
}

class Type {
  final String key;

  Type({
    required this.key,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        key: json.containsKey("key") && json["key"] != null
            ? json["key"].toString()
            : 'Desconocido',
      );

  Map<String, dynamic> toJson() => {
        "key": key,
      };
}

class Created {
  final String type;
  final String value;

  Created({
    required this.type,
    required this.value,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        type: json.containsKey("type") && json["type"] != null
            ? json["type"].toString()
            : 'Desconocido',
        value: json.containsKey("value") && json["value"] != null
            ? json["value"].toString()
            : 'Sin valor',
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}
