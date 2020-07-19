# Queue

## What is a Queue?

A linear data structure that models a real world queue.
Two operations:

- Enqueue
- Dequeue

```
D1<-\
     -D2<-D3<-D4<-
                  \-D5
```

Here,

* `D1` is being Dequeued
* `D5` is being Enqueued

`Dequeue()` Remove from the front of the Queue
`Enqueue(12)` Add 12 to the end of the Queue

## When and where are they used

1. Real world queues (lines)
1. Efficiently keep track of x most recently added elements
1. Web server request management where you want to implement first come first serve basis
1. BFS graph traversal

## Complexity Analysis

| Operation | Complexity |
|-----------|------------|
| Enqueue   | O(1)       |
| Dequeue   | O(1)       |
| Peeking   | O(1)       |
| Contains  | O(n)       |
| Removal   | O(n)       | 
| IsEmpty   | O(1)       |

## Queue BFS example

### Breadth First Search in a Graph (BFS)

Notes:

All the neighbours of the current nodes are enqueued

```
Q.enq(starting_node)
starting_node.visited=true

while Q isNotEmpty do
  node = Q.deq()
  for neighbour in neighbours(node):
    if neighbour has not been visited:
       neighbour.visited = true
       Q.enq(neighbour)
```

# Implementation of Queues

Use Arrays, Singly Linked List, Doubly Linked List

## Add (enqueue) using singly linked list

Push tail to new element

## Remove (dequeue) using singly linked list

Push head forward to next element


# Code Implementation of Queue (Notes)

```
LinkedList()

Queue()
Queue(T firstEl)
int size()
T peek()
poll // dequeue
offer // enqueue
```
