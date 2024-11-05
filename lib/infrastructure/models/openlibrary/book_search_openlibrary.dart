// lib/domain/entities/book_open_library_search.dart

class BookOpenLibrarySearch {
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
  final List<String> format;
  final bool hasFulltext;
  final List<String> ia;
  final List<String> iaCollection;
  final String iaCollectionS;
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
  final int ospCount;
  final String printdisabledS;
  final bool publicScanB;
  final List<String> publishDate;
  final List<String> publishPlace;
  final List<int> publishYear;
  final List<String> publisher;
  final List<String> seed;
  final String subtitle;
  final String title;
  final String titleSort;
  final String titleSuggest;
  final String type;
  final List<String> idGoodreads;
  final List<String> idLibrarything;
  final List<String> idAmazon;
  final List<String> idBetterWorldBooks;
  final List<String> idStandardEbooks;
  final List<String> idOverdrive;
  final List<String> subject;
  final List<String> place;
  final List<String> time;
  final List<String> iaLoadedId;
  final List<String> iaBoxId;
  final double ratingsAverage;
  final double ratingsSortable;
  final int ratingsCount;
  final int ratingsCount1;
  final int ratingsCount2;
  final int ratingsCount3;
  final int ratingsCount4;
  final int ratingsCount5;
  final int readinglogCount;
  final int wantToReadCount;
  final int currentlyReadingCount;
  final int alreadyReadCount;
  final List<String> publisherFacet;
  final List<String> timeFacet;
  final List<String> placeKey;
  final List<String> subjectFacet;
  final double version;
  final List<String> placeFacet;
  final String lccSort;
  final List<String> authorFacet;
  final List<String> subjectKey;
  final String ddcSort;
  final List<String> timeKey;

  BookOpenLibrarySearch({
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
    required this.format,
    required this.hasFulltext,
    required this.ia,
    required this.iaCollection,
    required this.iaCollectionS,
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
    required this.ospCount,
    required this.printdisabledS,
    required this.publicScanB,
    required this.publishDate,
    required this.publishPlace,
    required this.publishYear,
    required this.publisher,
    required this.seed,
    required this.subtitle,
    required this.title,
    required this.titleSort,
    required this.titleSuggest,
    required this.type,
    required this.idGoodreads,
    required this.idLibrarything,
    required this.idAmazon,
    required this.idBetterWorldBooks,
    required this.idStandardEbooks,
    required this.idOverdrive,
    required this.subject,
    required this.place,
    required this.time,
    required this.iaLoadedId,
    required this.iaBoxId,
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
    required this.publisherFacet,
    required this.timeFacet,
    required this.placeKey,
    required this.subjectFacet,
    required this.version,
    required this.placeFacet,
    required this.lccSort,
    required this.authorFacet,
    required this.subjectKey,
    required this.ddcSort,
    required this.timeKey,
  });

