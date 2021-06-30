import 'dart:async';

import 'dart:ui';
import 'package:flutter/material.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World',
      theme: ThemeData(
        primarySwatch: Colors.cyan,

      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (Contex)=>Home()));}
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/9.png') ,
          Text('DSC World',style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,color: Colors.white)),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  bool isSwitched = false;
  Color Color_backGround =Colors.orange[50];
  Color Color_Words =Colors.black;
  Color Color_Bar =Colors.black;
  int index=0;


  List<Widget>_buildScreens
  =[HomeScreen(),
    Favouritescreen(),];




  @override
  Widget build(BuildContext context) {

    getColors.backGround=Color_backGround;
    getColors.word=Color_Words;


    return  Scaffold(
        backgroundColor: Color_backGround,

        appBar: AppBar(title: Text('continents',
          style: TextStyle(fontSize: 33.0,
              fontWeight: FontWeight.bold,
              color: Color_Words),),
          backgroundColor: Color_backGround,
          iconTheme: IconThemeData(color: Color_Words),
        ),


        body:_buildScreens [index],





        drawer: Drawer(

          child: Container(
            color: Color_backGround,
            child: ListView(
              children: [
                DrawerHeader(child: Expanded(
                  child: Icon(Icons.person, color: Color_Words,),)),
                ListTile(

                  title: Text(
                    'Dark Mode', style: TextStyle(color: Color_Words),),
                  trailing: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        if (value) {
                          Color_backGround = Colors.black;
                          Color_Words = Colors.white;
                        }
                        else {
                          Color_backGround = Colors.orange[50];
                          Color_Words = Colors.black;
                        }
                      });
                    },
                    activeTrackColor: Colors.blueGrey,
                    activeColor: Colors.blue,
                  ),)
              ],

            ),
          ),

        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color_Bar,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text("Home"), icon: Icon(Icons.home_outlined,),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text("Favourite"), icon: Icon(Icons.star_border,),
            ),
          ],

          currentIndex: index,
          onTap: (value) {
            setState(() {

              index = value;
            });
          },


        )

    );
  }


}






class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Column(
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () => {
                          getFunc.s= ("EU") ,
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => showList()),)},

                        child: Image.asset('images/1.jpg')),

                    InkWell(
                        onTap: () => {getFunc.s= ("AS"),
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => showList()),)},

                        child: Image.asset('images/2.jpg')),


                  ])),
          SizedBox(height: 10),
          Flexible(
              fit: FlexFit.tight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    InkWell(
                        onTap: () => {getFunc.s= ("AF"),
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => showList()),)},
                        child: Image.asset('images/3.jpg')),


                    InkWell(
                        onTap: () => {getFunc.s= ("SA"),
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => showList()),)},
                        child: Image.asset('images/4.jpg')),
                  ])),

          SizedBox(height: 10),
          Flexible(

              fit: FlexFit.tight,

              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () => {getFunc.s= ("NA"),
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => showList()),)},
                        child: Image.asset('images/5.jpg')),


                    InkWell(
                        onTap: () => {getFunc.s= ("OC"),
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => showList()),)},
                        child: Image.asset('images/6.jpg')),


                  ])
          ),
          SizedBox(height: 10),
          Flexible(
              fit: FlexFit.tight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () => {getFunc.s= ("AN"),
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => showList()),)},
                        child: Image.asset('images/7.jpg')),
                  ])),

        ],
      );
  }}



class Favouritescreen extends StatelessWidget {
  const Favouritescreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}










class showList extends  StatefulWidget {
  const showList({Key key}) : super(key: key);

  @override
  _showListState createState() => _showListState();
}

class _showListState extends State<showList> {
  List countriesLoaded=[];
  var jsonData= inti();
  void loadData() async{
    await jsonData.getCountriesData();
    setState(() {
      countriesLoaded=jsonData.continents;

    });
  }

  @override
  void initState(){
    super.initState();
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    String name;
    switch (getFunc.s){
      case "AF":{name="Africa";}break;
      case "AN":{name="Antarctica";}break;
      case "AS":{name="Asia";}break;
      case "EU":{name="Europe";}break;
      case "NA":{name="North America";}break;
      case "OC":{name="Oceania";}break;
      case "SA":{name="South America";}break;}


    bool fav=false;
    return Scaffold(
        backgroundColor: getColors.backGround,
        appBar: AppBar(backgroundColor: getColors.backGround,title: Text(name,style: TextStyle(color: getColors.word)),iconTheme: IconThemeData(color: getColors.word),
        ),

        body: new ListView.builder(
            itemCount: countriesLoaded.length,
            padding: EdgeInsets.all(15),
            itemBuilder: (BuildContext context, int index) {
              return new Column(
                children: <Widget>[
                  ListTile(
                    trailing:
                    IconButton(
                      icon: Icon(fav ?Icons.favorite:Icons.favorite_border,color: getColors.word,),
                      onPressed: (){

                      },

                    ),

                    title: Text(countriesLoaded[index],style: TextStyle(color: getColors.word),),


                  ),
                ],
              );
            }
        ));
  }



}





class  getFunc{
  static String s;

}

class getColors{
  static Color  backGround ;
  static Color word;

}





class inti {
  List countries = [];
  Map DetailsMap = {};
  List continents = [];
  Map  data= {};

  Future <void> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/data.json');
    data = await json.decode(jsonText);

  }


  Future <void> getCountriesData() async {

    await loadJsonData();
    String _continentName = getFunc.s;
    String x;
    countries.addAll(data["countries"].keys);

    for (int i = 0; i < countries.length; i++) {

      x = countries[i];
      if (data['countries'][x]["continent"] == _continentName)
        continents.add(data['countries'][x]['name']);


    }




  }

}
