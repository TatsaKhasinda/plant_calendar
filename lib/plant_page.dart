import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class PlantPage extends StatefulWidget {
  const PlantPage({Key? key}) : super(key: key);

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  /*Future<List<dynamic>> getData() async {
    final response = await http
        .get(Uri.parse("http://10.0.2.2/plant_calendar/get_plant.php"));
    return json.decode(response.body);
  }*/

  Future<List<dynamic>> getData() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2/plant_calendar/get.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('PLANT CALENDAR'),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox.shrink(); //<---here
          } else {
            if (snapshot.hasData) {
              return ItemList(list: snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<dynamic> list;
  const ItemList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    if (list != null) {
      return Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Text(
                      'Plant',
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, '/read_plant_page',
                        arguments: list[index]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          constraints:
                              BoxConstraints(maxHeight: 150, maxWidth: 150),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                  top: BorderSide(
                                    color: Colors.green,
                                  ),
                                  right: BorderSide(color: Colors.green),
                                  left: BorderSide(color: Colors.green),
                                  bottom: BorderSide(color: Colors.green))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 100,
                                  width: 150,
                                  child: Image.network(
                                      '${list[index]['gambar']}')),
                              Text(
                                list[index]['plant_name'],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return Text('no data');
    }
  }
}
