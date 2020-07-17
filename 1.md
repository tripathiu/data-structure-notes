# What is data structure?

- A way of organinzing data
- Essential ingredient in creating fast and powerful *algos*
- Help manage and organizing data
- Make code cleaner and easier to understand

## Abstract Data Types vs Data structure

## Abstract Data Type

* ADT is an abstraction of the datastructure which provides only the interface to which a data structure must adhere to.  No specific datails about how
* something should be implemented.

### Examples

| Abstraction (ADT) | Implementation (DS) |
|-------------------|---------------------|
| List | Dynamic Array, Linked List |
| Queue | Linked List based Queue, Array based Queue, Stack based Queue |
| Map | Tree Map, Hash Map/Table |
| Vehicle | Golf Cart, Bicycle, Smart Car | 


# Computation Complexisty Analysis

Two questions:

* How much time does the algorithm needs to finish?
* How much space does it need for its combination?

## Big-O Notation

Upper bound of the complexity in the WORST case, helping as the input size
becomes arbitrarily large

If searching for 7 in a list --> LINEAR COMPLEXITY

n = size of the input

| Time | Notation | 
|------|----------|
| Constant | O(1) |
| Log | O(log(n)) |
| Linear | O(n) |
| Linearithmic | O(nlog(n)) |
| Quadratic | O(n^2) |
| Exp | O(b^n) |
| Factorial | O(n!) |


### Big-O properties

* O(n+c) = O(n)

* O(cn) = O(n), c > 0

(This is all theoritical)

-------------------

f(n) = 7log(n)^3 + 15n^2 + 2n^3 + 8

=> O(f(n)) = O(n^3) (worst case)


### Big-O Examples

#### Constant Times

Example 1:

```
a = 1;
b = 2;
c = a + 5*b;
```

Example 2:

```
i = 0;
while i < 11, do, // loop does not depend on n
i = i+3;
```

#### Linear Times

Example 1:

```
i = 0
while i<n, do,
i = i+1
```
f(n) = n
O(f(n)) = O(n)

Example 2:

```
i = 0;
while i < n, do, // loop does not depend on n
i = i+3;
```
f(n) = n/3 since we will run this loop 3 times faster
O(f(n)) = O(n)


#### Quadratic Time

Ex 1:

```
for (i=0; i<n; i++)
  for(j=0; j<n; j++)
```

f(n) = n*n => O(f(n)) = O(n^2)

Ex 2:

```
for (i=0; i<n; i++)
  for(j=0; j<n; j++)
```

Amount of looping done is determined by what i is.

if i = 0, we do n work. If i = 1, n-1 work, etc.

f(n) = n + (n-1) + .... 3 + 2 + 1
= n(n+1)/2

O(f(n)) = n^2




#### Logrithmic Time

Binary Search:

```
low = 0
high = n-1
while low<=high, do
  mid = (low + high) / 2
  if array(mid) == value, return
  elseif array(mid) > value, low = mid+1
  elseif array(mid) < value, high = mid+1
return -1
```


#### Quadratic Time

```
i = 0;
while i <n, do
  j = o,
  while j<3n, do
    j++;
  j=0
  while j<2n, do
    j++
  i++
```

f(n) = n(3n+2n) = 5n^2
O(f(n)) = O(n^2)


#### Power 4 Time

```
i = 0;
while i < 3n, do
  j = 10,
  while j<50, do
    j++;
  j=0
  while j< n^3, do
    j+=2
  i++
```

f(n) = 3n * ( 40 + n^3/2) = 3n/40 + 3n^4/2
O(f(n)) = O(n^4)


#### Other Examples

| Description | Complexity |
|-------------|------------|
| Finding all subsets of a set | O(2^n) |
| Finding all permutations of a string | O(n!) |
| SOrting using mergesort | O(nlogn) |
| Iterating over all the cells in a matrix of size nxm | O(nm) |
















