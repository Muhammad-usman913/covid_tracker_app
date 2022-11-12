import 'dart:convert';


import 'package:covid_tracker_app/View/detail_screen.dart';
import 'package:covid_tracker_app/models/country_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/states_services.dart';
import 'package:shimmer/shimmer.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  StatesServices statesServices = StatesServices();


  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statesServices.getAllCountry();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Country'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: (value){
                setState(() {

                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search with country name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0)
                )
              ),
            ),
          ),
         Expanded(
           child: FutureBuilder(
               future: statesServices.getAllCountry(),
               builder: (context,AsyncSnapshot<List<CountryList>> snapshot){
                 print('The is snapshot is ${snapshot.data}');
                 if(!snapshot.hasData){
                   return ListView.builder(
                       itemCount: statesServices.countryList.length,
                       itemBuilder: (context,index){
                         return Shimmer.fromColors(
                           baseColor: Colors.grey.shade700,
                           highlightColor: Colors.grey.shade100,
                           child: Column(
                             children: [
                               ListTile(
                                 title: Container(height: 10,width: 89,color: Colors.white,),
                                 subtitle: Container(height: 10,width: 89,color: Colors.white,),
                                 leading: Container(height: 50,width: 50,color: Colors.white,)
                               ),
                             ],
                           ),
                         );
                       });
                 }else{
                   return ListView.builder(
                       itemCount: statesServices.countryList.length,
                       itemBuilder: (context,index){
                         String? name = snapshot.data![index].country;
                         if(_controller.text.isEmpty){
                           return Column(
                             children: [
                               InkWell(
                                 onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                  name: snapshot.data![index].country,
                                  active: snapshot.data![index].active,
                                  totalCases: snapshot.data![index].cases,
                                  todayRecovered: snapshot.data![index].todayRecovered,
                                  totalDeaths: snapshot.data![index].deaths,
                                  test: snapshot.data![index].tests,
                                  critical: snapshot.data![index].critical,
                                  image: snapshot.data![index].countryInfo!.flag,
                                  totalRecovered: snapshot.data![index].recovered,
                                )));
                           },
                                 child: ListTile(
                                   title: Text(snapshot.data![index].country!),
                                   subtitle: Text(snapshot.data![index].cases.toString()),
                                   leading: Image(
                                     height: 50,
                                     width: 50,
                                     image: NetworkImage(snapshot.data![index].countryInfo!.flag.toString()),
                                   ),
                                 ),
                               ),
                             ],
                           );
                         }else if(name!.toLowerCase().contains(_controller.text.toLowerCase())){
                           return Column(
                             children: [
                               InkWell(
                                 onTap : (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                     name: snapshot.data![index].country,
                                     active: snapshot.data![index].active,
                                     totalCases: snapshot.data![index].cases,
                                     todayRecovered: snapshot.data![index].todayRecovered,
                                     totalDeaths: snapshot.data![index].deaths,
                                     test: snapshot.data![index].tests,
                                     critical: snapshot.data![index].critical,
                                     image: snapshot.data![index].countryInfo!.flag,
                                     totalRecovered: snapshot.data![index].recovered,
                                   )));
                           },
                                 child: ListTile(
                                     title: Text(snapshot.data![index].country!),
                                   subtitle: Text(snapshot.data![index].cases.toString()),
                                   leading: Image(
                                     height: 50,
                                     width: 50,
                                     image: NetworkImage(snapshot.data![index].countryInfo!.flag.toString()),
                                   ),
                                 ),
                               ),
                             ],
                           );
                         }else{
                          return Container();
                         }

                       });
                 }

               }),
         )
        ],
      ),
    );
  }
}
