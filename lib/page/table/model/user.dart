class User {
  final String Nomdossier;
  final String NomUser;
  final String date;

  const User({
    required this.Nomdossier,
    required this.NomUser,
    required this.date,
  });

  User copy({
    String? Nomdossier,
    String? NomUser,
    String? date,
  }) =>
      User(
        Nomdossier: Nomdossier ?? this.Nomdossier,
        NomUser: NomUser ?? this.NomUser,
        date: date ?? this.date,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          Nomdossier == other.Nomdossier &&
          NomUser == other.NomUser &&
          date == other.date;

  @override
  int get hashCode => Nomdossier.hashCode ^ NomUser.hashCode ^ date.hashCode;
}
