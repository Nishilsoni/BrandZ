//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/Homescreen1.dart';
import 'package:flutter_application_1/common_widget/commonbutton.dart';
import 'package:flutter_application_1/models/usermodel.dart';
import 'package:flutter_application_1/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController _passwordController = TextEditingController();
  TextInputType _emailKeyboardType = TextInputType.emailAddress;
  TextEditingController _emailController = TextEditingController();
  late SharedPreferences prefs;
  UserModel tempUser = UserModel();
  bool isshow = true;
  bool _isValid = false;
  String _errorMessage = '';
  bool _isValidEmail = false;
  final _formKey = GlobalKey<FormState>();
  String? _emailErrorMessage;

  @override
  void initState() {
    getdata();
    //_emailController.text = "brandz@gmail.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   title: Text('Sign In'),
      //   backgroundColor: Color.fromARGB(255, 43, 27, 94),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      'Hola Amigo!',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'frontierswoman',
                      ),
                    ),
                    Text(
                      'Bienvenido a su centro de barras de frijoles orgánicos caseros y personalizados.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'frontierswoman',
                      ),
                    ),
                    Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7vHuPDPQHkaIfhv-d_inwpsCIX6QkvOJUug&s",
                        fit: BoxFit.contain,
                        height: 400,
                        width: 400),
                    TextFormField(
                      keyboardType: _emailKeyboardType,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 20, 246, 227))),
                      ),
                      controller: _emailController,
                      validator: (g) {
                        return _validateEmail(g ?? '');
                      },
                    ),
                    SizedBox(height: 16.0),

                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: iicon(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 20, 246, 227))),
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        return _validatePassword(value ?? '');
                      },
                      obscureText: isshow,
                    ),
                    SizedBox(height: 2.0),
                    // _isValidEmail
                    //       ? Text('Email is valid!', style: TextStyle(color: Colors.green, fontSize: 15))
                    //       : Text('Email is not valid!\n$_emailErrorMessage', style: TextStyle(color: Colors.red, fontSize: 10)),
                    //  _isValid
                    //     ? Text(
                    //         'Password is valid!',
                    //         style: TextStyle(color: Colors.green,fontSize: 15),
                    //       )
                    //     : Text(
                    //         'Password is not valid!\n'
                    //         '• $_errorMessage',
                    //         style: TextStyle(color: Colors.red,fontSize: 10),
                    //       ),
                    SizedBox(height: 20.0),
                    // const SizedBox(height: 16.0),
                    // SizedBox(
                    //   width: 500,
                    //   height: 50.0,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // setState(() {
                    //       //  // _isValid = _validatePassword(_passwordController.text);
                    //       //  // _isValidEmail=_validateEmail(_emailController.text);

                    //       // });
                    //       validateForm();
                    //     },
                    //     style: ButtonStyle(
                    //       shape:
                    //           WidgetStateProperty.all<RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20.0),
                    //         ),
                    //       ),
                    //       backgroundColor: WidgetStateProperty.all(
                    //         Colors.brown[900],

                    //         // fontColor: Colors.white,
                    //       ),
                    //     ),
                    //     child: Text(
                    //       'Log In',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // ),

                    ButtonApp(
                      width: MediaQuery.sizeOf(context).width,
                      height: 50,
                      buttonText: 'Log in',
                      onPressed: validateForm,
                      buttonColor: Color.fromARGB(251, 38, 20, 79),
                    ),
                    const SizedBox(height: 16.0),

                    // SizedBox(
                    //   width: 500,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // Sign-in logic goes here
                    //     },

                    //     style: ButtonStyle(
                    //       backgroundColor: WidgetStateProperty.all(Colors.white),
                    //       // fontColor: Colors.white,
                    //     ),
                    //     child: Text(
                    //       'Sign In',
                    //       style: TextStyle(color: Colors.brown[900]),
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 16.0),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ElevatedButton(
                    //         onPressed: () {
                    //           // Sign-in logic goes here
                    //         },
                    //         style: ButtonStyle(
                    //           backgroundColor:
                    //               WidgetStateProperty.all(Colors.white),
                    //           shape: WidgetStateProperty.all<CircleBorder>(
                    //             CircleBorder(),
                    //           ),
                    //           padding: WidgetStateProperty.all<EdgeInsets>(
                    //             EdgeInsets.all(
                    //                 10), // Adjust the padding to increase the size
                    //           ),
                    //         ),
                    //         child: ClipOval(
                    //             child: Image.network(
                    //           'data:image/jpeg;base64,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',
                    //           height: 30.0, // Adjust height as needed
                    //           width: 30.0,
                    //           // Adjust width as needed
                    //         ))),
                    //     ElevatedButton(
                    //         onPressed: () {
                    //           // Sign-in logic goes here
                    //         },
                    //         style: ButtonStyle(
                    //           backgroundColor:
                    //               WidgetStateProperty.all(Colors.white),
                    //           shape: WidgetStateProperty.all<CircleBorder>(
                    //             CircleBorder(),
                    //           ),
                    //           padding: WidgetStateProperty.all<EdgeInsets>(
                    //             EdgeInsets.all(
                    //                 10), // Adjust the padding to increase the size
                    //           ),
                    //         ),
                    //         child: ClipOval(
                    //             child: Image.network(
                    //           'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAKgAswMBIgACEQEDEQH/xAAcAAEBAAIDAQEAAAAAAAAAAAAABwUGAgMEAQj/xABIEAABAwICBAkGCQoHAAAAAAABAAIDBAUGEQchMVESEzZBYXGBocEycnN0sbIUF0NSVZGSk9EiIzNCU2Kis8LwFSQlNYLS4v/EABoBAAMBAQEBAAAAAAAAAAAAAAAFBgQDAgH/xAAwEQACAgECBAMHBAMBAAAAAAAAAQIDBAURITFRcRIzQSIjMmGBwdETNJGhFbHwJP/aAAwDAQACEQMRAD8AuKIiACIiACIiACLB37FVrsmcc8plqQNVPFrd28w7VoF3x7d64ltIWUMJ5o/ynnrcfABbsfT77+KWy6sy3ZlVXBvd/IqtVVU1HHxlXURQR/OleGj6ysJVY2w/TEg14lduhjc/vAy71HZ5ZaiUy1Er5ZDtfI4uce0rimteiVr45N9uH5F89Um/hiVKTSRaGkhlLXP6QxgHe5cBpKteeuhrsuhrP+ymCLR/iMXo/wCTj/kb+pWafSFYpcuMdUwekhz93NZihxFZq9wbS3Knc87GF/Bcew5FQ5fCM9q5z0Wh/C2jpHU7V8STP0Mihdsv11tRHwGuljYPkyeEz7J1fUt1sukeJ5bFeqfij+3gBc3tbtHZmlt+kX18Ye0v7/g21ajVPhLgb+i6aWpgrIGz0szJon+S9jswV3JW009mb09wiIvgBERABERABERABEXTV1MFHTSVNVI2KGNvCe92wBfUm3sgb24s5TzRU0L5qiRkcTBm57zkGjpKmmKMez1hfS2RzoKfYajZI/zfmjv6licW4oqL/UcBnCioGH83Dzu/ed09HN3rX1SYOlxrSnct306CTKz3P2K+XUEkkknMk5knnRETkWBERABERABERABERAHvs15r7LUcdb5yzPy4zrY/zh47VVsL4ro7+zi/0Fa0ZvgcdvS0847wo0uUUskMrJYXujkYeE17TkWneCsOZgV5K35S6/k142XOh9V0P0Gi1PBWLW3qMUdcWsuDG7dgmA5x07x2jo2xSl1M6ZuE1xH9VsbY+KPIIiLkdAiIgAiIgApJjvExvNYaOjf/AKfA7UQf0zx+t1bvr3ZbXpHvpt9tFvpn5VNWCHEHWyPnPbs+vcpSqDSMNbfrz+n5FGo5PH9KP1/B9RET4UBERABERABe212m4XaQx26lknLfKcNTW9bjqCzOC8LOv1Qaiq4TLfC7JxGoyu+aNw3n6t4rVLTQUdOynpYmRQsGTWMGQCVZ2pxx34ILeX9IYYuC7l4pcETak0bXCRudXXU8B3MaZPwXr+LHV/vGvf8ABf8A2qGiTy1XLb+Lb6IZLT8den9sm8mjKcfo7tG7zqcj+orC33BlxstE+tnmpZKdjgCY3O4Ws5DUR071YlrOkfknVefF74XfF1PJndGEnum0uSON+DRGuUorZpdSQIiKmEZzhmkp5mTQPdHLG4OY9p1tI51ZcIYgZf7aJHcFtXDk2eMb+Zw6D+I5lF1k8N3iSx3aKsZmY/JmYP12Hb2846QsGoYayauHxLl+DXh5Dpnx5PmXJFwhlZNEyWJwfG9oc1w2EHYVzUgUYREQAXxzgxpc4gNAzJPMvq1vSDcDQYZqAx2UlSRA3/l5X8IculNbtsjBep4smq4OT9CX4hujrzeKmucTwHuyiB/VYNTR49ZKxyIriEFCKjHkiWlJybk/UIiL0eQiIgAucEMlRPFBCM5JXhjBvcTkO8rgs/gOnFRiuhDgC2MukPY05d+S53T/AE65T6Js91w8c1HqVu00ENrt1PQ04/NwsDc8vKPOT0k5ntXrRFDSk5Nt8yqSSWyCITkMzsUuxHj2tqKmSGzSCnpWnITBoL5OnXsG7n9i0YuJZky2h6HG/IhQt5FRWsaR+SdV58fvhTF19vDnEm7V+Z3VLx7CumoulxqojFU3CsmiOWbJah7mnsJTejSJ12xm5Lg0xdbqMZwlFR5o8qIifCkIiIAqGjC7GqtctuldnJRnNmZ2xuzy+o5jqyW6qL4HuH+HYmo3k5RzHiH9Ids/i4KtCk9Vo/SyG1ylx/JQ4Fvjp2fNcAiIlptCnGliqzqLfRg+Sx8rh1kAexyo6kekqUyYpe0/JQRsHef6kz0iHiyk+if4MOoy2oa6mrIiKrJ8IiIAIiIALaNG3KqL0EngtXW0aNuVUfoJPBZs39tPszvjedHuV1ERRRTmKxVK6HDdzkjJDhTPAI5sxkocrdjDkvdPV3exRJUmieVLuJNU8yPYIiJ0LAiIgAiIgAHOYQ9hye05tO4jYr9Q1Dayip6pnkzRNkHURmoCrVgqXjcK212eeUPA+ySPBJNbhvXCXz/7/Q00uXtyiZtERTg6CjmkHldXdUf8tqsakOkmMx4qlcflIY3D6svBNtGf/ofb7oX6mvcrv+TWERFUCEIiIALcrZo+qbhbqasbcYmNqImyBpiJ4OYzy2rTVccLcmrV6pF7oSzVMm3HhF1vbdm7BohdNqaNJ+LOq+lIfuT+Ky+F8FT2O7trpK6OZrY3M4DYy06+1bmiRT1LJsi4SlwfyQ1hhUQkpJcV82ERFhNZ4r1QuuVpq6JjxG6eMsDyMwM1oXxZ1X0pD9yfxVKRaqMy7HTjW9jhbjVXPeaJr8WdV9KQ/cn8VhcUYVlw7TwSy1sc/HPLA1sZaRqzz2/3mrIprpYqA6vt9MDrjifIR5xAHulM8DPyb8iMJS4dkYcvEoqpcorj3ZoiIioRMEREAFYtHnI+g65f5r1HVacERcVhS2tyyzi4f2iT4pRrT9xFfP7MZaYvet/L7oziIimB4FNdLFLwa6gqwP0kToifNOY94qlLV9I1B8Mw1LKxpMlI8TDLcNTu4k9i26dZ+nkxb7fyZcyHjokiRIiKxJsIiIAK44W5NWr1SL3QoctwtukCsoLfTUbKCB7YImxhxeQSAMs0s1PGsyIRVa5M3YN8KZtzZVUUz+Muu+jab7xyy+FcaVV8vDaGajhia6NzuEx5J1JHZpuTXFzkuC+aGsM6iclFPi/kzdURFgNYReG91rrbaKutjYHugiLw12w5LQfjLrvo2m+8ctWPhXZEXKtcjPdk1UvabKYpDpHqBPiqZg+Qijj7uF/Usl8Zdd9G033jlqF1rpLncaiulaGvnfwi0HUNWWXcnGm4F1FrnYvQXZuXXbWowfqeVERPBUEREAfNZ1NBLjsA5yr7baYUVupaRuyCFkY7AAo3g+gNyxJQwkEsZJx0nms16+s5DtVtU9rdm8oV/Uc6XDhKf0CIiRDULhLGyaJ8UrQ6N7S1zTsIO0LmiAINeLfJabpU0EuZML8g4/rN2tPaCF41TNJljNTSMu1OzOWmHBmAG2Pf2HuJ3KZq0wslZFKn6+vcmcml02OPp6BERajOEREAFtGjblVH6CTwWrraNG3KqP0Engs2b+2n2Z3xvOj3K6iIoopzD4w5L3T1d3sUSVtxhyXunq7vYokqXRPKl3+wk1TzI9giInIsCIiACIvbZLZNeLnBQwZgyH8p+WfAaNrv758gvkpKMXKXJHqMXJ7I33RbauJo6i6yt/KqDxcRPzGnWe13ure100lNFR0sVNTs4EUTAxjdwC7lE5V7vtlY/Up6KlVWoBERcDqEREAfHNa9pa9oc0jIgjMEKN4zw6+w3DOFpNDOSYXfNPzD0jm3jqKsq8tzt9NdKKWjrI+HFINe8HmI3ELbg5jxrN/R8zNlYyvht6rkQRFl8SYfqrBWcVOC+B5/Mzganjcdx6FiFX12RsipRe6ZOThKEvDJcQiIvR5C2jRtyqj9BJ4LV1tGjblVH6CTwWbN/bT7M743nR7ldREUUU5h8Ycl7p6u72KJK24w5L3T1d3sUSVLonlS7/YSap5kewRETkWBEQAkgAEk6gBzoANaXODWtLnOOQAGZJ3BWDA+HP8AA7eZalo+HVABl5+AOZg8enqCxmBcIGh4Fzusf+aIzhhd8kN5/e9nXs3hTeqZ6s9zW+Hq+o7wcTwe8nz9AiIkozCIiACIiACIiAPPcKGmuNI+lrYWywvGtrvaNx6VKsUYMrLOX1FGH1VBt4QGb4h+8OcdI7clXUWzEzbMZ+zxXQzZGLC9cefU/PK+qt3/AANbbo501N/kqp2sujbmxx6W+IyWgXfCN5tRLpKUzwj5Wn/LHaNo7QqTH1Gi/k9n0Yluw7avTdfIwa2jRtyqj9BJ4LVs1tOjblVH6CTwXXN/bT7M543nR7ldREUUU5h8Ycl7p6u72KJK24w5L3T1d3sUSVLonlS7/YSap5kewRd9FRVVfLxVFTy1D+cRsLsuvd2rcrLo6qpi2S8zCnZ+xiIc89Z2DszTK/KpoXvJbf7MVVFlr9hGnUFDVXGqbTUMD5pnbGt5hvJ2AdJVRwngyns/Bq64tqK/aCPIi83een6sufYLXa6K00/EW+nZCzactrjvJ2ntXsU7mapO9eCHCP8AbHONgRq9qXFhERKjeEREAEREAEREAEREAEREAEREAY64WO1XIl1bQQSvIy4ZZk/7Q1rw2vCNrtNzbX0AnjeGubxZk4Tcj16+9EXVX2xj4FJ7dDm6q3LxNLcz6Ii5HQ81yoo7jQT0U7ntjnYWOLCAQDuzWGosEWCkId8C49w553l/ds7l8RdYX2wj4YyaRzlVCT3kt2Z+CGKniEVPEyKNuxjGhoHYF2Ii5N7nQIiIAIiIAIiIAIiIA//Z',
                    //           height: 30.0, // Adjust height as needed
                    //           width: 30.0,
                    //           // Adjust width as needed
                    //         ))),
                    //     ElevatedButton(
                    //       onPressed: () {
                    //         // Sign-in logic goes here
                    //       },
                    //       style: ButtonStyle(
                    //         backgroundColor:
                    //             WidgetStateProperty.all(Colors.white),
                    //         shape: WidgetStateProperty.all<CircleBorder>(
                    //           CircleBorder(),
                    //         ),
                    //         padding: WidgetStateProperty.all<EdgeInsets>(
                    //           EdgeInsets.all(
                    //               10), // Adjust the padding to increase the size
                    //         ),
                    //       ),
                    //       child: ClipOval(
                    //           child: Image.network(
                    //         'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAdVBMVEUKZsL///8AZME7eMgAWb7i6fUAXL/Az+oAYsFjj9B1m9QAYMBGgswAVr0AXb8AWr5ZjdBWh80ZbMTO3PCzx+drl9T2+f2Ssd7G1u0dbsXF1e3w9fs2dsfl7ffV4fIocsaApNmowOSMrNyrw+Wbt+AAUryFqNr2AL+0AAADz0lEQVR4nO3ca1+qMACAcZiA5ATMW+a98vT9P+LROkXiNruMLXae/2v1xyOy6QCjCAAAAAAAAAAAAAAAAAAAALBGnPjeiPbkZSJ36/W4qmSQlbIYTTfxyXx72CXBNYpkv4o/mAwDayx7m7hhWoWUWM2afUebcTiJ5UAReDweo1AS5VAZeNyLgXxQhZxrCo/Hou+NsyJ70AXGcS+EnSgifWC8SHxvngXyzlAYhzCeJqmp8FH63r4fE8IUGC+6P9YI3VTxatP9AzFXz/bvCt8b+GNyT2HX5aov3UEVip4xMO3+SBNlxsJp6Xv7fq5amApn3Z/xzQfivAzgW1tUrPSFDwF8SM1zfiDLisUk5KPwREjN5/QpgKnilbhXrmP0uz/bvxPR9jLwEFDgacm7+Ut/c5v53ijLSvHw4WhMB0Xue4usE2U1vOtv03Qy3e+S8PpeCJlVSZKVgcyCAIDfT+SyrI6Ok0+As4+QVbGbHabLxWTRf7qb7YrMa6XIdZpbpX3k2QPzSuyXjV8rk8dd4i1SjG90bs+3SQx1D7yvH5gnt0vlr830ufK06mNYMW2cl8nUm370/laIYmQ4W3covSwaGAob68FZ/1phudOuiLyYDwoPu9FeoSiejX0nE+H+Z4u1QiHNO/DVfOh8hdJWYT42LLx+NHN9XtlSoVxrL8tpGjheILFTqFmvU7txO6RaKZT5Jz+ir9xeiWSl8M9nBpnayunVqzYKh9eniXNTl8vpVvbhFwOP74nDadFG4RdGmbeXdriibqPwG2budqKnQofXQHgqjIfOhlNfhX1nX958FcaZq53ordDZOXRvhVNXX8DtF87TNP3EDLlyNZpaLlwOxkWSJIWYXX20q4vIrRY+jat/S4tCVmPjBWXuDkSLhave2V02ojDeBxAfHK1n2CvcZs1vYhcXQJxZOhpqrBWqvofpr7fSPOE3F84vTgKcXvze9AxHvy9sFY6U40Zleo6jMxmWChfqHWK8n8PRdGGpULe4lBiWqHZdKtzqRg3TkxwtudkpfNbN3tKwSNWpQu0hJQyrVF0q3GgHftPNcV0qXOp/sBdhFBou6jcMpl0qNNxrmlz8XUMnC/fBFw7067uGG40ptITCGoVqFLaPwhqFahS2j8IahWoUto/CGoVqFLaPwhqFahS2j8IahWoUto/CGoVqFLaPwhqFahS2j8IahWoUto/CGoVqFLaPwlqAhc1/4NHfx2Qq9H7lXhT1dNaNf1HqDc/djt4YrroXa+3rtx1Wb4PWlQfq/zPrWy8PAAAAAAAAAAAAAAAAAAAA4D/0F5lQSZ+5G/qbAAAAAElFTkSuQmCC',
                    //         height: 30.0, // Adjust height as needed
                    //         width: 30.0,
                    //         // Adjust width as needed
                    //       )),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 16.0),
                    RichText(
                      text: new TextSpan(
                        text: 'Dont Have an Account ?.. ',
                        style: TextStyle(color: Colors.black),
                        //style: ,
                        children: <TextSpan>[
                          new TextSpan(
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return Signup();
                                  },
                                ));
                              },
                            text: ' Create One',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      Navigator.push(context, MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return HomeScreen1();
        },
      ));
    }
  }

  String? _validatePassword(String password) {
    // Reset error message
    _errorMessage = '';

    // Password length greater than 6
    if (password.length < 6) {
      _errorMessage += 'Password must be longer than 6 characters.\n';
    }

    // Contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      _errorMessage += '• Uppercase letter is missing.\n';
    }

    // Contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessage += '• Lowercase letter is missing.\n';
    }

    // Contains at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      _errorMessage += '• Digit is missing.\n';
    }

    // Contains at least one special character
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]$'))) {
      _errorMessage += '• Special character is missing.\n';
    }
    setState(() {});
    // If there are no error messages, the password is valid
    return _errorMessage.isEmpty ? null : _errorMessage;
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      _emailErrorMessage = 'Email cannot be empty';
      return _emailErrorMessage;
    }
    if (!EmailValidator.validate(email)) {
      _emailErrorMessage = 'Enter a valid email address';
      return _emailErrorMessage;
    }
    // _emailErrorMessage = '';

    return _emailErrorMessage;
  }

  Widget iicon() {
    if (isshow) {
      return GestureDetector(
        child: Icon(Icons.remove_red_eye_outlined),
        onTap: () {
          isshow = false;
          setState(() {});
        },
      );
    } else {
      return GestureDetector(
        child: Icon(Icons.visibility_off_outlined),
        onTap: () {
          isshow = true;
          setState(() {});
        },
      );
    }
  }

  Future<void> getdata() async {
    prefs = await SharedPreferences.getInstance();
    String? temp = prefs.getString("user");
    if (temp != null) {
      tempUser = UserModel.fromJson(json.decode(temp));
      _emailController.text = tempUser.userName ?? "";
      _passwordController.text = tempUser.password ?? "";
    }

    setState(() {});
  }
}