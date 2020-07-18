# Binary Trees and Binary Search Trees

## Terminology

A tree is an undirected graph which satisfies any of the following definition:

1. Acyclic connected graph
1. A connected graph with N nodes and N-1 edges
1. A graph in which any two vertices are connected by *exactly one* path.

```
       4
      /|\
     / | \
    0  3  9
  / |  |  | \
 3  2  2  1  8
   /|\    |\
  2 4 2   3 3
```

### Rooted Tree

If we have a rooted tree, then we will want to have a reference to the root
node of our tree. 

It does not always matter which node is selected to be the root node because
any node can root the tree!

```
      [4] <-- root node
      /|\
     / | \
    0  3 [9]       <--- parent node
  / |  |  | \           ^
 3  2  2 [1] [8]   <--- child nodes
   /|\    | \
  2 4 2  [3][3]    <--- leaf nodes (no children)
```

**What is the parent of root node?** Maybe itself. (Image `cd ..` on `/`)

**Subtree**: every child is a tree in itself, its called the sub-tree

### Binary Tree

A tree with at most two children per node.

### Binary Search Tree

Its a binary tree which also satisfies Binary Search Tree invariant:

Left subtree has smaller elements and right subtree have larger elements.

```
       5
      / \
     /   \
    4     8
  / |     | \
 1  2     7  10
         / \
        6  [8]  <-- not a bst, 
                    since 9 has to be at the right of 8 (at 10)
```

## Where are BT and BSTs used?

* BST
  * Implementations of some map and set Abstract data types (ADTs)
  * Red Black Trees
  * Splay Trees etc
* Binary heaps
* Syntax trees (used by compilers and calculators
* Treap - a probabilistic DS (uses randomized BST)

# Complexity Analysis

| Operation | Average | Worst |
|-----------|---------|-------|
| Insert    | O(logn) | O(n)  |
| Delete    | O(logn) | O(n)  |
| Remove    | O(logn) | O(n)  |
| Search    | O(logn) | O(n)  |

**Note:** O(logn) is better that O(n).

# How to insert nodes to BST?

BST elements must be *comparable* so that we can order them inside the tree.

When inserting an element, we want to compare its value to the value stored in
the current node we're considering to decide on one of the following:

* Recurse down left subtree (< case)
* Recurse down right subtree (> case)
* Handle finding a duplicate value (= case)
* Create a new node (found a null leaf)

```
Instructions:

insert(7)
insert(20)
insert(5)
insert(15)
insert(10)
insert(4)
insert(4)
insert(33)
insert(2)
insert(25)
insert(6)


The tree:

       7
      / \
     /   \
    5     20
   / \    / \
  4   6  15  33
 /      /   /
2      10  25

```

On average, the insertion time will be logarithmic, but worst case: linear.

```
Instructions:

insert(1)
insert(2)
insert(3)
insert(4)
insert(5)


The tree:

1
 \
  2
   \
    3
     \
      4
       \
        5
```

This is really bad as searching any node now will have to traverse through the
whole tree.


# How to remove nodes to BST?

1. Find the element you wish to remove
2. Replace the node to be removed with its successor to maintain BST invariant.

## Find phase

Four things can happen:

1. We hit a null node (value does not exist in the BST)
1. Comparator returns 0 (found it!)
1. Comparator returns less than 0 (it is in left subtree, go left)
1. Comparator returns more than 0 (it is in right subtree, go right)

## Remove phase

Four cases:

1. Node to remove is a leaf node
1. Node to remove has right subtree only
1. Node to remove has left subtree only
1. Node to remove has left and right subtree

**Case 1:** Can be immediately removed

**Case 2 or Case 3:** The successor of the node we are trying to remove in
these cases will be the root node of the left/right subtree.

It may be the case that you are removing the root node of the BST in which case
its immediate child becomes the new root as you would expect.

**Case 4:** Node to remove has both left and right subtree. Either largest
value in the left subtree or the smallest value in the right subtree.

Largest value in left subtree will satisfies BST invariant since it:

1. is larger than everything in the left subtree.
1. is smaller than everything in the right subtree.

Similarly, Smallest value in right subtree will satisfies BST invariant since it:

1. is smaller than everything in the right subtree.
1. is larger than everything in the left subtree.

So there are two possible successors...

Replace the value to be removed with a successor and then remove the
successor's original node. Follow again the same rules for removal of the
original successor to rebalance the tree.

# Tree traversals

There are three traversals which are naturally defined recursively:

### Preorder

```java
preorder(node):
  if node==null: return
  print(node.value)
  preorder(node.left)
  preorder(node.right)
```


### Inorder

```java
inorder(node):
  if node==null: return
  inorder(node.left)
  print(node.value)
  inorder(node.right)
```

Inorder traversal will print the nodes in (ascending) order.

### Postorder

```java
postorder(node):
  if node==null: return
  postorder(node.left)
  postorder(node.right)
  print(node.value)
```

Only difference is the position of the print statement. Note: These are
accomplished by using Stacks.


### Levelorder (Breadth First Search)

In a level order traversal, we print the nodes on layer at a time. This is done
via a BFS (breadth first search) from the root node down to the leaf nodes.

To do a BFS, we will need to maintain a Queue of the nodes left to explore.
Begin with the root inside the Queue and finish when the queue is empty.

At each iteration we add the left child and then the right child of the current
node to our Queue. Dequeue and add the members of the new node to the queue.
Rinse and repeat.

