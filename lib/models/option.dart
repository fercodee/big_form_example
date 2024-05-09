class Option {
  final int id;
  final String name;
  List<String> values;
  final String value;

  Option({
    required this.id,
    required this.name,
    this.value = '',
    this.values = const ['Value 1', 'Value 2', 'Value 3'],
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }

  Option copyWith({
    int? id,
    String? name,
    List<String>? values,
    String? value,
  }) {
    return Option(
      id: id ?? this.id,
      name: name ?? this.name,
      values: values ?? this.values,
      value: value ?? this.value,
    );
  }
}
