part of 'form_cubit.dart';

class MyFormState extends Equatable {
  final List<Option> items;
  final Option selectedItem;

  const MyFormState({
    required this.items,
    required this.selectedItem,
  });

  factory MyFormState.initial() {
    return MyFormState(
      items: const [],
      selectedItem: Option(id: 00, name: 'Select an item'),
    );
  }

  @override
  List<Object> get props => [items, selectedItem];

  MyFormState copyWith({
    List<Option>? items,
    Option? selectedItem,
  }) {
    return MyFormState(
      items: items ?? this.items,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }
}
