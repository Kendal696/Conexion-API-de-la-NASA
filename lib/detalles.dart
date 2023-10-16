import 'package:flutter/material.dart';
import 'package:nasa_api_connection/nasa_item.dart';
import 'api_service.dart';

class DetailsApiNasaScreen extends StatelessWidget {
  final NasaItem item;

  DetailsApiNasaScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${item.title}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                SizedBox(height: 16),
                if (item.imageUrl != null) 
                  Padding(
                    
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Image.network(item.imageUrl!, fit: BoxFit.cover),
                  ),
                SizedBox(height: 16),
                Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('${item.description}'),
                SizedBox(height: 16),
                Text('Date Created:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('${item.dateCreated}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}