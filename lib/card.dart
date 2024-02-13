import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cardview extends StatefulWidget {
  const Cardview({Key? key}) : super(key: key);

  @override
  State<Cardview> createState() => _CardviewState();
}




class _CardviewState extends State<Cardview> {
  // ==============QueryDocumentSnapshot vs QuerySnapshot===============
  List<QueryDocumentSnapshot> data =[];

  getData() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('food')
        .limit(2)
        .get();
    data.addAll(querySnapshot.docs);

    setState((){

    });
  }

  @override
  void initState(){
    getData();
    super.initState();
  }
  // =======================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 160),
          itemCount: data.length,
          itemBuilder: (context, i) {
            // =====================delete===============
            return InkWell(
              onDoubleTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.leftSlide,
                    desc: 'Are u sure to delete this card',
                    btnCancelOnPress: () {
                      print('cancel');

                    },
                    //////////////////not docs/////////////////////
                    btnOkOnPress: () async{

                      // await FirebaseFirestore.instance.collection('reports').doc().delete();
                      //guess


                      await FirebaseFirestore.instance.collection('food').doc(data[i].id).delete();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Cardview()));
                      print('deleted');
                      },

                    ///////////////////////////////////////
                  ).show();
              },
              // =============================================
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.confirmation_num_sharp,
                        size: 100,
                      ),
                      Text("${data[i]['flavor']}"),
                      // Text("s"),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
