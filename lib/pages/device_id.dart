import 'package:flutter/material.dart';
import 'package:device_id/device_id.dart';
import 'package:survey_flutter_apps/pages/dashboard.dart';
class DeviceIdd extends StatefulWidget {
  const DeviceIdd({Key key}) : super(key: key);

  @override
  _DeviceIdState createState() => _DeviceIdState();
}

class _DeviceIdState extends State<DeviceIdd> {
  String deviceID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceID();
  }

  void getDeviceID() async {
    String deviceId = await DeviceId.getID;
    setState(() {
      deviceID = 'Device ID is $deviceId';

    });

    print('Device ID is $deviceId');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Device Id example app'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$deviceID'),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },child: Text("Dashboard"),),
          ],
        ),
      ),
    );
  }
}
