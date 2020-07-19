# Suffix Arrays

## What is a suffix?

A substring at the end of the string.

## What is a suffix array (SA)?

Array containing all the sorted suffixes of a string.

"Camel"

**All suffixes**

| num | suffix |
|-----|--------|
| 0   | camel  |
| 1   | amel   |
| 2   | mel    |
| 3   | el     |
| 4   | l      |

**All suffixes in lexicographic order**

| num | suffix |
|-----|--------|
| 1   | amel   |
| 0   | camel  |
| 3   | el     |
| 4   | l      |
| 2   | mel    |

The actual suffix array is the array of sorted indices. This provides a
compressed representation of the sorted suffixes without actually needing to
store the suffixes.

# Longest Common Prefix Array (LCP)

LCP array of `ababbab`


| Sorted Index | LCP Value | Suffix |
|--------------|-----------|--------|
| 5            | 0         | ab     |
| 0            | 2         | ababbab|
| 2            | 2         | abbab  |
| 6            | 0         | b      |
| 4            | 1         | bab    |
| 1            | 3         | babbab |
| 3            | 1         | bbab   |

LCP Array = {0,2,2,0,1,3,1}

How many characters two sorted adjecent suffixes have in common.

By convention, LCP[0] is undefined, usually set to zero.

**Note**: There exists many methods for efficiently constructing the LCP array
in O(nlogn) time and even in O(n) time.


# Using SA/LCP array to find unique substring

## Usage (Finding and Counting unique substrings)

Finding and counting unique substring. (Bioinformatics, Computer Science)

Naive Algo : O(n^2)

LCP Array provides a better way.

Example: `AZAZA`

All n(n+1)/2 substrings:

A, AZ, AZA, AZAZ, AZAZA, Z, ZA, ZAZ, ZAZA, A', AZ', AZA', AZAZ'

| LCP | Sorted Suffixes (lex) |
|-----|-----------------------|
| 0   | A                     |
| 1   | AZA                   |
| 3   | AZAZA                 |
| 0   | ZA                    |
| 2   | ZAZA                  |

**Finding unique substrings**

```
n(n+1)/2 - sum(LCP[i])
```

If text = `AZAZA`, n = 5

5(5+1)/2 - sum (LCP(i)) = 9

9 unique substring.
