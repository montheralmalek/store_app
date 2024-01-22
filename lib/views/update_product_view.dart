import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/functions.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_sevice.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';

class UpdateProductView extends StatefulWidget {
  const UpdateProductView({
    super.key,
    //required this.product,
  });
  static String id = 'Update Product';

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptioController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final GlobalKey<FormState> _formKeyState = GlobalKey();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    _titleController.text = product.title;
    _descriptioController.text = product.description;
    _priceController.text = product.price.toString();
    _imageController.text = product.img;
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
          appBar: AppBar(
            title: Text(UpdateProductView.id),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _formKeyState,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      maxlines: null,
                      controller: _titleController,
                      labeltext: 'Title',
                      prefixicon: const Icon(Icons.title),
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      maxlines: null,
                      controller: _descriptioController,
                      labeltext: 'Description',
                      prefixicon: const Icon(Icons.description),
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      controller: _priceController,
                      labeltext: 'Price',
                      inputType: TextInputType.number,
                      prefixicon: const Icon(Icons.price_change),
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      maxlines: null,
                      controller: _imageController,
                      labeltext: 'Image URL',
                      prefixicon: const Icon(Icons.image),
                    ),
                    const Gap(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: CustomButton(
                            onPressed: () async {
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                await UpdateProduct().update(
                                  productId: product.id,
                                  title: _titleController.text.trim().isEmpty
                                      ? null
                                      : _titleController.text.trim(),
                                  description:
                                      _descriptioController.text.trim().isEmpty
                                          ? null
                                          : _descriptioController.text.trim(),
                                  price: _priceController.text.trim().isEmpty
                                      ? null
                                      : double.parse(
                                          _priceController.text.trim()),
                                  img: _imageController.text.trim().isEmpty
                                      ? null
                                      : _imageController.text.trim(),
                                );
                                if (!context.mounted) return;
                                showMessage(context,
                                    'The product Updated successfully');
                              } on Exception catch (e) {
                                showMessage(context, e as String);
                              }
                              setState(() {
                                _isLoading = false;
                              });
                            },
                            text: const Text('Submit'),
                            icon: const Icon(Icons.save),
                          ),
                        ),
                        const Gap(10),
                        SizedBox(
                          width: 150,
                          child: CustomButton(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: const Text('Cancel'),
                            icon: const Icon(Icons.cancel),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
