/*
    Find the last but one element of an array.

    Example:
        penultimate([1, 1, 2, 3, 5, 8]) --> 5
        penultimate(['a', 'b', 'c', 'd', 'e']) --> 'd'
*/

import package_utils : writeResult;

T penultimate(T)(T[] arr)
{
    return arr[$ - 2];
}

T recPenultimate(T)(T[] arr)
{
    return (arr[0 .. $].length > 2) ? recPenultimate(arr[1 .. $]) : arr[$ - 2];
}

void main()
{
    int[] arr0 = [1, 1, 2, 3, 5, 8];
    char[] arr1 = ['a', 'b', 'c', 'd', 'e'];
    writeResult(arr0, penultimate(arr0));
    writeResult(arr1, recPenultimate(arr1));
}

unittest
{
    assert(recPenultimate([1, 1, 2, 3, 5, 8]) == 5);
    assert(penultimate(['a', 'b', 'c', 'd', 'e']) == 'd');
}
