/*
    Find the number of elements of an array.

    Example:
        len([1, 1, 2, 3, 5, 8]) --> 6
*/

import std.algorithm : countUntil, fold;
import package_utils : writeResult;

size_t len(T)(T[] arr)
{
    return arr.length;
}

size_t lenFold(int[] arr) {
    return arr.fold!((a, _) => ++a);
}


size_t lenFold2(T)(T[] arr) {
    size_t i;
    return arr.fold!((a, _) => ++i)(i);
}

size_t lenRec(T)(T[] arr, ref int i)
{
    if (arr.length > 0)
    {
        ++i;
        lenRec(arr[1 .. $], i);
    }
    else
    {
        return i;
    }
    return i;
}

void main()
{
    int[] arr0 = [1, 1, 2, 3, 5, 8];
    char[] arr1 = ['a', 'b', 'c', 'd', 'e'];
    const i = 0;

    writeResult(arr1, len(arr1));
    writeResult(arr0, lenFold(arr0));
    writeResult(arr1, lenFold2(arr1));
    writeResult(arr0, lenRec(arr0, i));
}

unittest
{
    assert(len([1, 1, 2, 3, 5, 8]) == 6);
    assert(len(['a', 'b', 'c', 'd', 'e']) == 5);
    assert(lenFold([1, 1, 2, 3, 5, 8]) == 6);
    assert(lenFold2(['a', 'b', 'c', 'd', 'e']) == 5);
}
