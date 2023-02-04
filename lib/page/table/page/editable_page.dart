
import 'package:flutter/material.dart';

import '../data/users.dart';
import '../model/user.dart';
import '../utils.dart';
import '../widget/scrollable_widget.dart';
import '../widget/text_dialog_widget.dart';


class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ScrollableWidget(child: buildDataTable()),
  );

  Widget buildDataTable() {
    final columns = ['Nom doissier', 'Nom utilisateur', "Date d'ajout"];
    //entête du tableau

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<User> users) => users.map((User user) {
    final cells = [user.Nomdossier, user.NomUser, user.date];

    return DataRow(
      cells: Utils.modelBuilder(cells, (index, cell) {
        final showEditIcon = index == 0 || index == 1;

        return DataCell(
          Text('$cell'),
          showEditIcon: showEditIcon,
          onTap: () {
            switch (index) {
              case 0:
                editFirstName(user);
                break;
              case 1:
                editLastName(user);
                break;
            }
          },
        );
      }),
    );
  }).toList();

  Future editFirstName(User editUser) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change nom Dossier',
      value: editUser.Nomdossier,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(Nomdossier: firstName) : user;
    }).toList());
  }

  Future editLastName(User editUser) async {
    final lastName = await showTextDialog(
      context,
      title: 'Changer nom utilisateur',
      value: editUser.NomUser,
    );

    setState(() => users = users.map((user) {
      final isEditedUser = user == editUser;

      return isEditedUser ? user.copy(NomUser: lastName) : user;
    }).toList());
  }
}
