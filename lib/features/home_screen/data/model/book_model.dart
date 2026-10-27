class BookModel {
  final String id;
  final String title;
  final List<String> authors;
  final String coverImageUrl;
  final num? averageRating;
  final int? ratingsCount;
  final String? description;
  // 👈 1. أضفنا المتغير الجديد الخاص برابط الكتاب
  final String bookUrl;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.coverImageUrl,
    this.averageRating,
    this.ratingsCount,
    this.description,
    // 👈 2. أضفناه في الـ Constructor
    required this.bookUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final imageLinks = volumeInfo['imageLinks'] ?? {};
    final searchInfo = json['searchInfo'] ?? {};
    // 👈 3. جلب كائن الـ accessInfo
    final accessInfo = json['accessInfo'] ?? {};

    String thumbnail = imageLinks['thumbnail'] ?? '';
    thumbnail = thumbnail.replaceAll('http:', 'https:');

    List<String> parsedAuthors = [];
    if (volumeInfo['authors'] != null) {
      parsedAuthors = List<String>.from(volumeInfo['authors']);
    } else {
      parsedAuthors = ['Unknown Author'];
    }

    return BookModel(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'No Title',
      authors: parsedAuthors,
      coverImageUrl: thumbnail,
      averageRating: volumeInfo['averageRating'] ?? 0,
      ratingsCount: volumeInfo['ratingsCount'] ?? 0,
      description:
          volumeInfo['description'] ??
          searchInfo['textSnippet'] ??
          'No Description',

      // 👈 4. جلب رابط الكتاب (نفضل رابط المعاينة previewLink، وإن لم يوجد نأخذ رابط القراءة webReaderLink)
      bookUrl: volumeInfo['previewLink'] ?? accessInfo['webReaderLink'] ?? '',
    );
  }
}
