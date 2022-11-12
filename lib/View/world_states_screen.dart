
import 'package:covid_tracker_app/View/country_list_screen.dart';
import 'package:covid_tracker_app/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../models/world_states_model.dart';


class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
  )..repeat();

  Map<String, double> dataMap = {
    "Recover": 6,
    "Affected": 3,
    "death": 1,
  };

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  final colorList = <Color> [
   Colors.blue,
    Colors.green,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
             FutureBuilder(
               future: statesServices.fetchWorldStatesRecord(),
                 builder: (context,AsyncSnapshot<dynamic> snapshot){
                   print('The data in world statescreen is ${snapshot.data}');
                   if(!snapshot.hasData){
                     return Expanded(
                         child: SpinKitFadingCircle(
                           controller: _controller,
                           color: Colors.white,
                           size: 50,
                         )
                     );
                   }else{
                     return Column(
                       children: [
                         PieChart(
                           dataMap: {
                             'Total' :  double.parse(snapshot.data!.cases.toString()),
                             'Recover' : double.parse(snapshot.data!.recovered.toString()),
                             'Deaths' :  double.parse(snapshot.data.deaths.toString())
                           },
                           chartValuesOptions: ChartValuesOptions(
                             showChartValuesInPercentage: true
                           ),
                           chartRadius: MediaQuery.of(context).size.width / 3.2,
                           legendOptions: LegendOptions(
                             legendPosition: LegendPosition.left,
                           ),
                           animationDuration: Duration(microseconds: 1200),
                           chartType: ChartType.ring,
                           colorList: colorList,
                         ),

                         Padding(
                           padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.06),
                           child: Card(
                             child: Column(
                               children: [
                                 ReusableRow(text: 'Total', value: snapshot.data!.cases.toString()),
                                 ReusableRow(text: 'Recoverd', value: snapshot.data!.recovered.toString()),
                                 ReusableRow(text: 'Deaths', value: snapshot.data!.deaths.toString()),
                                 ReusableRow(text: 'Active', value: snapshot.data!.active.toString()),
                                 ReusableRow(text: 'Critical', value: snapshot.data!.critical.toString()),
                                 ReusableRow(text: 'Today Deaths', value: snapshot.data!.todayDeaths.toString()),
                                 ReusableRow(text: 'Today Recovered', value: snapshot.data!.todayRecovered.toString()),

                               ],
                             ),
                           ),
                         ),

                         GestureDetector(
                           onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context)=>CountryListScreen()));
                   },
                           child: Container(
                             height: 50,
                             decoration: BoxDecoration(
                               color: Colors.green,
                               borderRadius: BorderRadius.circular(10),
                             ),
                             child: Center(
                               child: Text('Track Countries'),
                             ),
                           ),
                         )
                       ],
                     );

                   }

                 }),


            ],
          ),
        ),
      ),

    );
  }
}

class ReusableRow extends StatelessWidget {
   ReusableRow({Key? key, required this.text,required this.value}) : super(key: key);

  String text;
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Text(value),
            ],
          ),
          SizedBox(height: 5,),
          Divider()
        ],
      ),
    );
  }
}

