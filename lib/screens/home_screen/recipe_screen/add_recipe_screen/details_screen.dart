import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/shared/constants.dart';
import 'package:recipe_app/widgets/custom_divider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Column(
            children: [
              const Text('Recipe Name'),
              const CustomDivider(),
              Row(
                children: [
                  const Spacer(),
                  const Icon(Icons.restaurant),
                  Text(RxString('n servings').value),
                  const Spacer(),
                  const Icon(Icons.timelapse),
                  const Text('n minutes'),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  children: const [Center(child: Text('listview'))],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              const Text('Tags'),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Row(
                  children: [
                    Flexible(
                        child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        Chip(
                          label: Text('Press to add'),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Chip(
                          label: Text('Vegan'),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Chip(
                          label: Text('Vegetarian'),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Chip(
                          label: Text('Dairy free'),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Chip(
                          label: Text('Chicken'),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Flexible(
                        child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        Chip(
                          label: Text('Snack'),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      backgroundColor: colorBrown,
                    )),
              )
            ],
          )),
    );
  }
}
