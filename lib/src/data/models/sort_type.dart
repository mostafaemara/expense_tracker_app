enum SortType {
  newest({"sort_date": "desc"}),
  oldest({"sort_date": "asc"}),
  highest({"sort_amount": "desc"}),
  lowest({"sort_amount": "asc"});

  final Map<String, dynamic> value;

  const SortType(this.value);
}
