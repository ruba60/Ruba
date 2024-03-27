import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordController = TextEditingController();
  String userType = 'Ambulance_Department';

  List<String> items = ['Ambulance_Department', 'employee'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Welcomee '),
      ),
      body: Row(
        children: [
          Expanded(

            flex: 1,
            child: Container(
              // color: Colors.green,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Zaid Al_Sharity Hospital', style: TextStyle(fontSize: 35)),
                  const SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    width: MediaQuery.of(context).size.width * 0.4,

                    decoration: BoxDecoration(

                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color:Colors.cyan),
                    ),
                    child: DropdownButton(
                        value: userType,
                        underline: Container(),
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.cyan),
                        isExpanded: true,
                        items: items.map<DropdownMenuItem<String>>((String e) {
                          return DropdownMenuItem(value: e,child: Text(e),);
                        }).toList(),

                        onChanged: (String? newItem){
                          setState(() {
                            userType = newItem!;
                          });
                        }
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(

                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color:Colors.cyan),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {
                        if (value.length < 4 || value.length > 10) {
                          print("Please Enter The Password  ");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Password must be between 4 and 10 characters')),
                          );
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  //



                  //   const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.35 , 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                      onPressed: () {
                        //    if (_formKey.currentState!.validate()) {
                        //                     userType== 'Ambulance_Department'?
                        //                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()))
                        //                     :
                        //                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Screen()))
                        //                     ;
                        //                   }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Segoe UI',
                        ),
                      ),
                    ),)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child:Container(
              //     color: Colors.blue,
              child: Center(
                child: Image.asset('images/2.jpg'),
              ),
            ),
          ),

        ],
      ),
    );

  }
}
