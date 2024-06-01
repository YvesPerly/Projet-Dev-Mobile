import 'package:flutter/material.dart';
import 'package:task_manager/models/tache.dart';

class EcranAjoutTache extends StatefulWidget {
  @override
  _EcranAjoutTacheState createState() => _EcranAjoutTacheState();
}

class _EcranAjoutTacheState extends State<EcranAjoutTache> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _contenuController = TextEditingController();
  String _statut = 'Todo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une tâche',
            style: Theme.of(context).textTheme.headline1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titreController,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
            TextField(
              controller: _contenuController,
              decoration: InputDecoration(labelText: 'Contenu'),
            ),
            DropdownButton<String>(
              value: _statut,
              onChanged: (String? newValue) {
                setState(() {
                  _statut = newValue!;
                });
              },
              items: <String>['Todo', 'In progress', 'Done', 'Finish', 'Bug']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newTache = Tache(
                  titre: _titreController.text,
                  contenu: _contenuController.text,
                  statut: _statut,
                );
                Navigator.pop(context, newTache);
              },
              child:
                  Text('Ajouter', style: Theme.of(context).textTheme.headline2),
            ),
          ],
        ),
      ),
    );
  }
}
