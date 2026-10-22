class BookModel {
  final int id;
  final String title;
  final List<String> authors;
  final List<String> summaries;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final String coverImageUrl;
  final String? readOnlineUrl;
  final String? downloadEpubUrl;
  final int downloadCount;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.coverImageUrl,
    this.readOnlineUrl,
    this.downloadEpubUrl,
    required this.downloadCount,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    // 1. استخراج الروابط (Formats) بأمان
    final formats = json['formats'] as Map<String, dynamic>? ?? {};

    // 2. استخراج أسماء المؤلفين
    final List<dynamic> authorsList = json['authors'] ?? [];
    final List<String> parsedAuthors = authorsList
        .map((author) => author['name']?.toString() ?? 'Unknown Author')
        .toList();

    // 3. استخراج القوائم الإضافية (الملخصات، التصنيفات، اللغات) بأمان
    final List<String> parsedSummaries =
        (json['summaries'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final List<String> parsedSubjects =
        (json['subjects'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final List<String> parsedBookshelves =
        (json['bookshelves'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final List<String> parsedLanguages =
        (json['languages'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    return BookModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? 'Unknown Title',
      authors: parsedAuthors.isNotEmpty ? parsedAuthors : ['Unknown Author'],
      summaries: parsedSummaries,
      subjects: parsedSubjects,
      bookshelves: parsedBookshelves,
      languages: parsedLanguages,

      // 4. جلب رابط الصورة، وإذا لم يوجد نضع صورة بديلة
      coverImageUrl:
          formats['image/jpeg'] as String? ??
          'https://via.placeholder.com/150x220.png?text=No+Cover',

      // 5. جلب روابط القراءة والتحميل
      readOnlineUrl: formats['text/html'] as String?,
      downloadEpubUrl: formats['application/epub+zip'] as String?,

      downloadCount: json['download_count'] as int? ?? 0,
    );
  }
}
