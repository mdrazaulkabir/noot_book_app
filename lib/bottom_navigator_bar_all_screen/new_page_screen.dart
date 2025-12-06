import 'package:flutter/material.dart';

class NewPageScreen extends StatefulWidget {
  const NewPageScreen({super.key});

  @override
  State<NewPageScreen> createState() => _NewPageScreenState();
}

class _NewPageScreenState extends State<NewPageScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height:size.height*.1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context,index){
                  return Container(
                    color: Colors.greenAccent,
                    height: size.height*.1,
                    width: size.width*.2,
                    margin: EdgeInsets.all(10),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${index}",style: TextStyle(color: Colors.black),),
                        Text("New",style: TextStyle(color: Colors.black),),
                      ],
                    )),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 14,
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text("Title",style: TextStyle(fontSize:20, color: Colors.black),),
                          Text("Description",style: TextStyle(fontSize:12, color: Colors.grey),),
                          Text("Date: 02/12/2025",style: TextStyle(fontSize:12, color: Colors.grey,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Chip(label: Text('New'),
                                backgroundColor: Colors.greenAccent,
                                elevation: 10,
                              ),
                              Spacer(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.greenAccent,)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever,color: Colors.redAccent,))

                            ],
                          )
                        ],

                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
