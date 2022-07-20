import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../add_product/model/product_model.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.getListUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgroSmart'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed("/product"),
            icon: const Icon(
              Icons.add_circle,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.userList!.hasError) {
            return Center(
              child: ElevatedButton(
                onPressed: controller.getListUser,
                child: const Text('Error'),
              ),
            );
          }
          if (controller.userList!.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ProductModel> list = controller.userList!.data;
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 4);
            },
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: ((context, index) {
              ProductModel model = list[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () {
                      Modular.to.pushNamed("/product", arguments: model);
                    },
                    title: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 6.0, right: 8.0),
                              child: SizedBox(
                                height: 90,
                                width: 90,
                                child: ClipRRect(
                                  child: Image.network(
                                    model.filename == ''
                                        ? 'https://firebasestorage.googleapis.com/v0/b/agrosmarttest-2c3c1.appspot.com/o/files%2F0.jpg?alt=media&token=8bbfbd19-26fa-4bda-a7f3-fad0f072cdf9'
                                        : model.filename.toString(),
                                    fit: BoxFit.cover,
                                    frameBuilder:
                                        (_, image, loadingBuilder, __) {
                                      if (loadingBuilder == null) {
                                        return const SizedBox(
                                          child: Center(
                                            child: CircularProgressIndicator(),
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
                              ),
                            ),
                            Text(
                              model.created!,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 80.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: mediaQuery.size.width * 0.4,
                                      child: AutoSizeText(
                                        model.title!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    Text(
                                      model.type!,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: getListRating(model.rating!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: mediaQuery.size.height * 0.17,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.more_horiz,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "R\$${model.price.toString()}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  List<Widget> getListRating(int rating) {
    List<Widget> listRating = [];
    for (var i = 0; i < 5; i++) {
      listRating.add(
        Icon(
          Icons.star,
          color: i < rating ? const Color(0xffffd700) : Colors.grey,
        ),
      );
    }

    return listRating;
  }
}
