import 'package:flutter/material.dart';
import 'user.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController weightController;
  late TextEditingController heightController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.user.username);
    emailController = TextEditingController(text: widget.user.email);
    weightController = TextEditingController(
        text: widget.user.weight?.toStringAsFixed(1) ?? "");
    heightController = TextEditingController(
        text: widget.user.height?.toStringAsFixed(1) ?? "");
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(labelText: "Weight (kg)"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: heightController,
                decoration: InputDecoration(labelText: "Height (cm)"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final updatedUser = User(
                    username: usernameController.text,
                    email: emailController.text,
                    birthdate: widget.user.birthdate,
                    gender: widget.user.gender,
                    password: widget.user.password,
                    weight: double.tryParse(weightController.text),
                    height: double.tryParse(heightController.text),
                  );

                  Navigator.pop(context, updatedUser);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Save", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
