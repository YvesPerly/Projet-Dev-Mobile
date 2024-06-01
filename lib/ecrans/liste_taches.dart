import 'package:flutter/material.dart';
import 'package:task_manager/models/tache.dart';

class EcranListeTaches extends StatefulWidget {
  @override
  _EcranListeTachesState createState() => _EcranListeTachesState();
}

class _EcranListeTachesState extends State<EcranListeTaches> {
  List<Tache> taches = [];
  String filtre = 'Tous';

  @override
  Widget build(BuildContext context) {
    List<Tache> tachesFiltres = filtre == 'Tous'
        ? taches
        : taches.where((tache) => tache.statut == filtre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des tâches',
            style: Theme.of(context).textTheme.headline1),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              setState(() {
                filtre = result;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Tous',
                child: Text('Tous'),
              ),
              const PopupMenuItem<String>(
                value: 'Todo',
                child: Text('Todo'),
              ),
              const PopupMenuItem<String>(
                value: 'In progress',
                child: Text('In progress'),
              ),
              const PopupMenuItem<String>(
                value: 'Done',
                child: Text('Done'),
              ),
              const PopupMenuItem<String>(
                value: 'Finish',
                child: Text('Finish'),
              ),
              const PopupMenuItem<String>(
                value: 'Bug',
                child: Text('Bug'),
              ),
            ],
          ),
        ],
      ),
      body: tachesFiltres.isEmpty
          ? Center(
              child: Text(
                'Aucune tâche disponible',
                style: Theme.of(context).textTheme.headline2,
              ),
            )
          : ListView.builder(
              itemCount: tachesFiltres.length,
              itemBuilder: (context, index) {
                Tache tache = tachesFiltres[index];
                return ListTile(
                  title: Text(tache.titre,
                      style: Theme.of(context).textTheme.headline3),
                  tileColor: getStatusColor(tache.statut).withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: getStatusColor(tache.statut), width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      '/modification',
                      arguments: tache,
                    );
                    if (result != null) {
                      setState(() {
                        taches[index] = result as Tache;
                      });
                    }
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/ajout');
          if (result != null) {
            setState(() {
              taches.add(result as Tache);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Fonction pour obtenir la couleur en fonction du statut
  Color getStatusColor(String statut) {
    switch (statut) {
      case 'Todo':
        return Color(0xFF333333);
      case 'In progress':
        return Color(0xFF4F4F4F);
      case 'Done':
        return Color(0xFF56CCF2);
      case 'Finish':
        return Color(0xFF27AE60);
      case 'Bug':
        return Color(0xFFEB5757);
      default:
        return Colors.black;
    }
  }
}
