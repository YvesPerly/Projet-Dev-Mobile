import 'package:flutter/material.dart';
import 'package:task_manager/models/tache.dart';

class EcranModificationTache extends StatefulWidget {
  @override
  _EcranModificationTacheState createState() => _EcranModificationTacheState();
}

class _EcranModificationTacheState extends State<EcranModificationTache> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _contenuController = TextEditingController();
  String _statut = 'Todo';

  @override
  Widget build(BuildContext context) {
    // Récupération de la tâche à modifier à partir des arguments de la route
    final Tache tache = ModalRoute.of(context)!.settings.arguments as Tache;
    _titreController.text = tache.titre;
    _contenuController.text = tache.contenu;
    _statut = tache.statut;

    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier une tâche',
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
                // Mise à jour de la tâche avec les nouvelles valeurs
                final tacheModifiee = Tache(
                  titre: _titreController.text,
                  contenu: _contenuController.text,
                  statut: _statut,
                );
                Navigator.pop(context, tacheModifiee);
              },
              child: Text('Enregistrer',
                  style: Theme.of(context).textTheme.headline2),
            ),
          ],
        ),
      ),
    );
  }
}
