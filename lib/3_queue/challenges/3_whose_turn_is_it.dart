//! Challenge 3: Whose Turn Is It?
// Imagine that you are playing a game of Monopoly with your friends. The problem is that everyone always forgets whose turn it is! Create a Monopoly organizer that always tells you whose turn it is. Below is an extension method that you can implement:

import 'package:data_structures_and_algorithms/3_queue/queue_ring_buffer_impl.dart';

extension BoardGameManager<E> on QueueRingBufferImpl {
  E? nextPlayer() {
    final E person = dequeue();
    if (person != null) {
      enqueue(person);
    }
    return person;
  } 
}

void main() {
  final QueueRingBufferImpl<String> monopolyTurn = QueueRingBufferImpl<String>(4)
    ..enqueue('Ray')
    ..enqueue('Vicki')
    ..enqueue('Luke')
    ..enqueue('Pablo');
  String? player;
  for (var i = 1; i <= 20; i++) {
    player = monopolyTurn.nextPlayer();
    print(player);
  }
  print('$player wins!');
}