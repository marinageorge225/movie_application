  import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
  import 'package:flutter/material.dart';
  import 'package:graduation_movie_app/ui/auth/Reigster/Avatar%20_widget.dart';
import 'package:graduation_movie_app/ui/auth/login/login_view.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_elevated_button.dart';
  import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';
  import 'package:graduation_movie_app/utils/assets_manager.dart';

import '../../custom widgets/custom_text_field.dart';

  class RegisterScreen extends StatefulWidget {

    static String routeName= "Register ";


  @override
    State<RegisterScreen> createState() => _RegisterScreenState();
  }

  class _RegisterScreenState extends State<RegisterScreen> {
    var formkey=GlobalKey<FormState>();
    var  emailController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmpasswordController  = TextEditingController();
    var phonenumberController = TextEditingController();
    // todo: savedvalue
  int selectedindex=0;
   String selectedAvater="";
   bool ShowPassword=false;
    bool ShowConfirmPassword=false;


    List<String> avatarPath =[AssetsManager.avatar1,
   AssetsManager.avatar2,
   AssetsManager.avatar3,
    AssetsManager.avatar4,
    AssetsManager.avatar5,
    AssetsManager.avatar6,
    AssetsManager.avatar7,
    AssetsManager.avatar8,
    AssetsManager.avatar9,

  ];


    @override
    Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;

      return Scaffold(
        appBar: AppBar(
          title: Text("Register"),

        ),
        body:SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.04),
            child: Form(key: formkey,
              child: Column(children: [
                 CarouselSlider.builder(itemCount: avatarPath.length,
                     itemBuilder: (context,index, itemIndex){
                   return  InkWell(onTap: (){
          
                   },
          
                       child: AvatarWidget(avatarPATH: avatarPath[index],));
                     },
                     options:CarouselOptions(enlargeCenterPage: true ,
                       initialPage: 0,
                       height: height*0.17,
                       disableCenter: true,
                       enlargeFactor: 0.6,
                       viewportFraction: 0.37,
                       onPageChanged: (index,changereson){
                       selectedindex=index;
                       selectedAvater=avatarPath[selectedindex];
                       print("the selected index=$selectedindex");
                       print("the avatar is $selectedAvater");
          
                         setState(() {
          
                       });
          
                       }
          
                     )
                 ),
                SizedBox(height: height*0.01,),
                Text("Avatar",style: AppStyles.regular16WhiteRoboto),
                SizedBox(height: height * 0.02),
          
                CustomTextField(validator:(text){
                  if (text==null || text.trim().isEmpty){
                    return "* required please enter name";
                  }
          
                  else {
                    return null ;
                  }
          
                },
                  keyBoardType: TextInputType.text,
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.NameID)),
                  hintText: 'Name',
                  controller: nameController,
                ),
          
                SizedBox(height: height * 0.02),
                CustomTextField(validator: (text){
                  if (text==null || text.isEmpty){
                    return "* required please enter the email";
                  }
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text);
                  if (!emailValid){
                    return "* please enter valid email ";
                  }
          
                  return null ;
          
                },
                  keyBoardType: TextInputType.emailAddress,
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.emailIcon)),
                  hintText: 'Email',
                  controller: emailController,
                ),
                SizedBox(height: height * 0.02),
                CustomTextField(
                  validator: (text){
                    if (text==null || text.isEmpty){
                      return "* required please enter password";
                    }
                    if (text.length<8){
                      return "* password should be 8 characters at least";
                    }
                    return null ;
          
                  },
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.passwordIcon)),
                  hintText: 'Password',
          
                  suffixIcon: IconButton(
                    onPressed: (){
          
          
                      setState(() {
                        ShowPassword=!ShowPassword;
          
                      });
                    },
                    icon: Icon(
                      ShowPassword
                          ? Icons.visibility
                          : Icons.visibility_off_sharp,
                    ),
                  ),
                  obscureText: !ShowPassword,
                  controller: passwordController,
                ),
                SizedBox(height: height * 0.02),
          
                CustomTextField(validator: (text){
                  if (text==null || text.isEmpty){
                    return "* required please enter ConfirmPassword";
                  }
                  if (text!=confirmpasswordController.text){
                    return "* ConfirmedPassword doesn't match the password";
          
                  }
                  return null ;
          
          
                },
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.passwordIcon)),
                  hintText: 'Confirm Password',
          
                  suffixIcon: IconButton(
                    onPressed: (){
          
          
                      setState(() {
                        ShowConfirmPassword=!ShowConfirmPassword;
          
                      });
                    },
                    icon: Icon(
                      ShowConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off_sharp,
                    ),
                  ),
                  obscureText: !ShowConfirmPassword,
                  controller: confirmpasswordController,
                ),
                SizedBox(height: height * 0.02),
                CustomTextField(validator: (text){
                  if (text==null || text.isEmpty){
                    return "* required please enter a valid Phone number";
                  }
                  if (text.length<11){
                    return "* Phone number Should not be less than 12 number ";
          
                  }
                  return null ;
          
          
                },
          
                  keyBoardType: TextInputType.phone,
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.phoneIcon)),
                  hintText: 'Phone Number',
                  controller: phonenumberController,
                ),
          
                SizedBox(height: height * 0.02),
                CustomElevatedButton(
                  buttonOnClick:onCreateAccountBotton,
                  buttonTitle: 'Create Account',buttonTitleStyle: AppStyles.regular20BlackRoboto,
                ),
          
                SizedBox(height: height * 0.02),
          
                // Create Account RichText
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already Have Account ? ",
                        style: AppStyles.regular16WhiteRoboto,
                      ),
                      TextSpan(
                        text: 'Login',
                        style: AppStyles.bold16Orange,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Create Account Screen
                            Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
          
          
                Image.asset(AssetsManager.languageSwatch)
          
          
          
          
          
          
          
          
              ],
          
          
                    ),
            ),
          ),
        ) ,


    );

  }
   void onCreateAccountBotton (){
      if (formkey.currentState?.validate()==true) {
        //todo: create Account
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);

        ///navigation
      }
   }
}
