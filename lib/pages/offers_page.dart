import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(
          title: '7.7 Sale',
          description: 'Get 7.7% off your first order',
        ),
        Offer(
          title: '7.7 Sale',
          description: 'Get 7.7% off your first order',
        ),
        Offer(
          title: '7.7 Sale',
          description: 'Get 7.7% off your first order',
        ),
        Offer(
          title: '7.7 Sale',
          description: 'Get 7.7% off your first order',
        ),
        Offer(
          title: '7.7 Sale',
          description: 'Get 7.7% off your first order',
        ),
        Offer(
          title: '7.7 Sale',
          description: 'Get 7.7% off your first order',
        ),
        Offer(
          title: '7.7 Sale',
          description: 'Get 7.7% off your first order',
        ),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String description;

  const Offer({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Card(
          color: Colors.brown.shade100,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage(
              //     'images/background.png',
              //   ),
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
