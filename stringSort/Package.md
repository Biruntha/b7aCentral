Allows to sort strings from Ballerina.

# Package Overview

The `stringSort` allows you to perform sorting of a string array. Functionality of bucket sort on array of strings is provided by `sort` function. If the strings in array contain non alphabetic characters, they will get the least precedence when sorting. You can sort on your own alphabet by passing an array of characters along with the unsorted array to the `sortForAlphabet` function.

## Compatibility

|      Language                           |       Version                  |
|  :---------------------------:  |  :---------------------------: |
|  Ballerina Language             |   0.982.0                      |

## Sample

First, import the `vinod/stringSort` package into the Ballerina project.

```ballerina
import vinod/stringSort;
```

The `sort(string[] unsortedArray)` function retrieves the sorted array of string for the given unsorted array.
```ballerina
int[] unsortedArray = ["colombo", "kandy", "b7a", "wso2"];
int[] result = stringSort:sort(unsortedArray);
```
The `sortForAlphabet(string[] unsortedArray, string[] newAlphabet)` function retrieves the sorted array of string for the given unsorted array, based on the given alphabet.
```ballerina
string[] unsortedArray = ["colombo", "kandy", "b7a", "wso2"];
string[] alphabet = ["a","b","c","1","2","3"];
string[] result = stringSort:sortForAlphabet(unsortedArray, alphabet);
```
