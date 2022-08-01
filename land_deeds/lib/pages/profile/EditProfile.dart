import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:land_deeds/NetworkHandler.dart';
import 'package:land_deeds/models/profileModel.dart';
import 'package:land_deeds/screens/Profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _dateinput = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _address = TextEditingController();
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel();
  String _gender = "";
  bool circular = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response = await networkHandler.get("/user/getData");
    print(response);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
    });
    setState(() {
      _username.text = profileModel.username;
      _email.text = profileModel.email;
      _firstname.text = profileModel.firstname;
      _lastname.text = profileModel.lastname;
      _number.text = '${profileModel.phonenumber}';
      // _dateinput.text = profileModel.dob as String;
      _country.text = profileModel.country;
      _state.text = profileModel.state;
      _city.text = profileModel.city;
      _address.text = profileModel.address;
      _gender = profileModel.gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Update Profile",
            style: TextStyle(
              letterSpacing: 1,
            ),
          ),
        ),
        body: Form(
          key: _globalkey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: <Widget>[
                      CircleAvatar(
                          radius: 80.0,
                          backgroundImage: _imageFile == null
                              ? AssetImage('assets/person.png')
                              : FileImage(File(_imageFile!.path))
                                  as ImageProvider),
                      Positioned(
                        bottom: 20.0,
                        right: 20.0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.blue.shade700,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _username,
                      readOnly: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username",
                        hintText: "enter your username",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.person),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      readOnly: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "enter your email",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.email),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _firstname,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Firstname",
                        hintText: "enter your firstname",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.person),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _lastname,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Lastname",
                        hintText: "enter your lastname",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.person),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _number,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Phone Number",
                        hintText: "enter your phonenumber",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.phone),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _dateinput,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "DOB",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.calendar_month_rounded),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            _dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Radio<String>(
                              value: "Male",
                              groupValue: _gender,
                              onChanged: _handleGenderChange,
                            ),
                            Text("Male"),
                            Radio<String>(
                              value: "Female",
                              groupValue: _gender,
                              onChanged: _handleGenderChange,
                            ),
                            Text("Female"),
                            Radio<String>(
                              value: "Other",
                              groupValue: _gender,
                              onChanged: _handleGenderChange,
                            ),
                            Text("Other"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _country,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Country",
                        hintText: "enter your country",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.flag),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _state,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "State",
                        hintText: "enter your state",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.location_city_rounded),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _city,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "City",
                        hintText: "enter your city",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Icon(Icons.location_city_rounded),
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      controller: _address,
                      minLines: 1,
                      maxLines: 5,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Address",
                        hintText: "enter your address",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        focusedErrorBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            circular = true;
                          });
                          if (_globalkey.currentState!.validate()) {
                            // we will send the data to rest server
                            Map<String, String> data = {
                              "firstname": _firstname.text,
                              "lastname": _lastname.text,
                              "phonenumber": _number.text,
                              "dob": _dateinput.text,
                              "gender": _gender,
                              "country": _country.text,
                              "state": _state.text,
                              "city": _city.text,
                              "address": _address.text,
                            };
                            print(data);
                            var response = await networkHandler.patch(
                                "/user/update/${_username.text}", data);
                            print(response.body);
                            if (response.statusCode == 200 ||
                                response.statusCode == 201) {
                              // ignore: unnecessary_null_comparison
                              if (_imageFile != null) {
                                var imageResponse =
                                    await networkHandler.patchImage(
                                        "/user/add/image", _imageFile!.path);

                                print(imageResponse.statusCode);
                                if (imageResponse.statusCode == 200 ||
                                    imageResponse.statusCode == 201) {
                                  setState(() {
                                    circular = false;
                                  });
                                  print("image updated123");
                                  // Navigator.of(context).pushAndRemoveUntil(
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Profile()),
                                  //     (route) => false);
                                }
                              } else {
                                setState(() {
                                  circular = false;
                                });
                              }
                              print("image");
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Profile()),
                                  (route) => false);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                        child: Text(
                          "Update Profile",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  void _handleGenderChange(String? value) {
    setState(() {
      _gender = value!;
    });
  }
}
