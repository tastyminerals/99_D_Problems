/*
    Find the Kth element of an array.
    By convention, the first element in the list is element 0.

    Example:
        nth(2, [1, 1, 2, 3, 4, 5, 8]) --> 2
        nth(2, ['a', 'b', 'c', 'd', 'e']) --> 'c'
*/
import std.range;
import std.algorithm;
import std.exception : enforce;
import package_utils : writeResult;

T nth(T)(int idx, T[] arr)
{
    enforce((0 <= idx) & (idx < arr.length), "Array index is out of bounds!");
    return arr[idx];
}

T nthLoop(T)(int idx, T[] arr)
{
    enforce((0 <= idx) & (idx < arr.length), "Array index is out of bounds!");
    T res;
    foreach (i, elem; arr)
    {
        if (i == idx)
        {
            res = elem;
            break;
        }
    }
    return res;
}

int nthFind(int idx, int[] arr)
{
    enforce((0 <= idx) & (idx < arr.length), "Array index is out of bounds!");
    return arr.enumerate.find!(t => t[0] == idx)[0][1];
}

void main()
{
    int[] arr0 = [1, 1, 2, 3, 5, 8];
    char[] arr1 = ['a', 'b', 'c', 'd', 'e'];
    writeResult(arr0, nth(2, arr0));
    writeResult(arr1, nthLoop(2, arr1));
    writeResult(arr0, nthFind(3, arr0));
}

unittest
{
    assert(nth(2, [1, 1, 2, 3, 4, 5, 8]) == 2);
    assert(nthLoop(2, ['a', 'b', 'c', 'd', 'e']) == 'c');
    assert(nthFind(3, [1, 1, 2, 3, 4, 5, 8]) == 3);
}
