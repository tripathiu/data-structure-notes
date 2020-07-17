# Singly and Doubly Linked List

## What is a linked list?

Sequential list of nodes that hold data which point to other nodes also containing data

```
D->D->D->D->NULL
```

## Where are they used?

1. List, Queue, Stack implementations
1. Circular Lists
1. Model real world objects like trains
1. Separate chaining, which is present certain hashtable implementations to deal with hashing collisions
1. Implementation adjacency lists for graphs

## Terminology

**HEAD**: First node 
**TAIL**: Last node 
**POINTER**: Refernce to another node 
**NODE**: An object containding data and pointer(s).

```
D->D->D->D->D->D
H   P    N  N  T
```

## Singly vs Doubly LL

### Singly

Pointer to only Next node

Pro: Less memory, Simple Implementation

Cons: Cannot easily access previous elements

### Double

Pointer to Previous and next node

Pros: Backward traverse

Cons: Takes 2s Memory


## Implementation

### Insert Singly

```
D1->D2->D3->D4

Add D5 after D2

D1->D2\ D3->D4
      | ^
      \->D5
```

### Insert Doubly

```
D1<->D2<->D3<->D4

Add D5 after D2

D1<->D2<-\ D3<->D4
         | ^v
         \->D5

```

### Remove Singly

```
D1->D2->D3->D4

Remove D2

D1-\ D2 /->D3->D4
    ----
```

## Complexity Analysis

| Operation | Singly | Doubly |
|-----------|--------|--------|
| Search    | O(n)   | O(n)   |
| Ins @ H   | O(1)   | O(1)   |
| Ins @ T   | O(1)   | O(1)   |
| Rm @ H    | O(1)   | O(1)   |
| Rm @ T    | O(n)   | O(1)   |
| Rm in mid | O(n)   | O(n)   |

Rm @ T is o(n) because we have to find the tail in Singly


# Code Notes

```
Class Node

Data:
private
T data
int size;
Node* prev, next
Node* head=null, tail=null

Methods:
clear()
bool isEmpty()
addLast(T elem)
addFirst(T elem)
peekFirst()
peekLast()
rmFirst()
rmLast()
private rm(Node<T> node)
```
