class AbfallEintarg {
  final int? id;
  final DateTime datum;
  final String typ;

  AbfallEintarg({
    this.id,
    required this.datum,
    required this.typ,
  });

  AbfallEintarg.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        datum = DateTime.parse(map['datum']),
        typ = map['typ'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'datum': datum,
      'typ': typ,
    };
  }
}
