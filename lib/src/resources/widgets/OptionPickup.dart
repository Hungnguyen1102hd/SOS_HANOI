import 'package:flutter/material.dart';
import 'package:sos_hanoi/src/blocs/option_bloc.dart';
import 'package:sos_hanoi/src/model/place_item_res.dart';
import 'package:sos_hanoi/src/model/user.dart';
import 'package:sos_hanoi/src/resources/waiting_pickup.dart';


// ignore: must_be_immutable
class OptionPickup extends StatefulWidget {

   int distance;
   PlaceItemRes placeItemRes;
  OptionPickup(this.distance,this.placeItemRes);
  @override
  _OptionPickupState createState() => _OptionPickupState();
}

class _OptionPickupState extends State<OptionPickup> {

  var optionBloc = new OptionPickupBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: optionBloc.stream,
      builder: (context, snapshot){
        return Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 137),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: ListView.builder(itemBuilder: (context, index) {
                return FlatButton(
                  color: optionBloc.isSelected(index) ? Color(0x3000ffff) : Colors.white,
                  onPressed: () {
                    optionBloc.selectItem(index);
                  },
                  child: Container(
                    constraints: BoxConstraints.expand(width: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff323643),
                              borderRadius: BorderRadius.all(Radius.circular(2))
                          ),
                          child: Text(optionBloc.optionList.elementAt(index).name, style: TextStyle(color: Colors.white, fontSize: 10),),
                          padding: EdgeInsets.all(2),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff7f7f7),
                          ),
                          width: 64,
                          height: 64,
                          child: Center(
                            child: Image.asset(optionBloc.optionList.elementAt(index).assetsName),
                          ),
                        ),
                        Text(optionBloc.optionList.elementAt(index).price.toString() + " VNĐ", style: TextStyle(color: Color(0xff606470), fontSize: 12),)
                      ],
                    ),
                  ),
                );
              }, itemCount: optionBloc.optionList.length, scrollDirection: Axis.horizontal,),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>WaitingPickup()));
                }, color: Color(0xff3277D8),
                  child: Text("Xác nhận", style: TextStyle(color: Colors.white, fontSize: 16),),),
              ),)
          ],
        );
      },
    );
  }
}
