import 'package:flutter/material.dart';
import 'package:lab12_zh/models/busline.dart';
import 'package:lab12_zh/models/commuter_list.dart';
import 'package:lab12_zh/screens/manage_commuter.dart';

import '../main.dart';

class Commuters extends StatefulWidget {
  @override
  _CommutersState createState() => _CommutersState();
}

class _CommutersState extends State<Commuters> {
  List<CommuterList> commuters = [
    CommuterList(
        id: 1, name: 'Aigerim', place: '0 A \n верхний', type: 'OFFLINE'),
    CommuterList(
        id: 2, name: 'Arlan', place: '0 B \n верхний', type: 'OFFLINE'),
    CommuterList(id: 3, name: 'ASSEL', place: '1 \n нижний', type: 'ONLINE'),
    CommuterList(
        id: 4, name: 'TEMIRLAN', place: '1 \n верхний', type: 'ONLINE'),
  ];

  Widget _listTile(text, icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
          leading:
              new IconTheme(data: new IconThemeData(size: 40), child: icon),
          title: Text(text,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
          onTap: () => {}),
    );
  }

  void _deleteCommuter(int id) {
    setState(() {
      commuters.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          toolbarHeight: 65.0,
          title: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Пассажиры',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0))),
          centerTitle: true,
          backgroundColor: Colors.green),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: Text('Test Company',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 28,
                              fontWeight: FontWeight.w500))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text('Aty Zhoni',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 36,
                              fontWeight: FontWeight.w800)))
                ]),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black87, width: 2)))),
        _listTile('Продажа билетов', Icon(Icons.credit_card)),
        _listTile('Список администраторов', Icon(Icons.people)),
        _listTile(
          'Автобусы',
          Icon(Icons.departure_board),
        ),
        _listTile('Статистика', Icon(Icons.equalizer)),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListTile(
              leading: new IconTheme(
                  data: new IconThemeData(size: 40),
                  child: Icon(Icons.airline_seat_recline_extra)),
              title: Text("Пассажиры",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w600)),
              onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new Commuters()))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListTile(
              leading: new IconTheme(
                  data: new IconThemeData(size: 40),
                  child: Icon(Icons.date_range)),
              title: Text("Расписание",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w600)),
              onTap: () => Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new MyApp()))),
        ),
        _listTile('История', Icon(Icons.library_books)),
        _listTile('Настройки', Icon(Icons.settings)),
      ])),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Имя',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Место',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Тип',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: commuters.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _modalBottomSheet(context, commuters[index]);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 115,
                            child: Text(commuters[index].name,
                                style: TextStyle(fontSize: 19)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            commuters[index].place,
                            style: TextStyle(fontSize: 19),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 40,
                            width: 115,
                            child: RaisedButton(

                              child: Text(
                                commuters[index].type,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: null,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(29.0)),
                              disabledColor: commuters[index].type == "OFFLINE"
                                  ? Colors.grey
                                  : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Свободные места',
                    style: TextStyle(fontSize: 19),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _modalBottomSheet(BuildContext ctx, CommuterList cl) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: ManageCommuter(cl, _deleteCommuter),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
}
