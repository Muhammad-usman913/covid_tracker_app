import 'package:covid_tracker_app/View/world_states_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(
      {Key? key,
      required this.name,
      required this.todayRecovered,
      required this.critical,
      required this.active,
      required this.image,
      required this.test,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered})
      : super(key: key);

  String? name;
  String? image;
  int? totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.06,),
                      ReusableRow(text: 'Total Cases', value: widget.totalCases.toString()),
                      ReusableRow(text: 'Today Recovered ', value: widget.todayRecovered.toString()),
                      ReusableRow(text: 'Total Deaths', value: widget.totalDeaths.toString()),
                      ReusableRow(text: 'Test', value: widget.test.toString()),
                      ReusableRow(text: 'Critical', value: widget.critical.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image!),
              )
            ],
          )
        ],
      ),
    );
  }
}
