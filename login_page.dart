import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validate (){
    if(formKey.currentState!.validate()){
      print("ok");
    }
    else{
      print("error");
    }
  }

  String? vallidatePass (val){
    if(val.isEmpty){
      return "Password required";
    }
    else if(val.length < 6){
      return "Atleast 6 character required";
    }
    else if(val.length > 15){
      return "Maximum character should be 15";
    }
    else{
      return null;
    }
  }

  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"),
            fit: BoxFit.cover,
            colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.2),
                BlendMode.dstATop),
          ),
      ),

      child: Scaffold(
          backgroundColor: Colors.transparent,

      body: Stack(

        children: [
          Container(
            padding: EdgeInsets.only(top: 100, left: 550),
            child: Text("Welcome User", style: TextStyle(

              color: Color(0xff4c505b),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
          ),


          SingleChildScrollView(
            child: Form(
              key: formKey,
              // padding: EdgeInsets.only(top:200, right: 35, left: 35),
              child: Padding(
                padding: const EdgeInsets.only(top: 200, right: 25, left: 25),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Enter Your Email",
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Email Required"),
                        EmailValidator(errorText: "Not valid email"),

                      ])
                    ),

                    SizedBox(height: 25,),
                    TextFormField(
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Enter Your Password",
                        suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                              Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      validator: vallidatePass,
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CircleAvatar(
                        //   radius: 30,
                        //   backgroundColor: Color(0xff4c505b),
                        //   child: IconButton(
                        //     color: Colors.white,
                        //     onPressed: (){
                        //       Navigator.pushNamed(context, "home");
                        //     },
                        //     icon: Icon(Icons.arrow_forward),
                        //   ),
                        // )
                        MaterialButton(onPressed: (){
                          if(formKey.currentState!.validate()){
                            Navigator.pushNamed(context, "home");
                          }
                          else{
                            return null;
                          }

                        },
                        height: 50,
                          minWidth: 250,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.red,
                          child: Text("Login", style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, "register");

                        }, child: Text("Sign up", style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color(0xff4c505b),
                        ),)),

                        TextButton(onPressed: (){}, child: Text("Forgot Password",
                          style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color(0xff4c505b),
                        ),))

                      ],
                    )
                  ],

                ),
              ),
            ),
          )
        ],
      ),
      ),


        );


  }

  void _togglePasswordView() {
  if(isHiddenPassword == true){
    isHiddenPassword = false;
  }
  else{
    isHiddenPassword = true;
    }
  setState(() {});
  }
}
