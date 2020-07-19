# Fenwick Tree

**Note:** Fenwick trees are 1 based arrays.

## Motivation

Suppose we want to find the sum of an array range.

Slow, since linear queries.

If we create an array P containinf all the prefix sums of A.

```
A =  5 -3 6 1 0 -4 11 6   2  7
P =  0  5 2 8 9  9 5  16 22 24 31 (prefix sums)
          ^--------^
             sum=
         (-)2         16
sum = 16 -2

sum = 14
```

What happens when we update a value in the original values?

We have to compute all the prefix sums, will take up linear time

## What is Fenwick Tree?

AKA Binary Indexed Tree is a DS that supports sum range queries as well as
setting values ina static array and getting the value of the prefix sum up some
index efficiently.

## Complexity Analysis

| Operation      | Time    |
|----------------|---------|
| Construction   | O(n)    |
| Point Update   | O(logn) |
| Range Sum      | O(logn) |
| Range Update   | O(logn) |
| Adding Index   | NA      |
| Removing Index | NA      |


# Range Queries

Unlike a regular array, in a Fenwick tree, a specific cell is responsible for
other cells as well.

The position of the LSB determines the range of responsibilities that the cell
has to the cells below itself.


Example:

Index 12 = (1100)base2

LSB is at position 2, so this index is responsible for 2^(1-1) = 1 cell
(itself).

**Range of Responsibility**

```
8 1000       |
7 0111 |     |
6 0110   |   |
5 0101 | |   |
4 0100     | |
3 0011 |   | |
2 0010   | | |
1 0001 | | | |
```

**Range Queries**

In a Fenwick tree, we may compute the prefix su up to a certain index, which
ultimately lets us perform range sum queries.

Find the predix sum upto index 7

Solution:

```
8 1000       |
7 0111 :     |
6 0110   :   |
5 0101 | :   |
4 0100     : |
3 0011 |   : |
2 0010   | : |
1 0001 | | : |
```

sum = A(7) + A(6) + A(4)


**Sum between 7 and 3 not including 3**

```
8 1000       |
7 0111 :     |
6 0110   :   |
5 0101 | :   |
4 0100     : |
3 0011 ^   : |
2 0010   ^ : |
1 0001 | ^ : |
```

sum(7,1) = A(7) + A(6) + A(4)
sum(3,1) = A(3) + A(2)

sum(7,3) = sum(7,1) - sum(3,1)


## Algorithm

```

function prefixSum(i):
  sum:=0
  while i!=0:
    sum+=tree[i]
    i = i-LSB(i)
  return sum

function rangeQuery(i,j):
  return prefixSum(j) - prefixSum(i-1)
```


# Fenwick Trees : Point Updates

If we want to add a value to 7, update all the elements which have
responsibilities

```
8 1000       | (update)
7 0111 +-----+ (update)
6 0110   |   |
5 0101 | |   |
4 0100     | |
3 0011 |   | |
2 0010   | | |
1 0001 | | | |
```

# Construction of Fenwick Tree

## Naive Construction

Let A be an array of values. For each element in A at index i, do a point
update on the Fenwick tree with a value of A[i]. There are n elements and each
point update takes O(logn) for a total of O(nlogn).


### Linear Construction

**Idea:** Add the value in the current cell to the immediate cell that is
responsible for us. This resembles what we did for point updaete but only one
cell at a time.

This will make the cascading effect in range queries possible by propagating
the value in each cell throughout the tree.

Let i be the current index,

The immediate cell above us, is at position j,

Then j is given by

```
j=i+LSB(i)
```

Example,

```
i = 1 = (0001)
j = 0001 + 1 = 2 (parent)

Now,
i = 2
j = 0010 + 2 = 4 (parent)

Now,
i = 4
j = 0100 + 4 = 8 (parent)

```

No more parents, since the the array size is too small.


#### Algorithm

```
function construct(values):
  N = length(values)
  tree=deepCopy(values)

  for i = 1:N
    j = i+LSB(i)
    if j<N:
      tree[j] = tree[j]+tree[i]
  return tree
```

