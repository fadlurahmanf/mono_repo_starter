class GroupedItems<T> {
  final String key;
  List<T> items;

  GroupedItems({required this.key, this.items = const []});
}
