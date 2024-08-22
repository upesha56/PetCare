import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class PetRegistrationPage extends StatefulWidget {
  @override
  _PetRegistrationPageState createState() => _PetRegistrationPageState();
}

class _PetRegistrationPageState extends State<PetRegistrationPage> {
  final TextEditingController _birthdayController = TextEditingController();

  final petNameController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final breedController = TextEditingController();

  bool isLoading = false;
  // pet registration method

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void petRegistration() async {
    setState(() {
      isLoading = true;
    });

    var pet_name = petNameController.text;
    var weight = weightController.text;
    var height = heightController.text;
    var breed = breedController.text;
    var birthday= _birthdayController.text;


     // Ensure both fields are filled
    if (pet_name.isEmpty || weight.isEmpty || breed.isEmpty || birthday.isEmpty || selectedGender.isEmpty || height.isEmpty || _image == null) {
      setState(() {
        isLoading = false;
      });
      showErrorDialog('Please fill all fields.');
      return;
    }
    try{
      var url = Uri.parse('http://10.0.2.2:8000/pet-registration');

      final request = http.MultipartRequest('POST', url);

      // Add form data
      request.fields['pet_name'] = pet_name;
      request.fields['weight'] = weight;
      request.fields['breed'] = breed;
      request.fields['birthday'] = birthday;
      request.fields['height'] = height;
      request.fields['gender'] = selectedGender;

      // Add image file
      if (_image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'photo', // This is the field name for the file in the Flask backend
            _image!.path,
          ),
        );
      }

      // Send the request
      final response = await request.send();

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 201) {
        final responseData = await http.Response.fromStream(response);

        var data = json.decode(responseData.body);

        if (data['detail'] == 'Pet Registration successfully') {
          Navigator.push(
            context,
            //MaterialPageRoute(builder: (context) => const userProfile()),
            MaterialPageRoute(builder: (context) => PetRegistrationPage()),
          );
        } else {
          final responseData = await http.Response.fromStream(response);
          final data = json.decode(responseData.body);
          showErrorDialog(data['detail'].toString());
        }
      }
      else{
        final responseData = await http.Response.fromStream(response);
        final data = json.decode(responseData.body);
        showErrorDialog(data['detail'].toString());
      } 
    }catch(e){
      setState(() {
        isLoading = false;
      });
      showErrorDialog('An error occurred. Please try again.');
    }
  }

  //error showing method
  void showErrorDialog(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  List<bool> breed = [true, false];
  String selectedGender = "F";
  List<bool> isSelected2 = [true, false];
  File? _image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthdayController.text =
            "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _profilePic(context),
              const SizedBox(height: 20),
              _nameField(context),
              const SizedBox(height: 20),
              _birthdayField(context),
              const SizedBox(height: 20),
              _genderToggle(context),
              const SizedBox(height: 20),
              _statusToggle(context),
              const SizedBox(height: 10),
              _weightField(context),
              const SizedBox(height: 20),
              _heightField(context),
              const SizedBox(height: 20),
              _breedField(context),
              const SizedBox(height: 20),
              _actionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePic(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle image upload
      },
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add_a_photo, size: 50),
      ),
    );
  }

  Widget _nameField(BuildContext context) {
    return TextField(
      controller: petNameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _birthdayField(BuildContext context) {
    return TextField(
      controller: _birthdayController,
      decoration: const InputDecoration(
        labelText: 'Birthday',
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
    );
  }

  Widget _genderToggle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ToggleButtons(
          borderColor: Colors.orange,
          fillColor: Colors.orange,
          borderWidth: 2,
          selectedBorderColor: Colors.orange,
          selectedColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 100.0,
          ),
          isSelected: breed,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < breed.length; i++) {
                breed[i] = i == index;
              }
              selectedGender = index == 0 ? "F" : "M";
            });
          },
          children: const <Widget>[
            Text("Female"),
            Text("Male"),
          ],
        ),
      ],
    );
  }

  Widget _statusToggle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Status',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ToggleButtons(
          borderColor: Colors.orange,
          fillColor: Colors.orange,
          borderWidth: 2,
          selectedBorderColor: Colors.orange,
          selectedColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 100.0,
          ),
          isSelected: isSelected2,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected2.length; i++) {
                isSelected2[i] = i == index;
              }
            });
          },
          children: const <Widget>[
            Text("Yes"),
            Text("No"),
          ],
        ),
      ],
    );
  }

  Widget _weightField(BuildContext context) {
    return TextField(
      controller: weightController,
      decoration: const InputDecoration(
        labelText: 'Weight (Kg)',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _heightField(BuildContext context) {
    return TextField(
      controller: heightController,
      decoration: const InputDecoration(
        labelText: 'Height (cm)',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _breedField(BuildContext context) {
    return TextField(
      controller: breedController,
      decoration: const InputDecoration(
        labelText: 'Breed',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 120.0, // Set the width here
          child: ElevatedButton(
            onPressed: () {
              // Handle back action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Set the border radius here
              ),
            ),
            child: const Text('Back'),
          ),
        ),
        SizedBox(
          width: 120.0, // Set the width here
          child: ElevatedButton(
            onPressed: petRegistration,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Set the border radius here
              ),
            ),
            child: const Text('Add'),
          ),
        )
      ],
    );
  }
}
