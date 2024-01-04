import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store_app/widgets/category_card_widget.dart';

class ImageCarouselSlider extends StatefulWidget {
  const ImageCarouselSlider({
    super.key,
    required this.imageList,
  });

  final List imageList;
  @override
  State<ImageCarouselSlider> createState() => _ImageCarouselSliderState();
}

class _ImageCarouselSliderState extends State<ImageCarouselSlider> {
  final CarouselController _carouselController = CarouselController();

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      // color: Colors.amber,
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.imageList.length, //state.categoriesList!.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: CategoryCardWidget(
              categories: widget.imageList[itemIndex],
              width: double.infinity,
              circularRadius: 10,
            ),
          ),
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary)
                      .withOpacity(current == entry.key ? 0.95 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
