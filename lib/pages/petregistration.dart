import 'package:flutter/material.dart';

class PetRegistrationPage extends StatefulWidget {
  @override
  _PetRegistrationPageState createState() => _PetRegistrationPageState();
}

class _PetRegistrationPageState extends State<PetRegistrationPage> {
  final TextEditingController _birthdayController = TextEditingController();
  List<bool> isSelected = [true, false];
  List<bool> isSelected2 = [true, false];

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
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          // App Bar
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Pet Registration",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffFFB03E),
                fontSize: 28,
                fontFamily: 'CustomFont',
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 1.0,
        ),
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/foot.png",
                alignment: AlignmentDirectional.centerStart,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:
                    const EdgeInsets.all(70.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.3, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset(
                      'assets/paw.png',
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.all(190.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.all(60.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 60,
                    width: 70,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.all(55.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:
                    const EdgeInsets.all(10.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ), // Background image or other elements can go here

            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _profilePic(context),
                  SizedBox(height: 20),
                  _nameField(context),
                  SizedBox(height: 20),
                  _birthdayField(context),
                  SizedBox(height: 20),
                  _genderToggle(context),
                  SizedBox(height: 20),
                  _statusToggle(context),
                  SizedBox(height: 10),
                  _weightField(context),
                  SizedBox(height: 20),
                  _breedField(context),
                  SizedBox(height: 20),
                  _actionButtons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profilePic(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add_a_photo, size: 50),
      ),
    );
  }

  Widget _nameField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _birthdayField(BuildContext context) {
    return TextField(
      controller: _birthdayController,
      decoration: InputDecoration(
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
        Text(
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
          constraints: BoxConstraints(
            minHeight: 40.0,
            minWidth: 100.0,
          ),
          isSelected: isSelected,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = i == index;
              }
            });
          },
          children: <Widget>[
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
        Text(
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
          constraints: BoxConstraints(
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
          children: <Widget>[
            Text("Yes"),
            Text("No"),
          ],
        ),
      ],
    );
  }

  Widget _weightField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Weight (Kg)',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _breedField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
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
          width: 120.0,
          child: ElevatedButton(
            onPressed: () {
              // Handle back action
            },
            child: Text('Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 120.0,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Add'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
