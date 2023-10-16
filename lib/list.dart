import 'package:flutter/material.dart';
import 'package:nasa_api_connection/api.dart';
import 'package:nasa_api_connection/detalles.dart';
import 'package:nasa_api_connection/items.dart';
class SimpleApiNasaScreen extends StatefulWidget {
  @override
  _SimpleApiNasaScreenState createState() => _SimpleApiNasaScreenState();
}

class _SimpleApiNasaScreenState extends State<SimpleApiNasaScreen> {
  late Future<List<NasaItem>> items;

  @override
  void initState() {
    super.initState();
    items = ApiService().searchNasaItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagenes'),
      ),
      body: FutureBuilder<List<NasaItem>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsApiNasaScreen(item: snapshot.data![index])),
    );
  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}