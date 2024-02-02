import 'package:flutter/material.dart';
import 'package:provid_example/fish_model.dart';
import 'package:provid_example/seafish_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                FishModel(name: 'salmon', number: 10, size: 'big')),
        ChangeNotifierProvider(
            create: (context) =>
                SeaFishModel(name: 'tuna', tunaNumber: 0, size: 'Middle')),
      ],
      child: MaterialApp(
        home: FishOrder(),
      ),
    );
  }
}

class FishOrder extends StatelessWidget {
  const FishOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish Order'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Fish name : ${Provider.of<FishModel>(context).name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            High(),
          ],
        ),
      ),
    );
  }
}

class High extends StatelessWidget {
  const High({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SpicyA is located at high place',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        SpicyA()
      ],
    );
  }
}

class SpicyA extends StatelessWidget {
  const SpicyA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Fish number : ${Provider.of<FishModel>(context).number}',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
        Text(
          'Fish Size : ${Provider.of<FishModel>(context).size}',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
        SizedBox(
          height: 20,
        ),
        Middle(),
      ],
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SpicyB is located at middle place',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        spicyB()
      ],
    );
  }
}

class spicyB extends StatelessWidget {
  const spicyB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Tuna number : ${Provider.of<SeaFishModel>(context).tunaNumber}',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
        Text(
          'Fish Size : ${Provider.of<SeaFishModel>(context).size}',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Provider.of<SeaFishModel>(context, listen: false)
                  .changeSeaFishNumber();
            },
            child: Text('sea fish number')),
        Low(),
      ],
    );
  }
}

class Low extends StatelessWidget {
  const Low({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SpicyC is located at low place',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        spicyC()
      ],
    );
  }
}

class spicyC extends StatelessWidget {
  const spicyC({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Fish number : ${Provider.of<FishModel>(context).number}',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
        Text(
          'Fish Size : ${Provider.of<FishModel>(context).size}',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Provider.of<FishModel>(context, listen: false).chnageFishNumber();
            },
            child: Text('change fish number'))
      ],
    );
  }
}
