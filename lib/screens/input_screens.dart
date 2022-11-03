import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {
      'name': 'Jons',
      'last_name': 'Domz',
      'email': 'email@example.com',
      'password': '123456',
      'role': 'Admin'
    };

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs & Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomInputField(
                    labelText: 'Name',
                    hintText: 'User name',
                    formProperty: 'name',
                    referencedMap: formValues),
                const SizedBox(height: 20),
                CustomInputField(
                    labelText: 'Lastname',
                    hintText: 'User lastname',
                    formProperty: 'last_name',
                    referencedMap: formValues),
                const SizedBox(height: 20),
                CustomInputField(
                    labelText: 'Email',
                    hintText: 'User email',
                    keyboardType: TextInputType.emailAddress,
                    formProperty: 'email',
                    referencedMap: formValues),
                const SizedBox(height: 20),
                CustomInputField(
                    labelText: 'Password',
                    hintText: 'User password',
                    formProperty: 'password',
                    referencedMap: formValues,
                    obscureText: true),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(child: Text('Admin'), value: 'Admin'),
                      DropdownMenuItem(
                          child: Text('SuperUser'), value: 'SuperUser'),
                      DropdownMenuItem(
                          child: Text('Sr. Developer'), value: 'Sr. Developer'),
                      DropdownMenuItem(
                          child: Text('Jr. Developer'), value: 'Jr. Developer'),
                    ],
                    onChanged: (value) {
                      formValues['role'] = value ?? 'Admin';
                    }),
                ElevatedButton(
                    child: const SizedBox(
                      child: Center(child: Text('Save')),
                      width: double.infinity,
                    ),
                    onPressed: () {
                      //FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(FocusNode());

                      if (!formKey.currentState!.validate()) {
                        print('No valid form');
                        return;
                      }

                      print(formValues);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
