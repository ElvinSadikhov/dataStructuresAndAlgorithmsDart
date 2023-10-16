//! Challenge 1: Prioritize a Waitlist
// Your favorite concert was sold out. Fortunately, there’s a waitlist for people who still want to go! However, ticket sales will first prioritize someone with a military background, followed by seniority.

import 'package:data_structures_and_algorithms/10_priority_queue/priority_queue_heap_impl.dart';

import '../../3_queue/base/queue.dart';

class Person implements Comparable<Person> {
  final String name;
  final int age;
  final bool isMilitary;

  Person({
    required  this.name, 
    required  this.age, 
    required  this.isMilitary,
  });

  @override
  int compareTo(Person other) {
    if (isMilitary == other.isMilitary) return age.compareTo(other.age);
    return isMilitary ? 1 : -1;
  }

  @override
  String toString() {
    final military = (isMilitary) ? ', (military)' : '';
    return '$name, age $age$military';
  }
}

void main() {
  final Person person1 = Person(name: 'Josh', age: 21, isMilitary: true);
  final Person person2 = Person(name: 'Jake', age: 22, isMilitary: true);
  final Person person3 = Person(name: 'Clay', age: 28, isMilitary: false);
  final Person person4 = Person(name: 'Cindy', age: 28, isMilitary: false);
  final Person person5 = Person(name: 'Sabrina', age: 30, isMilitary: false);
  final waitlist = [person1, person2, person3, person4, person5];

  final Queue priorityQueue = PriorityQueueHeapImpl(elements: waitlist);
  while (!priorityQueue.isEmpty) {
    print(priorityQueue.dequeue());
  }
}