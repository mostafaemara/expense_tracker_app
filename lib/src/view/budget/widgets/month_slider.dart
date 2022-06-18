import 'dart:developer' as dev;
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthSlider extends StatefulWidget {
  const MonthSlider(
      {Key? key, required this.initMonth, required this.onChanged})
      : super(key: key);

  final int initMonth;
  final void Function(int) onChanged;
  @override
  State<MonthSlider> createState() => _MonthSliderState();
}

class _MonthSliderState extends State<MonthSlider> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 10))
        .then((value) => buttonCarouselController.jumpToPage(widget.initMonth));

    super.initState();
  }

  final buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                buttonCarouselController.nextPage();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          Expanded(
            child: CarouselSlider.builder(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: 400,
                onPageChanged: (m, _) {
                  dev.log(m.toString());
                  widget.onChanged(m);
                },
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: DateTime.monthsPerYear,
              itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
                  SizedBox(
                child: Text(
                  DateFormat.MMM().format(DateTime(DateTime.now().year, i, 1)),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          IconButton(
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                buttonCarouselController.previousPage();
              },
              icon: Transform.rotate(
                  angle: pi, child: const Icon(Icons.arrow_back_ios))),
        ],
      ),
    );
  }
}
