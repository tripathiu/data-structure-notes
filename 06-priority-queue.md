# Priority Queue (with an interlude on heaps)

## What is a PQ?

Abstract data type that operates similar to a normal queue except that each
element has a certain priority. The priority of the elements in the PQ
determine the order in which elements are removed from the PQ.

**Note:** Priority queues only support comparable data. Data inserted must have
a way to be *ordered*.

### Example 

Suppose all these values are inserted into a PQ with an ordering imposed on he
numbers to be from the least to greatest.

4,8,14,3,1,22

```c
poll() // remove the element that has highest priority in the PR (1)
add(2) // add 2 to the queue
poll() // 2 removed
add(4) // 4 added
poll() // removed 3
add(4) // 4 added again
add(4) // 4 added again
poll rest // 4,4,5,8,9,14,22
```

The output may or maynot be in order.

The only thing guarenteed is when poll() happens, it will give you the current
smallest (most priority) element

### How does the machine know which element has highest priority in the underlying PQ?

It uses something called Heap.

## What is heap?

A heap is a tree based data structure that satisfies the heap invariant (also
called heap property!): If A is a parent node of B, then A is ordered wrt B for
all nodes A, B in the heap.

#### Max Heap

Parent always greated than children

```
8
|-7
| |-3
| |-2
|
|-6
  |-5
```

#### Min Heap

Children always greated than parent

```
0
|-2
| |-4
| |-5
|
|-3
  |-6
  |-4

```

#### Notes on the above discussion

* They must always follow **heap invariance**
* Both of these are binary structure. (Every node has exactly two children)
* They may have any number of branches
* PQ are sometimes called Heaps, but this is incorrect.
  * PQ are abstract data types.
  * Heaps form the canonical underlying structure of PQs
  * But PQs can be implemented with other data structures.
* All heaps must be trees
* May have multiple *root* nodes

## When and where are they used?

1. Used in certain implementations of DIjkstra's Shortest path algorithms.
1. Anythime you need the dynamically fetch the *next best*, or the *next worst* element.
1. Huffman coding, for lossless data compression.
1. Best First Search (BFS) algorithm such as A* use PQs to continuously grab the next most promising node
1. Used by Minimum Spanning Tree (MST) algorithms.

## Complexity Analysis

| Operation | Complexity |
|-----------|------------|
| Binary Heap Construction* | O(n)  |
| Polling | O(logn) |
| Peeking | O(1) |
| Adding | O(logn) |
| Naive Removing | O(n) (find items position, then remove) |
| Removing using hash maps | O(logn) |
| Naive contains | O(n) |
| Contains check using hash table | O(1) |

*There exists a method to construct a binary heap from an ordered array (not covered)

* When polling, adding, we need to reconstruct heap to get heap invariance.
* Using hashtable take up linear space and add some overhead

##  How to turn min PQ to Max PQ?

**Problem**: Often the STL of most languages only provide a min PQ.

Since elements in a PQ are comparable, the implement some sort of comparable
interface, which we can simple *negate* to achieve max PQ.

### Example

```
2,7,3,5,11,13
```

Let x, y be numbers in PQ, For a min PQ, if x<=y, then x comes of PQ before y,
so the negation of this if x>=y, then y comes of before x.

```
13,11,7,5,3,2
```

**Alternative:** for the numbers to negate the numbers as you insert thme into
the PQ and negate them when they are taken out.

```
2,7,5,3,13,11
-2,-7,-5,-3,-13,-11 //negate
// pop now
-13, -11, -7, -5, -3, -2 //smallest first (minPQ)
// negate output
13, 11, 7, 5, 3, 2 // Largest first (maxPQ)
```

#### Strings

Strings are compared using lexicographical comparator.

To convert `lex()` to `nlex()`...

```
lex(s1,s2) = -1, if s1<s2
lex(s1,s2) =  0, if s1=s2
lex(s1,s2) =  1, if s1>s2

nlex(s1,s2) = -(-1), if s1<s2
nlex(s1,s2) =     0, if s1=s2
nlex(s1,s2) =  -(1), if s1>s2
```

# Binary Heap PQ Implementation

## Adding elements to Binary Heap

Every parents value should be greator than children.

**Complete Binary Tree**: Every level, except possible the last is
completeley filled and all the nodes are as far left as possible..

## Binary Heap Implementation

Using **Array**.

```
Each node number here denote the index of an array:

      0        
     / \
    /   \
   1     2
  / \   / \
 3   4 5   6

The value in those indices

      7       
     / \
    /   \
   1     2
  / \   / \
 0   1 2   1

```

* Array implementation in elegant and fast.
* As you read elements from left to right, you are pacing the heap one layer at a time.

### Node Index

Let i be the parent node index

Left child index = 2i+1

Right child index = 2i+2

(Zero based)

It becomes easier to modify the heap.

## Adding elements to Binary Heap

We have:

```
       5
     /   \
    6     12
   / \    / \
  8   7  14  19
 / \  / 
13 12 11 

```

Instruction:

```
Insert(1) // Added next to 11
```

Swap elements until violation satisfied. Bubble up 1 until there is no
violation.

```
Insert(13) // Added in the next stop and swim up until no violation
Insert(4) // Same
Insert(0) // Same
```

## Removing elements to Binary Heap

In general, we remove the root element, this is called **Polling**.

We dont need to search for its index in an array implementation (its always
zero)

We have:

```
        10
      /    \
     /       \
    5          1
   / \         / \
  8   6       2    2
 / \  / \    / \  / \
13 12 11 7  2  15 3  1
```

Instructions:

```c
Poll()       // Implies remove the root
```

* Swap 10 with 1 (last index)
* Remove last node
* then bubble down until heap invariant is satisfied


```c
Remove(12)
```

* Start from root,
* Do a linear scan until 12 is found
* Swap it with last node
* Remove the last node
* Bubble up until heap invariant is satisfied.


```c
Remove(3)
```

* Start from root
* Do a linear scan until 3 is found
* Swap it with last node
* Delete the last node
* Bubble down if heap invarient is satified above, otherwise bubble up if heap invariant is satified below.

```c
Poll()
Remove(6)
```

**Note:**

*Polling* takes log time

*Removing* takes linear time

There is a better way using hash tables.

## Remove Elemenst From Binary Heap in O(log(n)

The inefficiency of the removal algorithm comes from the fact that we have to
perform a linear search to find out where an element is indexed at. What if we
did a lookup using a *Hashtable* to find out where a node is indexed at?

A *hashtable* provides constant time lookup and update for a mapping from a key
(the node value) to a value (the index)

**Caveat:** What if there are two or more nodes with the same value?

Dealing with multiple value problem:

Instead of mapping one value to one position, we will map one value to multiple
positions. We can maintain a *Set* or *Tree Set* of indecis for which a
particular node value (key) maps to.


```
Value Tree:
       2
     /   \
    7      2
   / \    / \
  11  7  13  2

Index Tree:
       0
     /   \
    1      2
   / \    / \
  3   4  5   6
```

**Hashtable:**

| Node Value (Key) | Node Index (Value) |
|------------------|--------------------|
| 2                | 0,2,6              |
| 7                | 1,4                |
| 11               | 3                  |
| 13               | 5                  |

Searching for the node index for a node value becomes linearly complex.

**Question:** If we want to remove a repeated node in our heap, does it matter
which one we remove?

**Answer:** NO, as long as heap invariant is satisfied.