  factory BookOpenLibrarySearch.fromJson(Map<String, dynamic> json) =>
      BookOpenLibrarySearch(
        authorAlternativeName: json["author_alternative_name"] != null
            ? List<String>.from(
                json["author_alternative_name"].map((x) => x.toString()))
            : [],
        authorKey: json["author_key"] != null
            ? List<String>.from(json["author_key"].map((x) => x.toString()))
            : [],
        authorName: json["author_name"] != null
            ? List<String>.from(json["author_name"].map((x) => x.toString()))
            : [],
        contributor: json["contributor"] != null
            ? List<String>.from(json["contributor"].map((x) => x.toString()))
            : [],
        coverEditionKey: json["cover_edition_key"] ?? '',
        coverI: json["cover_i"] ?? 0,
        ddc: json["ddc"] != null
            ? List<String>.from(json["ddc"].map((x) => x.toString()))
            : [],
        ebookAccess: json["ebook_access"] ?? '',
        ebookCountI: json["ebook_count_i"] ?? 0,
        editionCount: json["edition_count"] ?? 0,
        editionKey: json["edition_key"] != null
            ? List<String>.from(json["edition_key"].map((x) => x.toString()))
            : [],
        firstPublishYear: json["first_publish_year"] ?? 0,
        firstSentence: json["first_sentence"] != null
            ? List<String>.from(json["first_sentence"].map((x) => x.toString()))
            : [],
        format: json["format"] != null
            ? List<String>.from(json["format"].map((x) => x.toString()))
            : [],
        hasFulltext: json["has_fulltext"] ?? false,
        ia: json["ia"] != null
            ? List<String>.from(json["ia"].map((x) => x.toString()))
            : [],
        iaCollection: json["ia_collection"] != null
            ? List<String>.from(json["ia_collection"].map((x) => x.toString()))
            : [],
        iaCollectionS: json["ia_collection_s"] ?? '',
        isbn: json["isbn"] != null
            ? List<String>.from(json["isbn"].map((x) => x.toString()))
            : [],
        key: json["key"] ?? '',
        language: json["language"] != null
            ? List<String>.from(json["language"].map((x) => x.toString()))
            : [],
        lastModifiedI: json["last_modified_i"] ?? 0,
        lcc: json["lcc"] != null
            ? List<String>.from(json["lcc"].map((x) => x.toString()))
            : [],
        lccn: json["lccn"] != null
            ? List<String>.from(json["lccn"].map((x) => x.toString()))
            : [],
        lendingEditionS: json["lending_edition_s"] ?? '',
        lendingIdentifierS: json["lending_identifier_s"] ?? '',
        numberOfPagesMedian: json["number_of_pages_median"] ?? 0,
        oclc: json["oclc"] != null
            ? List<String>.from(json["oclc"].map((x) => x.toString()))
            : [],
        ospCount: json["osp_count"] ?? 0,
        printdisabledS: json["printdisabled_s"] ?? '',
        publicScanB: json["public_scan_b"] ?? false,
        publishDate: json["publish_date"] != null
            ? List<String>.from(json["publish_date"].map((x) => x.toString()))
            : [],
        publishPlace: json["publish_place"] != null
            ? List<String>.from(json["publish_place"].map((x) => x.toString()))
            : [],
        publishYear: json["publish_year"] != null
            ? List<int>.from(json["publish_year"].map((x) => x ?? 0))
            : [],
        publisher: json["publisher"] != null
            ? List<String>.from(json["publisher"].map((x) => x.toString()))
            : [],
        seed: json["seed"] != null
            ? List<String>.from(json["seed"].map((x) => x.toString()))
            : [],
        subtitle: json["subtitle"] ?? '',
        title: json["title"] ?? 'Sin título',
        titleSort: json["title_sort"] ?? '',
        titleSuggest: json["title_suggest"] ?? '',
        type: json["type"] ?? '',
        idGoodreads: json["id_goodreads"] != null
            ? List<String>.from(json["id_goodreads"].map((x) => x.toString()))
            : [],
        idLibrarything: json["id_librarything"] != null
            ? List<String>.from(
                json["id_librarything"].map((x) => x.toString()))
            : [],
        idAmazon: json["id_amazon"] != null
            ? List<String>.from(json["id_amazon"].map((x) => x.toString()))
            : [],
        idBetterWorldBooks: json["id_better_world_books"] != null
            ? List<String>.from(
                json["id_better_world_books"].map((x) => x.toString()))
            : [],
        idStandardEbooks: json["id_standard_ebooks"] != null
            ? List<String>.from(
                json["id_standard_ebooks"].map((x) => x.toString()))
            : [],
        idOverdrive: json["id_overdrive"] != null
            ? List<String>.from(json["id_overdrive"].map((x) => x.toString()))
            : [],
        subject: json["subject"] != null
            ? List<String>.from(json["subject"].map((x) => x.toString()))
            : [],
        place: json["place"] != null
            ? List<String>.from(json["place"].map((x) => x.toString()))
            : [],
        time: json["time"] != null
            ? List<String>.from(json["time"].map((x) => x.toString()))
            : [],
        iaLoadedId: json["ia_loaded_id"] != null
            ? List<String>.from(json["ia_loaded_id"].map((x) => x.toString()))
            : [],
        iaBoxId: json["ia_box_id"] != null
            ? List<String>.from(json["ia_box_id"].map((x) => x.toString()))
            : [],
        ratingsAverage: json["ratings_average"]?.toDouble() ?? 0.0,
        ratingsSortable: json["ratings_sortable"]?.toDouble() ?? 0.0,
        ratingsCount: json["ratings_count"] ?? 0,
        ratingsCount1: json["ratings_count_1"] ?? 0,
        ratingsCount2: json["ratings_count_2"] ?? 0,
        ratingsCount3: json["ratings_count_3"] ?? 0,
        ratingsCount4: json["ratings_count_4"] ?? 0,
        ratingsCount5: json["ratings_count_5"] ?? 0,
        readinglogCount: json["readinglog_count"] ?? 0,
        wantToReadCount: json["want_to_read_count"] ?? 0,
        currentlyReadingCount: json["currently_reading_count"] ?? 0,
        alreadyReadCount: json["already_read_count"] ?? 0,
        publisherFacet: json["publisher_facet"] != null
            ? List<String>.from(
                json["publisher_facet"].map((x) => x.toString()))
            : [],
        timeFacet: json["time_facet"] != null
            ? List<String>.from(json["time_facet"].map((x) => x.toString()))
            : [],
        placeKey: json["place_key"] != null
            ? List<String>.from(json["place_key"].map((x) => x.toString()))
            : [],
        subjectFacet: json["subject_facet"] != null
            ? List<String>.from(json["subject_facet"].map((x) => x.toString()))
            : [],
        version: json["_version_"]?.toDouble() ?? 0.0,
        placeFacet: json["place_facet"] != null
            ? List<String>.from(json["place_facet"].map((x) => x.toString()))
            : [],
        lccSort: json["lcc_sort"] ?? '',
        authorFacet: json["author_facet"] != null
            ? List<String>.from(json["author_facet"].map((x) => x.toString()))
            : [],
        subjectKey: json["subject_key"] != null
            ? List<String>.from(json["subject_key"].map((x) => x.toString()))
            : [],
        ddcSort: json["ddc_sort"] ?? '',
        timeKey: json["time_key"] != null
            ? List<String>.from(json["time_key"].map((x) => x.toString()))
            : [],
      );

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
        "format": List<dynamic>.from(format.map((x) => x)),
        "has_fulltext": hasFulltext,
        "ia": List<dynamic>.from(ia.map((x) => x)),
        "ia_collection": List<dynamic>.from(iaCollection.map((x) => x)),
        "ia_collection_s": iaCollectionS,
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
        "osp_count": ospCount,
        "printdisabled_s": printdisabledS,
        "public_scan_b": publicScanB,
        "publish_date": List<dynamic>.from(publishDate.map((x) => x)),
        "publish_place": List<dynamic>.from(publishPlace.map((x) => x)),
        "publish_year": List<dynamic>.from(publishYear.map((x) => x)),
        "publisher": List<dynamic>.from(publisher.map((x) => x)),
        "seed": List<dynamic>.from(seed.map((x) => x)),
        "subtitle": subtitle,
        "title": title,
        "title_sort": titleSort,
        "title_suggest": titleSuggest,
        "type": type,
        "id_goodreads": List<dynamic>.from(idGoodreads.map((x) => x)),
        "id_librarything": List<dynamic>.from(idLibrarything.map((x) => x)),
        "id_amazon": List<dynamic>.from(idAmazon.map((x) => x)),
        "id_better_world_books":
            List<dynamic>.from(idBetterWorldBooks.map((x) => x)),
        "id_standard_ebooks":
            List<dynamic>.from(idStandardEbooks.map((x) => x)),
        "id_overdrive": List<dynamic>.from(idOverdrive.map((x) => x)),
        "subject": List<dynamic>.from(subject.map((x) => x)),
        "place": List<dynamic>.from(place.map((x) => x)),
        "time": List<dynamic>.from(time.map((x) => x)),
        "ia_loaded_id": List<dynamic>.from(iaLoadedId.map((x) => x)),
        "ia_box_id": List<dynamic>.from(iaBoxId.map((x) => x)),
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
        "publisher_facet": List<dynamic>.from(publisherFacet.map((x) => x)),
        "time_facet": List<dynamic>.from(timeFacet.map((x) => x)),
        "place_key": List<dynamic>.from(placeKey.map((x) => x)),
        "subject_facet": List<dynamic>.from(subjectFacet.map((x) => x)),
        "_version_": version,
        "place_facet": List<dynamic>.from(placeFacet.map((x) => x)),
        "lcc_sort": lccSort,
        "author_facet": List<dynamic>.from(authorFacet.map((x) => x)),
        "subject_key": List<dynamic>.from(subjectKey.map((x) => x)),
        "ddc_sort": ddcSort,
        "time_key": List<dynamic>.from(timeKey.map((x) => x)),
      };
}
