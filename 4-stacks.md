# Stacks

## What is a stack?

One ended linear data structure (Push and Pop)

* LIFO

## When and where is a stack used

1. Undo mechanisms in text editors, back button on browsers
1. Compiler Syntax checking (braces and brackets)
1. Model piles of book
1. Used behind the scene to support recursion by keeping track of the previous function calls
1. Perform DEPTH FIRST SEARCH on a GRAPH

## Complexity Analyis

| Operation | Complexity | 
|-----------|------------|
| Push      | O(1)       |
| Pop       | O(1)       |
| Peek      | O(1)       |
| Search    | O(n)       |
| Size      | O(1)       |

## Usage Examples

### Brackets

```
[[{}]()]

Stack Time series:
0
[
[[
[[{
[[
[
[(
[
0
```

Valid bracket sequence, since final stack is empty

**Note**: If top stack value does not match the current bracket value, the
bracket configuration is invalid.

### Tower of Hanoi

Treat all three towers as stack

# Implementation of Stacks

## Using singly linked list

Instructions:

```
Push(4)
Push(2)
Push(5)
Push(13)
```

All new elements add to the head.

```
H->13->5->2->4->Null
```

Instructions for Pop().

Clear unused memory now. Its very important.

* Search how?

```
Pop()
Pop()
Pop()
Pop()

H->Null
```

# Source Code Notes

```
Data:
List

Methods:
push()
pop()
size()
...

```
