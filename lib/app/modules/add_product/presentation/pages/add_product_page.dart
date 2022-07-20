import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../model/product_model.dart';
import '../controller/product_controller.dart';

class ProductPage extends StatefulWidget {
  ProductModel? model;
  ProductPage({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ModularState<ProductPage, ProductController> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.model != null) controller.setProduct(widget.model!);
    controller.setRating(
        widget.model == null ? '0' : widget.model!.rating.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.title = '';
    controller.price = 0.0;
    controller.pickdFile = null;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          controller.model!.title == null
              ? 'Adicionar novo produtor'
              : 'Editar produto',
          textAlign: TextAlign.center,
        ),
        actions: [
          if (controller.model!.title != null)
            IconButton(
              onPressed: () => _showDialog(),
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: controller.pickdFile != null
                          ? Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ClipRRect(
                                child: Image.file(
                                  File(controller.pickdFile!.path!),
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            )
                          : controller.model!.title != null
                              ? SizedBox(
                                  height: 150,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    child: Image.network(
                                      controller.model!.filename == ''
                                          ? 'https://firebasestorage.googleapis.com/v0/b/agrosmarttest-2c3c1.appspot.com/o/files%2F0.jpg?alt=media&token=8bbfbd19-26fa-4bda-a7f3-fad0f072cdf9'
                                          : controller.model!.filename
                                              .toString(),
                                      fit: BoxFit.cover,
                                      frameBuilder:
                                          (_, image, loadingBuilder, __) {
                                        if (loadingBuilder == null) {
                                          return const SizedBox(
                                            height: 200,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }
                                        return image;
                                      },
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                )
                              : Container(),
                    ),
                    TextButton.icon(
                      onPressed: controller.selectFile,
                      icon: const Icon(Icons.upload),
                      label: Text(controller.model!.title == null
                          ? 'Adicionar imagem'
                          : 'Adicionar nova imagem'),
                    ),
                    TextFormField(
                      initialValue: controller.model!.title,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Titulo',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite o titulo do produto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.setTitle(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: controller.model!.price == null
                          ? ''
                          : controller.model!.price.toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Preço',
                      ),
                      onChanged: (value) {
                        controller.setPrice(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite o preço';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: controller.model!.type,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tipo',
                      ),
                      onChanged: (value) {
                        controller.model!.type = value;
                        controller.setType(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite o tipo do produto';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: controller.model!.rating == null
                          ? ''
                          : controller.model!.rating.toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Avaliação',
                      ),
                      onChanged: (value) {
                        controller.setRating(value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => Modular.to.pop(),
                          child: const Text('cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (controller.pickdFile == null) {
                              if (_formKey.currentState!.validate()) {
                                controller.onSave();
                                onSucess();
                              }
                            } else {
                              if (_formKey.currentState!.validate()) {
                                if (controller.sucessUpload == false) {
                                  onLoading();
                                }
                                await controller.uploadFile();
                                controller.onSave();
                                Modular.to.pop();
                                Modular.to.pop();
                              }
                            }
                          },
                          child: const Text('salvar'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Deseja excluir o produtor?'),
          content: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.model!.delete().then(
                      (value) {
                        onSucessDelete();
                      },
                    );
                  },
                  child: const Text('sim'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: const Text('nao'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void onLoading() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: SizedBox(
            height: 82.0,
            width: 82.0,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 8.0,
            ),
          ),
        );
      },
    );
  }

  void onSucess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: SizedBox(
            height: 82.0,
            width: 82.0,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 8.0,
            ),
          ),
        );
      },
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Modular.to.navigate('/');
      },
    );
  }

  void onSucessDelete() {
    Future.delayed(
      const Duration(microseconds: 500),
      () {
        Modular.to.navigate('/');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            content: Text(
              'Produtor deletado com sucesso!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
