class BookOpenLibrary {
  final List<String> authorAlternativeName;
  final List<String> authorKey;
  final List<String> authorName;
  final List<String> contributor;
  final String coverEditionKey;
  final int coverI;
  final List<String> ddc;
  final String ebookAccess;
  final int ebookCountI;
  final int editionCount;
  final List<String> editionKey;
  final int firstPublishYear;
  final List<String> firstSentence;
  final bool hasFulltext;
  final List<String> isbn;
  final String key;
  final List<String> language;
  final int lastModifiedI;
  final List<String> lcc;
  final List<String> lccn;
  final String lendingEditionS;
  final String lendingIdentifierS;
  final int numberOfPagesMedian;
  final List<String> oclc;
  final List<String> publishDate;
  final List<int> publishYear;
  final List<String> publisher;
  final String title;
  final String titleSort;
  final String titleSuggest;
  final String type;
  final List<String> subject;
  final List<String> place;
  final List<String> time;
  final List<String> person;
  final double ratingsAverage;
  final double ratingsSortable;
  final double ratingsCount;
  final int ratingsCount1;
  final int ratingsCount2;
  final int ratingsCount3;
  final int ratingsCount4;
  final int ratingsCount5;
  final int readinglogCount;
  final int wantToReadCount;
  final int currentlyReadingCount;
  final int alreadyReadCount;
  final double version;
  final String lccSort;
  final List<String> authorFacet;
  final String ddcSort;

  BookOpenLibrary({
    required this.authorAlternativeName,
    required this.authorKey,
    required this.authorName,
    required this.contributor,
    required this.coverEditionKey,
    required this.coverI,
    required this.ddc,
    required this.ebookAccess,
    required this.ebookCountI,
    required this.editionCount,
    required this.editionKey,
    required this.firstPublishYear,
    required this.firstSentence,
    required this.hasFulltext,
    required this.isbn,
    required this.key,
    required this.language,
    required this.lastModifiedI,
    required this.lcc,
    required this.lccn,
    required this.lendingEditionS,
    required this.lendingIdentifierS,
    required this.numberOfPagesMedian,
    required this.oclc,
    required this.publishDate,
    required this.publishYear,
    required this.publisher,
    required this.title,
    required this.titleSort,
    required this.titleSuggest,
    required this.type,
    required this.subject,
    required this.place,
    required this.time,
    required this.person,
    required this.ratingsAverage,
    required this.ratingsSortable,
    required this.ratingsCount,
    required this.ratingsCount1,
    required this.ratingsCount2,
    required this.ratingsCount3,
    required this.ratingsCount4,
    required this.ratingsCount5,
    required this.readinglogCount,
    required this.wantToReadCount,
    required this.currentlyReadingCount,
    required this.alreadyReadCount,
    required this.version,
    required this.lccSort,
    required this.authorFacet,
    required this.ddcSort,
  });

