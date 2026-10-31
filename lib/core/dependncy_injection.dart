import 'package:bookly_app/core/utils/services/api_services.dart';
import 'package:bookly_app/features/home_screen/data/reposiories/home_repository_impl.dart';
import 'package:bookly_app/features/search_screen/data/repositories/search_repositoy_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HomeRepositoryImpl>(
    HomeRepositoryImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepositoyImpl>(
    SearchRepositoyImpl(apiService: getIt.get<ApiService>()),
  );
}
