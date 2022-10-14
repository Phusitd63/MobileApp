// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Provider/transac_provide.dart';
import 'package:flutter_application_4/model/model.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final detailController = TextEditingController();
  final numController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Detail Code"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 1, 7, 11))),
                          labelText: "Code Name",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 3, 6, 0))),
                      autofocus: true,
                    ),
                    TextFormField(
                      controller: detailController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a Detail About Code";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 5, 18, 29))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 9, 20, 30))),
                          labelText: "Detail",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: numController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a Num Code";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 12, 14, 15))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 7, 10, 13))),
                          labelText: "Code Number ",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 2, 16, 28))),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: dateController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a Deal Date of Code";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 19, 24, 29))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 18, 23, 27))),
                          labelText: "Deal Date",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 2, 20, 34))),
                      keyboardType: TextInputType.text,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var name = nameController.text;
                            var detail = detailController.text;
                            var num = numController.text;
                            var date = dateController.text;
                            Model inputModel = Model(
                              name,
                              detail,
                              num,
                              date,
                            );
                            var provider = Provider.of<TransacProvide>(context,
                                listen: false);
                            provider.addModel(inputModel);
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(color: Colors.amber)),
                        child: const Text(
                          "Submit",
                        ))
                  ],
                )),
          ),
        ));
  }
}
