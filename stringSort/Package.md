Allows to sort strings from Ballerina.

# Package Overview

The `stringSort` allows you to perform sorting of a string array. Functionality of bucket sort on strings is provided by `sort` function. If the strings contain non alphabetic characters, they will get the least precedence when sorting.

## Compatibility

|      Language                           |       Version                  |
|  :---------------------------:  |  :---------------------------: |
|  Ballerina Language             |   0.975.0                      |

## Sample

First, import the `vinod/stringSort` package into the Ballerina project.

```ballerina
import vinod/stringSort;
```

The `sort(int[] unsortedArray)` function retrieves the sorted array of string for the given unsorted array.
```ballerina
int[] unsortedArray = ["colombo", "kandy", "b7a", "wso2"];
int[] result = stringSort:sort(unsortedArray);
```