  factory BookOpenLibrary.fromJson(Map<String, dynamic> json) => BookOpenLibrary(
      authorAlternativeName: json["author_alternative_name"] == null
          ? []
          : List<String>.from(
              json["author_alternative_name"].map((x) => x.toString())),
      authorKey: json["author_key"] == null
          ? []
          : List<String>.from(json["author_key"].map((x) => x.toString())),
      authorName: json["author_name"] == null
          ? []
          : List<String>.from(json["author_name"].map((x) => x.toString())),
      contributor: json["contributor"] == null
          ? []
          : List<String>.from(json["contributor"].map((x) => x.toString())),
      coverEditionKey: json["cover_edition_key"] ?? '',
      coverI: json["cover_id"] ?? json["cover_i"] ?? 8569284,
      ddc: json["ddc"] == null
          ? []
          : List<String>.from(json["ddc"].map((x) => x.toString())),
      ebookAccess: json["ebook_access"] ?? '',
      ebookCountI: json["ebook_count_i"] ?? 0,
      editionCount: json["edition_count"] ?? 0,
      editionKey: json["edition_key"] == null
          ? []
          : List<String>.from(json["edition_key"].map((x) => x.toString())),
      firstPublishYear: json["first_publish_year"] ?? 0,
      firstSentence: json["first_sentence"] == null
          ? ['']
          : List<String>.from(json["first_sentence"].map((x) => x.toString())),
      hasFulltext: json["has_fulltext"] ?? false,
      isbn: json["isbn"] == null
          ? []
          : List<String>.from(json["isbn"].map((x) => x.toString())),
      key: json["key"] ?? '',
      language: json["language"] == null
          ? []
          : List<String>.from(json["language"].map((x) => x.toString())),
      lastModifiedI: json["last_modified_i"] ?? 0,
      lcc: json["lcc"] == null
          ? []
          : List<String>.from(json["lcc"].map((x) => x.toString())),
      lccn: json["lccn"] == null
          ? []
          : List<String>.from(json["lccn"].map((x) => x.toString())),
      lendingEditionS: json["lending_edition_s"] ?? '',
      lendingIdentifierS: json["lending_identifier_s"] ?? '',
      numberOfPagesMedian: json["number_of_pages_median"] ?? 0,
      oclc: json["oclc"] == null
          ? []
          : List<String>.from(json["oclc"].map((x) => x.toString())),
      publishDate: json["publish_date"] == null
          ? []
          : List<String>.from(json["publish_date"].map((x) => x.toString())),
      publishYear: json["publish_year"] == null
          ? []
          : List<int>.from(
              json["publish_year"].map((x) => int.parse(x.toString()))),
      publisher: json["publisher"] == null
          ? []
          : List<String>.from(json["publisher"].map((x) => x.toString())),
      title: json["title"] ?? '',
      titleSort: json["title_sort"] ?? '',
      titleSuggest: json["title_suggest"] ?? '',
      type: json["type"] ?? '',
      subject: json["subject"] == null ? [] : List<String>.from(json["subject"].map((x) => x.toString())),
      place: json["place"] == null ? [] : List<String>.from(json["place"].map((x) => x.toString())),
      time: json["time"] == null ? [] : List<String>.from(json["time"].map((x) => x.toString())),
      person: json["person"] == null ? [] : List<String>.from(json["person"].map((x) => x.toString())),
      ratingsAverage: json["ratings_average"]?.toDouble() ?? 0.0,
      ratingsSortable: json["ratings_sortable"]?.toDouble() ?? 0.0,
      ratingsCount: json["ratings_count"] ?? 1000000.34,
      ratingsCount1: json["ratings_count_1"] ?? 0,
      ratingsCount2: json["ratings_count_2"] ?? 0,
      ratingsCount3: json["ratings_count_3"] ?? 0,
      ratingsCount4: json["ratings_count_4"] ?? 0,
      ratingsCount5: json["ratings_count_5"] ?? 0,
      readinglogCount: json["readinglog_count"] ?? 0,
      wantToReadCount: json["want_to_read_count"] ?? 0,
      currentlyReadingCount: json["currently_reading_count"] ?? 0,
      alreadyReadCount: json["already_read_count"] ?? 0,
      version: json["_version_"]?.toDouble() ?? 0,
      lccSort: json["lcc_sort"] ?? '',
      authorFacet: json["author_facet"] == null ? [] : List<String>.from(json["author_facet"].map((x) => x)),
      ddcSort: json["ddc_sort"] ?? '');

  Map<String, dynamic> toJson() => {
        "author_alternative_name":
            List<dynamic>.from(authorAlternativeName.map((x) => x)),
        "author_key": List<dynamic>.from(authorKey.map((x) => x)),
        "author_name": List<dynamic>.from(authorName.map((x) => x)),
        "contributor": List<dynamic>.from(contributor.map((x) => x)),
        "cover_edition_key": coverEditionKey,
        "cover_i": coverI,
        "ddc": List<dynamic>.from(ddc.map((x) => x)),
        "ebook_access": ebookAccess,
        "ebook_count_i": ebookCountI,
        "edition_count": editionCount,
        "edition_key": List<dynamic>.from(editionKey.map((x) => x)),
        "first_publish_year": firstPublishYear,
        "first_sentence": List<dynamic>.from(firstSentence.map((x) => x)),
        "has_fulltext": hasFulltext,
        "isbn": List<dynamic>.from(isbn.map((x) => x)),
        "key": key,
        "language": List<dynamic>.from(language.map((x) => x)),
        "last_modified_i": lastModifiedI,
        "lcc": List<dynamic>.from(lcc.map((x) => x)),
        "lccn": List<dynamic>.from(lccn.map((x) => x)),
        "lending_edition_s": lendingEditionS,
        "lending_identifier_s": lendingIdentifierS,
        "number_of_pages_median": numberOfPagesMedian,
        "oclc": List<dynamic>.from(oclc.map((x) => x)),
        "publish_date": List<dynamic>.from(publishDate.map((x) => x)),
        "publish_year": List<dynamic>.from(publishYear.map((x) => x)),
        "publisher": List<dynamic>.from(publisher.map((x) => x)),
        "title": title,
        "title_sort": titleSort,
        "title_suggest": titleSuggest,
        "type": type,
        "subject": List<dynamic>.from(subject.map((x) => x)),
        "place": List<dynamic>.from(place.map((x) => x)),
        "time": List<dynamic>.from(time.map((x) => x)),
        "person": List<dynamic>.from(person.map((x) => x)),
        "ratings_average": ratingsAverage,
        "ratings_sortable": ratingsSortable,
        "ratings_count": ratingsCount,
        "ratings_count_1": ratingsCount1,
        "ratings_count_2": ratingsCount2,
        "ratings_count_3": ratingsCount3,
        "ratings_count_4": ratingsCount4,
        "ratings_count_5": ratingsCount5,
        "readinglog_count": readinglogCount,
        "want_to_read_count": wantToReadCount,
        "currently_reading_count": currentlyReadingCount,
        "already_read_count": alreadyReadCount,
        "_version_": version,
        "lcc_sort": lccSort,
        "author_facet": List<dynamic>.from(authorFacet.map((x) => x)),
        "ddc_sort": ddcSort,
      };
}
