// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_4/Provider/transac_provide.dart';
import 'package:flutter_application_4/model/model.dart';
import 'package:provider/provider.dart';

class FormEditScreen extends StatefulWidget {
  final Model data;

  //Controller

  const FormEditScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<FormEditScreen> createState() => _FormEditScreenState();
}

class _FormEditScreenState extends State<FormEditScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final detailController = TextEditingController();
  final numController = TextEditingController();
  final dateController = TextEditingController();

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    detailController.text = widget.data.detail.toString();
    numController.text = widget.data.num.toString();
    dateController.text = widget.data.date.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Editting..."),
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
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Code Name",
                          labelStyle: TextStyle(color: Colors.blue)),
                      autofocus: true,
                    ),
                    TextFormField(
                      controller: detailController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a type";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Detail",
                          labelStyle: TextStyle(color: Colors.blue)),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: numController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a Description";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Code Number ",
                          labelStyle: TextStyle(color: Colors.blue)),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: dateController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform a Description";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Deal Date",
                          labelStyle: TextStyle(color: Colors.blue)),
                      keyboardType: TextInputType.text,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var name = nameController.text;
                            var detail = detailController.text;
                            var num = numController.text;
                            var date = dateController.text;
                            Model inputModel = Model(name, detail, num, date);
                            var provider = Provider.of<TransacProvide>(context,
                                listen: false);
                            provider.updateModel(inputModel);
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(color: Colors.amber)),
                        child: const Text(
                          "update",
                        ))
                  ],
                )),
          ),
        ));
  }
}
