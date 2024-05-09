import 'package:big_form_app/cubits/form/form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedItem = '';

  @override
  void initState() {
    context.read<FormCubit>().loadItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form with Cubit'),
      ),
      body: BlocBuilder<FormCubit, MyFormState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  children: [
                    ...state.items.map(
                      (e) {
                        return DropdownButtonFormField<String>(
                          value: null,
                          items: e.values.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            context.read<FormCubit>().onSelectedItemChanged(
                                  id: e.id,
                                  newValue: newValue,
                                );
                          },
                          hint: const Text('Select an item'),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
