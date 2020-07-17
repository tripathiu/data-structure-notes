# Static and Dynamic Arrays

Fundamental building block of all other data structures

## What is an array?

* Fixed length contained containing n elements, indexable from the range [0, n-1]
* Each slot/index in an array can be referenced with a number
* CONTIGUOIUS MEMORY ALLOCATION

## When and where is a array used?

EVERYWHERE

1. Storing and accessing sequential data
1. Temporirily store objects
1. IO routine buffers
1. Lookup Tables, Inv lookup tables
1. Can be used to return multiple values from functions (C, C++)
1. Used in dynamic programming to cache answers to subproblems

## Complexity

| Desc | Static Array | Dynamic Array |
|------|-------------|---------------|
| Access | O(1) | O(1) |
| Search | O(n) | O(n) |
| Insertion | NA (fixed size container) | O(n) |
| Appending | NA | O(1) |
| Deletion | NA | O(n) |

## Static Array usage Example

Arrays are referened by their index, (0 based)

```
A =
44,12,-3,12,100
^  ^  ^  ^  ^
0  1  2  3  4

A[0] = 44
A[1] = 12
...
```

# Dymanic Arrays

## Operations on Dynamic Arrays

```
{34,4}
A.add(-7)
{34,4, -7}
A.add(34)
{34,4,-7, 34}
A.remove(4)
{34,-7, 34}
```

## Dynamic Array Implementation Details

1. Create a static array with an initial capacity
1. Add elements to the underlying static array, keeping track of the number of elements
1. If adding another element exceeds the capacity, create new static array twice the size, copy the original elements into it.

