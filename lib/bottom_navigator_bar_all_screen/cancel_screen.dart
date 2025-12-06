import 'package:flutter/material.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title",style: TextStyle(fontSize:20, color: Colors.black),),
                        Text("Description",style: TextStyle(fontSize:12, color: Colors.grey),),
                        Text("Date: 02/12/2025",style: TextStyle(fontSize:12, color: Colors.grey,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Chip(label: Text('Cancel'),
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
        )
    );
  }
}
