import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santos/bloc/cubit.dart';
import 'package:santos/bloc/state.dart';
import 'package:santos/componnet/componnetAuth.dart';
import 'package:santos/constants/color.dart';
class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   var userName = TextEditingController();

   var phone = TextEditingController();

   var password = TextEditingController();

   var passwordAgain = TextEditingController();

   var email = TextEditingController();

   var country = TextEditingController();

   GlobalKey<FormState> formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppState>(builder: (context,state){
      AppCubit cubit = BlocProvider.of(context);
      double width = MediaQuery.of(context).size.width;

      return Scaffold(
        backgroundColor: colorBlue,
        bottomNavigationBar: InkWell( onTap: (){
          if(formKey.currentState!.validate()){
            Navigator.pushNamed(context, "Otp_Next_SignUp");
          }
        },child: defaultContainer(text: "متابعة",context: context),
        ),

        body: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              SizedBox(height: 55,),
              arrowBack(context: context), // سهم الرجوع
              SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      fixoIcon(),
                      SizedBox(height: 15,),
                      Text(
                        '! مرحباً\nعرف عن نفسك قبل البدء بالاستكشاف',
                        style: TextStyle(
                          fontSize: width/17,
                          color: const Color(0xffffffff),
                          height: 1.2,
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                      SizedBox(height: 15,),
                      defaultNewTextFormField(labelName: "اسم المستخدم", labelStar: "*", hint: "ادخل اسم المستخدم",suffix: Icon(Icons.person,color: Colors.grey,),textEditingController: userName,validator: (String? value){if(value!.isEmpty){
                          return "يجب ادخال اسم المستخدم !";
                        }}),
                      defaultNewTextFormField(labelName: "رقم الجوال", labelStar: "*", hint: "ادخل رقم الجوال",textInputType: TextInputType.number,textEditingController: phone,validator: (String? value){if(value!.isEmpty){
                          return "يجب ادخال رقم الجوال !";
                        }


                      }),
                      defaultNewTextFormField(labelName: "البريد الإلكتروني", labelStar: "*", hint: "ادخل البريد الإلكتروني",suffix: Icon(Icons.email_rounded,color: Colors.grey,),textInputType: TextInputType.emailAddress,textEditingController: email,validator:
                          (String? value){
                          if(value!.isEmpty){
                           return "يجب ادخال البريد الإلكتروني !";}
                          else if(!value.contains("@")){
                            return "البريد الإلكتروني غير صالح";
                          }
                      }),
                      //  new password TextFormField
                      defaultNewTextFormField(

                          textEditingController: password,
                          labelName: "كلمة المرور",
                          labelStar: "*",
                          hint: "ادخل كلمة المرور",
                          suffix: InkWell(
                            onTap: () {
                              cubit.changeForgetPassword1();
                            },
                            child: Icon(
                              cubit.forgetPassword1 == true
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          obscureText: cubit.forgetPassword1,
                            validator: (String? value){
                            if(value!.isEmpty){
                              return "يجب ادخال كلمة المرور !";
                            }
                            }
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // Confirm the new password TextFormField
                      defaultNewTextFormField(
                          validator: (String? value){
                            if(value!.isEmpty){
                              return "يجب ادخال تأكيد كلمة المرور !";
                            }
                          },
                          textEditingController: passwordAgain,
                          labelName: "تأكيد كلمة المرور",
                          labelStar: "*",
                          hint: "ادخل تأكيد كلمة المرور",
                          suffix: InkWell(
                              onTap: () {
                                cubit.changeForgetPassword2();
                              },
                              child: Icon(
                                cubit.forgetPassword2 == true
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility,
                                color: Colors.grey,
                                size: 20,
                              )),
                          obscureText: cubit.forgetPassword2),
                      SizedBox(height: 15,),

                      //بالرجاء التأكد من قراءة والموافقة على الشروط
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xffffffff),
                                height: 1.2,
                              ),
                              children: [
                                TextSpan(
                                  text: 'بالرجاء التأكد من قراءة والموافقة على ',
                                ),
                                TextSpan(
                                  text: 'الشروط\n',
                                  style: TextStyle(
                                    color: const Color(0xffffca34),
                                  ),
                                ),
                                TextSpan(
                                  text: 'و',
                                  style: TextStyle(
                                    color: const Color(0xffffca34),
                                  ),
                                ),
                                TextSpan(
                                  text: 'الاحكام',
                                  style: TextStyle(
                                    color: const Color(0xffffca34),
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: 25,
                            child: Checkbox(

                                shape: CircleBorder(),
                                side: BorderSide(color: Colors.white),

                                activeColor: Color(0xffF3BA35),
                                checkColor: Color(0xff182061),
                                hoverColor: Colors.white,
                                value: cubit.AgreeToTheTerms,
                                onChanged: (bool? value) {
                                  cubit.changeRadioAgreeToTheTerms(value!);
                                }),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),


                    ],
                  ),
                )




            ],),
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
