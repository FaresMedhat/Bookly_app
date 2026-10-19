import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'newest_book_cubit_state.dart';

class NewestBookCubitCubit extends Cubit<NewestBookCubitState> {
  NewestBookCubitCubit() : super(NewestBookCubitInitial());
}
