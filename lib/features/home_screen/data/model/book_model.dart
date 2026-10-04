class BookModel {
  final String title;
  final List<String> authors;
  final int? publishYear;
  final int? coverId;
  final String ebookAccess;
  final bool hasFullText;
  final String? lendingIdentifier;

  BookModel({
    required this.title,
    required this.authors,
    this.publishYear,
    this.coverId,
    required this.ebookAccess,
    required this.hasFullText,
    this.lendingIdentifier,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] as String? ?? 'Unknown Title',
      // The JSON provides authors as a list, we safely cast and map it
      authors:
          (json['author_name'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          ['Unknown Author'],
      publishYear: json['first_publish_year'] as int?,
      coverId: json['cover_i'] as int?,
      ebookAccess: json['ebook_access'] as String? ?? 'no_ebook',
      hasFullText: json['has_fulltext'] as bool? ?? false,
      lendingIdentifier: json['lending_identifier_s'] as String?,
    );
  }

  // Domain logic embedded in the model for the UI to consume directly
  String get coverImageUrl {
    if (coverId != null) {
      return 'https://covers.openlibrary.org/b/id/$coverId-L.jpg';
    }
    return 'https://via.placeholder.com/150x200.png?text=No+Cover';
  }

  String? get readBookUrl {
    // Only borrowable books with an identifier get a reading link
    if (ebookAccess == 'borrowable' && lendingIdentifier != null) {
      return 'https://archive.org/details/$lendingIdentifier/mode/2up';
    }
    return null;
  }
}
