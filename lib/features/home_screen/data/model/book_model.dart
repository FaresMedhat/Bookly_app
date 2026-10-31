class BookModel {
  final String id;
  final String title;
  final List<String> authors;
  final List<String> categories;
  final String thumbnail;
  final num? averageRating;
  final int? ratingsCount;
  final String description;
  final String bookUrl;
  final bool isPdfAvailable;
  final String saleability;
  final String downloadLink;
  final String buyLink;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.thumbnail,
    this.averageRating,
    this.ratingsCount,
    required this.description,
    required this.bookUrl,
    required this.isPdfAvailable,
    required this.saleability,
    required this.downloadLink,
    required this.buyLink,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    // 1. الدخول الآمن جداً للكائنات الفرعية
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>? ?? {};
    final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>? ?? {};
    final categories = volumeInfo['categories'] as List<dynamic>? ?? [];
    final searchInfo = json['searchInfo'] as Map<String, dynamic>? ?? {};
    final accessInfo = json['accessInfo'] as Map<String, dynamic>? ?? {};
    final pdfInfo = accessInfo['pdf'] as Map<String, dynamic>? ?? {};
    final saleInfo = json['saleInfo'] as Map<String, dynamic>? ?? {};
    buyLink:
    saleInfo['buyLink']?.toString() ?? '';

    // 2. معالجة رابط الصورة
    String thumbnail = '';
    if (imageLinks['thumbnail'] != null) {
      thumbnail = imageLinks['thumbnail'].toString().replaceAll(
        'http:',
        'https:',
      );
    }

    // 3. معالجة قائمة المؤلفين
    List<String> parsedAuthors = ['Unknown Author'];
    if (volumeInfo['authors'] != null && volumeInfo['authors'] is List) {
      final List<String> authorsList = List<String>.from(volumeInfo['authors']);
      // 👈 التأكد أن القائمة ليست فارغة قبل اعتمادها
      if (authorsList.isNotEmpty) {
        parsedAuthors = authorsList;
      }
    }

    // 4. معالجة الوصف
    String safeDescription = 'No Description';
    if (volumeInfo['description'] != null) {
      safeDescription = volumeInfo['description'].toString();
    } else if (searchInfo['textSnippet'] != null) {
      safeDescription = searchInfo['textSnippet'].toString();
    }
    String bookUrl =
        volumeInfo['previewLink']?.toString() ??
        accessInfo['webReaderLink']?.toString() ??
        '';

    bool isPdfAvailable = pdfInfo['isAvailable'] as bool? ?? false;
    String downloadLink = pdfInfo['downloadLink']?.toString() ?? '';

    // 5. بناء الكائن النهائي بأمان تام
    return BookModel(
      id: json['id']?.toString() ?? '',
      title: volumeInfo['title']?.toString() ?? 'No Title',
      authors: parsedAuthors,
      categories: categories.map((e) => e.toString()).toList(),
      thumbnail: thumbnail,
      averageRating: volumeInfo['averageRating'] as num? ?? 0,
      ratingsCount: volumeInfo['ratingsCount'] as int? ?? 0,
      description: safeDescription,
      bookUrl: bookUrl,
      isPdfAvailable: isPdfAvailable,
      saleability: saleInfo['saleability']?.toString() ?? 'NOT_FOR_SALE',
      downloadLink: downloadLink,
      buyLink: saleInfo['buyLink']?.toString() ?? '',
    );
  }
}
