import 'package:big_form_app/models/option.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_state.dart';

class FormCubit extends Cubit<MyFormState> {
  FormCubit() : super(MyFormState.initial());

  void onSelectedItemChanged({required int id, String? newValue}) {
    // generate new list with updated value
    final List<Option> newItems = state.items.map((e) {
      if (e.id == id) {
        return e.copyWith(value: newValue);
      }
      return e;
    }).toList();

    emit(state.copyWith(items: newItems));
  }

  void loadItems() {
    emit(state.copyWith(items: [
      Option(id: 1, name: 'Option 1'),
      Option(id: 2, name: 'Option 2'),
    ]));
  }
}
