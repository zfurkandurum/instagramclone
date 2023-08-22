import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagramclone/resources/auth_method.dart';
import 'package:instagramclone/screens/login_screen.dart';
import 'package:instagramclone/utils/color.dart';
import 'package:instagramclone/utils/utils.dart';
import 'package:instagramclone/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';
import '../responsive/responsive.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isloading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im!;
    });
  }

  void signUpUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isloading = false;
    });
    if (res != "success") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobilScreenLayout: mobilScreenLayout(),
            webScreenLayout: webScreenLayout(),
          ),
        ),
      );
    }
  }

  void goToLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPJ0ay1Xb01JDdEGuAhR9lAUxCFwFLLZlPdp9D8bURqHWWgqbPlt4g-vfgxluUzT2CgKo&usqp=CAU"),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo_outlined),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              TextFieldInput(
                textEditingController: _usernameController,
                hintText: "enter your username",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "enter your email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "enter your password",
                textInputType: TextInputType.visiblePassword,
                isPass: true,
              ),
              const SizedBox(height: 16),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: "enter your bio",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                  child: _isloading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: primaryColor,
                        ))
                      : const Text("Signup"),
                ),
              ),
              const SizedBox(height: 16),
              Flexible(flex: 2, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: const Text("dont have an account? "),
                  ),
                  InkWell(
                    onTap: goToLogin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
              //svg image
              // email
              //password
              //button
            ],
          ),
        ),
      ),
    );
  }
}
