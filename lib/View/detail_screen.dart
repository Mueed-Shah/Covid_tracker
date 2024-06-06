import 'package:covid_tracker/View/world_state.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final int totalCases, totalDeaths, totalRecovered, active, critical,test;

  const DetailScreen({
    required this.image,
    required this.name,
    required this.active,
  required this.totalCases,
  required this.totalDeaths,
  required this.critical,
  required this.test,
  required this.totalRecovered,


  super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.name),),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Card(
                child: Column(
                  children: [
                    ReUsableRow(title: 'Cases', value: widget.totalCases.toString()),
                    ReUsableRow(title: 'Recovered', value: widget.totalRecovered.toString()),
                    ReUsableRow(title: 'Death', value: widget.totalDeaths.toString()),
                    ReUsableRow(title: 'Critical', value: widget.critical.toString()),
                    ReUsableRow(title: 'Today Recovered', value: widget.totalRecovered.toString()),
                  ],
                ),
              ),
            ),
Align(
alignment: Alignment.topCenter,
child: CircleAvatar(

  backgroundImage: NetworkImage(widget.image),
  radius: 50,
    ))

          ],
        )

      ],
    )
    );
  }
}
