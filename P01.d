/*
    Find the last element of a an array.

    Example:
        last([1, 1, 2, 3, 5, 8]) --> 8
        last(['a', 'b', 'c', 'd', 'e']) --> 'e'
*/

import std.algorithm : fold;
import package_utils : writeResult;


T last(T)(T[] arr)
{
    return arr[$ - 1];
}

T recLast(T)(T[] arr)
{
    return (arr[0 .. $].length > 1) ? recLast(arr[1 .. $]) : arr[$ - 1];
}

T lastFold(T)(T[] arr)
{
    return arr.fold!((a, b) => b);
}

void main()
{
    int[] arr0 = [1, 1, 2, 3, 5, 8];
    char[] arr1 = ['a', 'b', 'c', 'd', 'e'];
    writeResult(arr0, recLast(arr0));
    writeResult(arr1, recLast(arr1));
}

unittest
{
    assert(last([1, 1, 2, 3, 5, 8]) == 8);
    assert(last(['a', 'b', 'c', 'd', 'e']) == 'e');
    assert(lastFold([1, 1, 2, 3, 5, 8]) == 8);
    assert(recLast(['a', 'b', 'c', 'd', 'e']) == 'e');
}
