import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:homePage(),
      ));
}

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Map<String,String>> profile=[];
  var namevalue=TextEditingController();
  var agevalue=TextEditingController();
  var emailvalue=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:
      AppBar(
        title: Center(
          child: Text(
              'Create Your Profile', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 30)),
        ),
        backgroundColor: Colors.brown,
      ),
      // Added SingleChildScrollView here to make content scrollable when keyboard appears
      body: SingleChildScrollView(
        child: Container(
          // Removed fixed height to prevent overflow
          width: screenWidth,
          child: Column(
            children: [
              Row(
                children: [
                  Text('Enter Your name',style: TextStyle(color: Colors.deepPurple,fontWeight:FontWeight.w800,fontStyle:FontStyle.italic,fontSize: 20),),
                  SizedBox(width: 0.05*screenWidth),
                  Container(
                    padding: EdgeInsets.only(top: 0.005*screenHeight),
                    width: 0.50*screenWidth,
                    height: 0.04*screenHeight,
                    child: TextField(
                      controller: namevalue,
                      decoration: InputDecoration(

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            ),
                          )
                      ),
                    ),),
                ],
              ),

              Row(
                children: [
                  Text('Enter Your Age',style: TextStyle(color: Colors.deepPurple,fontWeight:FontWeight.w800,fontStyle:FontStyle.italic,fontSize: 20),),
                  SizedBox(width: 0.09*screenWidth),
                  Container(
                    padding: EdgeInsets.only(top: 0.005*screenHeight),
                    width: 0.50*screenWidth,
                    height: 0.04*screenHeight,
                    child: TextField(
                      controller: agevalue,
                      decoration: InputDecoration(

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            ),
                          )
                      ),
                    ),),
                ],
              ),
              Row(
                children: [
                  Text('Enter Your email',style: TextStyle(color: Colors.deepPurple,fontWeight:FontWeight.w800,fontStyle:FontStyle.italic,fontSize: 20),),
                  SizedBox(width: 0.05*screenWidth),
                  Container(
                    padding: EdgeInsets.only(top: 0.005*screenHeight),
                    width: 0.50*screenWidth,
                    height: 0.04*screenHeight,
                    child: TextField(
                      controller: emailvalue,
                      decoration: InputDecoration(

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            ),
                          )
                      ),
                    ),),
                ],
              ),
              Container(
                height: 0.06*screenHeight,
                width: 0.20*screenWidth,

                padding: EdgeInsets.only(top: 0.02*screenHeight),
                child: Row(
                  children: [
                    Container(
                      height: 0.20*screenHeight,
                      width: 0.20*screenWidth,
                      child: FloatingActionButton(onPressed: (){
                        setState(() {
                          profile.add({
                            "name":namevalue.text,
                            "email":emailvalue.text,
                            "age":agevalue.text
                          });

                          namevalue.text='';
                          agevalue.text='';
                          emailvalue.text='';
                        });
                      },
                        child: Text('Create',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 19),),
                        backgroundColor: Colors.indigo,),
                    )
                  ],
                ),
              ),
              Container(
                // Changed this to use a fixed height that will work with the ListView
                height: 300,
                width: screenWidth,
                child: Column(
                  children: [
                    Container(
                      height: 0.10*screenHeight,
                      width: 0.80*screenHeight,

                      padding: EdgeInsets.only(top: 0.05*screenHeight),
                      child: Text('Profiles',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 28,color: Colors.purple),),
                    ),

                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) =>
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow,width: 5),
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.indigo,
                              ),
                              margin: EdgeInsets.only(top: 0.03*screenHeight),
                              height:0.15*screenHeight,
                              width: 0.80*screenWidth,

                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Text('Name:  ${profile[index]["name"]}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20),),
                                      Text('Age:  ${profile[index]["age"]}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20)),
                                      Text('Email:  ${profile[index]["email"]}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        itemCount: profile.length,
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }}
