class Person {
  final String name;
  final int number;
  final int id;
  final bool isDeifferent;

  Person( {required this.name, required this.number, required this.id, this.isDeifferent = false});
}

List<Person> pepole = [
  Person(name: 'Rana ', number: 1651615, id: 312),
  Person(name: 'Rana ', number: 1651615, id: 25),
  Person(name: 'Rana ', number: 1651615, id: 31252),
  Person(name: 'Rana ', number: 1651615, id: 2),
  Person(name: 'Rana ', number: 1651615, id: 4),
  Person(name: 'Rana ', number: 1651615, id: 42, isDeifferent: true),
  Person(name: 'Rana ', number: 1651615, id: 245),
  Person(name: 'Rana ', number: 1651615, id: 254),
];
