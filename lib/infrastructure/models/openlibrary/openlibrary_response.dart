import 'package:navibook/infrastructure/models/openlibrary/book_openlibrary.dart';

class OpenLibraryResponse {
  final String key;
  final String name;
  final String subjectType;
  final int workCount;
  final List<BookOpenLibrary> works;

  OpenLibraryResponse({
    required this.key,
    required this.name,
    required this.subjectType,
    required this.workCount,
    required this.works,
  });

  factory OpenLibraryResponse.fromJson(Map<String, dynamic> json) =>
      OpenLibraryResponse(
        key: json["key"],
        name: json["name"],
        subjectType: json["subject_type"],
        workCount: json["work_count"],
        works: List<BookOpenLibrary>.from(
            json["works"].map((x) => BookOpenLibrary.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "subject_type": subjectType,
        "work_count": workCount,
        "works": List<dynamic>.from(works.map((x) => x.toJson())),
      };
}
