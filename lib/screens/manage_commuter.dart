import 'package:flutter/material.dart';
import 'package:lab12_zh/models/commuter_list.dart';

class ManageCommuter extends StatelessWidget {
  final CommuterList cl;
  final Function delete;

  ManageCommuter(this.cl, this.delete);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          padding: EdgeInsets.only(
            top: 8,
            left: 7,
            right: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom + 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Информация о пассажире',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
                indent: 14,
                endIndent: 14,
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 4,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(19),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: cl.name,
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15)),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Material(
                elevation: 4,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(19),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: '77079282498',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15)),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Material(
                elevation: 4,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(19),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'Почта',
                      labelStyle: TextStyle(color: Colors.green, fontSize: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Место',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Цена',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 80,
                    width: 120,
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: cl.place,
                            labelStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 120,
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '3000',
                            labelStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.only(left: 40, top: 40)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 70,
                width: 360,
                child: RaisedButton(
                  onPressed: () {
                    delete(cl.id);
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0)),
                  textColor: Colors.white,
                  child: Text(
                    'Отменить покупку Билета',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
