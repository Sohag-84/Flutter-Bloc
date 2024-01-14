// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String name;
  final DateTime createdAt;

  Todo({required this.name, required this.createdAt});

  @override
  String toString() => 'Todo(name: $name, createdAt: $createdAt)';

  Todo copyWith({
    String? name,
    DateTime? createdAt,
  }) {
    return Todo(
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
