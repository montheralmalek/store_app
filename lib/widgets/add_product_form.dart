import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit_states.dart';
import 'package:store_app/helper/functions.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_dropdown_menu.dart';
import 'package:store_app/widgets/custom_textfield.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({
    super.key,
  });

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptioController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final GlobalKey<FormState> _formKeyState = GlobalKey();
  String categoryValue = '';
  bool _isLoading = false;
  List<String> categoryList = [];

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      dismissible: _isLoading,
      child: Form(
        key: _formKeyState,
        // autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              validator: emptyValidate,
              maxlines: null,
              controller: titleController,
              labeltext: 'Title',
              prefixicon: const Icon(Icons.title),
            ),
            const Gap(10),
            CustomTextFormField(
              validator: emptyValidate,
              maxlines: null,
              controller: descriptioController,
              labeltext: 'Description',
              prefixicon: const Icon(Icons.description),
            ),
            const Gap(10),
            CustomTextFormField(
              validator: emptyValidate,
              controller: priceController,
              labeltext: 'Price',
              inputType: TextInputType.number,
              prefixicon: const Icon(Icons.price_change),
            ),
            const Gap(10),
            CustomTextFormField(
              validator: emptyValidate,
              maxlines: null,
              controller: imageController,
              labeltext: 'Image URL',
              prefixicon: const Icon(Icons.image),
            ),
            const Gap(10),
            BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesStates>(
              builder: (context, state) {
                if (state is GetAllCategoriesLoadedState) {
                  categoryList.clear();
                  for (var item in state.categoriesList!) {
                    categoryList.add(item.name);
                  }
                  return CustomDropdownMenu(
                    label: 'category',
                    list: categoryList,
                    onPressed: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        categoryValue = value!;
                      });
                    },
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: const CircularProgressIndicator(),
                  );
                }
              },
            ),
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    onTap: () async {
                      if (_formKeyState.currentState!.validate() &&
                          categoryValue.isNotEmpty) {
                        try {
                          setState(() {
                            _isLoading = true;
                          });
                          await AddProduct().add(
                            title: titleController.text.trim(),
                            description: descriptioController.text.trim(),
                            price: double.parse(priceController.text.trim()),
                            img: imageController.text.trim(),
                            category: categoryValue,
                          );
                          if (!context.mounted) return;
                          showMessage(
                              context, 'The product added successfully');
                        } on Exception catch (e) {
                          showMessage(context, e as String);
                        }
                      }
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    text: const Text('Save'),
                    icon: const Icon(Icons.save),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Gap(10),
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    text: const Text('Cancel'),
                    icon: const Icon(Icons.cancel),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
