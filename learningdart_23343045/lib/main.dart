import 'package:flutter/material.dart';


String getFullName(String firstName, String lastName) =>
  '$firstName $lastName';

String printMyName() {
  return '';
}
void main() {
  runApp(const MyApp());
}

// if else
// void test() {
//   final name = 'Foo isra';

//   if(name == 'Foo isra') {
//     print('yes this is foo isra');
//   } else if(name != 'Bar'){
//     print('This value is not a bar');
//   } else{
//     print("i don't know what is this");
//   }
// }


// operator
// void test(){
//   final name = 'Foo Bar Baz';
//   final nameTimes100 = name * 100;
//   print(nameTimes100);
// }


// list in dart
// void test() {
//   var names = ['Foo', 'Bar', 'Baz'];
//   print(names.length);
//   names.add('My name');
//   print(names.length);
// }


// sets in dart
// void test(){
//   const things = {'foo', 1};
//   things.add('value');
//   things;
// }

// maps in dart
// void test() {
//   var person = {
//     'name': 'Foo',
//     'age': 30,
//     'country': 'Bangladesh',
//   };

//   print(person);
//   person['lastname'] = 'diaz';
//   print(person);
// }


// making any type nullable
// void test() {
//   List<String?>? names = ['foo', 'bar', null];
//   names = null; 
// }

// cherry-picking non-null values
// void test(String? firstName, String? middleName, String? lastName){
//   final firstNonNullValue = firstName ?? middleName ?? lastName ?? 'no name';
// }

// null-aware assignment operator
// void test(String? firstName, String? middleName, String? lastName){
//   String? name = firstName;
//   name ??= middleName;
//   name ??= lastName;

//   print(name);
// }


// conditional invocation
// void test(List<String>? names){
//   names?.add('Baz');
// }


// enumerations
// enum PersonProperties {firstName, lastName, age}


// void test() {
//    print(PersonProperties.firstName);
// }


// switch statement
// enum AnimalType {cat, dog, bunny}

// void makeSureThisisCat(AnimalType animalType) {
//   switch (animalType) {
//     case AnimalType.cat:
//       print('This is a cat');
//       break;
//     case AnimalType.dog:
//       print('This is a dog');
//       break;
//     case AnimalType.bunny:
//       print('This is a bunny');
//       break;
//   }

//   print('function is finished');
// }


// classes

// const firstName = '';
// const lastName = '';

// class Person{

//   void run() {
//     print('Running');
//   }

//   void breathe() {
//     print('Breathing');
//   }
// }


// void test() {
//   final person = Person();
//   person.run();
//   person.breathe();
// }



// objects
// class Person{

//   void run() {
//     print('Running');
//   }

//   void breathe() {
//     print('Breathing');
//   }
// }


// void test() {
//   final foo = Person();
// }



// constructor

// class Person {
//   final String firstName;
//   final String lastName;

//   Person(this.firstName, this.lastName);
// }


// methods
// class Person {
//   final String firstName;
//   final String lastName;
//   final String name;

//   Person(this.firstName, this.lastName, this.name);

//   void printName() {
//     print(name);
//   }
// }

// void test(){
//   final person = Person('Foo', 'Bar', 'Foo Bar');
//   person.printName();
// }



// inheritance and subclassing

// class LivingThing{
//   void breathe() {
//     print('Breathing');
//   }
//   void move() {
//     print('Moving');
//   }
// }

// class Cat extends LivingThing {
//   void meow() {
//     print('Meow');
//   }
// }

// void test() {
//   final cat = Cat();
//   cat.breathe();
//   cat.move();
//   cat.meow();
// }



// Abstract Classes
// abstract class LivingThing{
//   void breathe() {
//     print('Breathing');
//   }
//   void move() {
//     print('Moving');
//   }
// }

// class cat extends LivingThing{}

// void test() {
//   final fluffer = cat();
// }



// Factory Constructor
// class Cat{
//   final String name;
//   Cat(this.name);
//   factory Cat.fluffball() {
//     return Cat('Fluffball 2');
//   }
// }



// custom operator
// class Cat extends Object{
//   final String name;
//   Cat(this.name);

//   @override
//   bool operator == (covariant other) {
//     if(other is Cat) {
//       return name == other.name;
//     }
//     return false;
//   }

//   @override
//   int get hashCode => name.hashCode;
// }



// // extensions
// class Person {
//   final String firstName;
//   final String lastName;
  
//   Person(this.firstName, this.lastName);
// }

// extension FullName on Person {
//   String get fullName =>  '$firstName $lastName';
// }


// class Cat {
//   final String name;
//   Cat(this.name);
// }

// extension Run on Cat{
//   void run() {
//     print('cat $name is running');
//   }
// }



// // future
// Future<int> heavyFutureThatMultipliesByTwo(int a) {
//   return Future.delayed(const Duration(seconds: 2), () => a * 2);
// }

// void test() {}


// async / await

// Future<int> heavyFutureThatMultipliesByTwo(int a) {
//   return Future.delayed(const Duration(seconds: 2), () => a * 2);
// }

// void test() async {
//   final result = await heavyFutureThatMultipliesByTwo(10);
//   print(result);
// }



// // Streams
// Stream<String> getName() {
//   return Stream.periodic(const Duration(seconds: 1), (value) => 'Foo');
// }


// void test() async {
//   await for (final value in getName()) {
//     print(value);
//   }
//   print('Stream finished working');
// }



// // generators
// Iterable<int> getOneTwoThree() async* {
//   yield 1;
//   yield 2;
//   yield 3;
// }

// void test(){
//   for (final value in getOneTwoThree()) {
//     print(value);
//     if (value == 2) {
      
//     }
//   }
// }


// // Generics
// class Pair<A, B> {
//   final A value1;
//   final B value2;
//   Pair(this.value1, this.value2);
// }


// void test() {
//   final names = Pair('foo', 20);
//   names;
// }






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
