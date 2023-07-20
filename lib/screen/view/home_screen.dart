import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api_call/screen/contoller/home_controller.dart';
import 'package:quiz_api_call/screen/model/home_screen_model.dart';
import 'package:quiz_api_call/screen/model/model_2_mcq.dart';
import 'package:quiz_api_call/utils/api_helper.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<QuizModel?>(
          future: ApiHelper.apiHelper.Data(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              QuizModel? l1 = snapshot.data;
              List<String> quetion = [];
              List<Option> options = [];
              for (Results results in l1!.results!) {
                print("${results.incorrectAnswers![0]}");
                quetion.add(results.question!);
                options.add(Option(
                    a: results.incorrectAnswers![0],
                    b: results.correctAnswer!,
                    c: results.incorrectAnswers![1],
                    d: results.incorrectAnswers![2]));
              }
              return Center(
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.network(
                        "https://www.pexels.com/photo/two-books-beside-two-chalks-265076/",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Obx(
                          () => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${quetion[homeController.changeIndex.value]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          if (homeController.changeIndex < 9) {
                                            Get.snackbar(
                                                "true", "Your Answer Current....!",
                                                backgroundColor: Colors.blueGrey);
                                            homeController.changeIndex.value++;
                                          }
                                        },
                                        child: Container(
                                          child: Text(
                                            "${options[homeController.changeIndex.value].a}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          height: 50,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          if (homeController.changeIndex < 9) {
                                            Get.snackbar("Wrong",
                                                "Your Answer InCurrent....!",
                                                backgroundColor: Colors.redAccent);
                                            homeController.changeIndex.value++;
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${options[homeController.changeIndex.value].b}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap:(){
                                          if(homeController.changeIndex<9)
                                          {
                                            Get.snackbar("Wrong..", "Your Answer InCurrent....!",backgroundColor: Colors.redAccent);
                                            homeController.changeIndex.value++;
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(10)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${options[homeController.changeIndex.value].c}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          if(homeController.changeIndex<9)
                                          {
                                            Get.snackbar("Wrong..", "Your Answer InCurrent....!",backgroundColor: Colors.redAccent);
                                            homeController.changeIndex.value++;
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(10)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${options[homeController.changeIndex.value].d}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}