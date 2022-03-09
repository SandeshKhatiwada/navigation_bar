import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://images.unsplash.com/photo-1510674485131-dc88d96369b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=349&q=80"),
          fit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.8),
              BlendMode.dstATop),
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 5, top: 160),
                child: Center(
                  child: Text("Register Here", style: TextStyle(
                    color: Color(0xff4c505b),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                ),
              ),
            ),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top:
                MediaQuery.of(context).size.height*0.3, right: 35, left: 35),
                child: Column(
                  children: [

                    SizedBox(height: 25,),
                    TextField(

                      decoration: InputDecoration(

                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Enter Your Name",
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),


                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Enter Your Email",
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    SizedBox(height: 25,),
                    TextField(
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Enter Your Password",
                          suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(Icons.visibility)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),

                    SizedBox(height: 25,),
                    TextField(
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Confirm Your Password",
                          suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(Icons.visibility)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          height: 50,
                          width: 300,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              primary: Colors.red,

                            ),
                            onPressed: (){
                            Navigator.pushNamed(context, "login");
                          },
                              child: Text("Sign Up", style: TextStyle(
                                fontSize: 25,
                                // fontWeight: FontWeight.bold,
                              ),),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),


                  ],
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
    else {
      isHiddenPassword = true;
    }
    setState(() {});
  }

}


