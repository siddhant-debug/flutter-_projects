import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ReportPage extends StatefulWidget {

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String _chosenValue;
  static List<Vehicle> _veh = [
    Vehicle(1, 'Car'),
    Vehicle(2, 'Truck'),
    Vehicle(3, 'Bike'),
    Vehicle(4, 'Three Wheeler'),
    Vehicle(5, 'Cycle'),
  ];
  final _item1 = _veh
      .map((vehicle) => MultiSelectItem<Vehicle>(vehicle, vehicle.Name))
      .toList();
  List<Vehicle> _selectedVehicle1 = [];
  List<Vehicle> _selectedVehicle2 = [];
  List<Vehicle> _selectedVehicle3 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedVehicle1 = _veh;
  }

  PickedFile _imageFile;
  _OpenGallery(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _OpenCamera(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<Void> _ShowDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Make a choice'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    _OpenGallery(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () {
                    _OpenCamera(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget imageView() {
    if (_imageFile == null) {
      return Text('No image Selected');
    } else {
      Image.file(File(_imageFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldBuilder(
                label: 'Enter Name',
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldBuilder(
                label: 'Enter Phone Number',
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldBuilder(
                label: 'Describe the accident',
                maxlines: null,
              ),
              SizedBox(
                height: 10,
              ),
              MultiSelectChipField(
                items: _item1,
                title: Text("Vehciles damaged"),
                headerColor: Colors.blue.withOpacity(0.5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[700], width: 1.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                selectedChipColor: Colors.blue.withOpacity(0.5),
                selectedTextStyle: TextStyle(color: Colors.blue[800]),
                onTap: (values) {
                  //_selectedAnimals4 = values;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white70,
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade200,
                    focusColor: Colors.blue,
                    value: _chosenValue,
                    elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: <String>[
                      'Andhra Pradesh',
                      'Arunachal Pradesh',
                      'Assam ',
                      'Bihar',
                      'Chattisgarh',
                      'Goa',
                      'Gujarat',
                      'Haryana',
                      'Himachal Pradesh',
                      'Jharkhand',
                      'Karnatka',
                      'Kerala',
                      'Madhya Pradesh',
                      'Maharashtra',
                      'Manipur',
                      'Meghalaya',
                      'Mirozam',
                      'Nagaland',
                      'Odisha',
                      'Punjab',
                      'Rajasthan',
                      'Sikkim',
                      'Tamil Nadu',
                      'Telangana',
                      'Uttar Pradesh',
                      'Uttarakhand',
                      'West Bengal',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Center(
                      child: Text(
                        "Please choose a State",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              imageView(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _ShowDialogBox(context);
                  });
                },
                child: Text('Add Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldBuilder extends StatelessWidget {
  final String label;
  final int maxlines;
  TextFieldBuilder({this.label, this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: label,
      ),
    );
  }
}

class Vehicle {
  final int id;
  final String Name;

  Vehicle(this.id, this.Name);
}
