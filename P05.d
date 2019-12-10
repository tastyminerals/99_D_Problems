/*
    Reverse an array.

    Example:
    rev([1, 1, 2, 3, 5, 8]) --> [8, 5, 3, 2, 1, 1]
*/

import std.array : array;
import std.algorithm : reverse, map;
import std.range : enumerate;
import package_utils : writeResult;

T[] rev(T)(T[] arr)
{
    return arr.reverse;
}

T[] revMap(T)(T[] arr)
{
    return arr.enumerate.map!(t => arr[arr.length - 1 - t[0]]).array;
}

T[] revForEach(T)(T[] arr)
{
    T[] new_arr;
    foreach_reverse (a; arr)
    {
        new_arr ~= a;
    }
    return new_arr;
}

T[] revLoop(T)(T[] arr)
{
    T[] newArr = arr.dup;
    foreach (i, _; arr)
    {
        newArr[i] = arr[arr.length - 1 - i];
    }
    return newArr;
}

T[] revLoop2(T)(T[] arr)
{
    T[] newArr = arr[0 .. $].dup;
    for (int i = 0; i < arr.length; i++)
    {
        newArr[i] = arr[$ - i - 1];
        newArr[$ - i - 1] = arr[i];
    }
    return newArr;
}

void main()
{
    int[] arr0 = [1, 1, 2, 3, 5, 8];
    char[] arr1 = ['a', 'b', 'c', 'd', 'e'];
    writeResult(arr0, rev(arr0.dup));
    writeResult(arr1, revMap(arr1));
}

unittest
{
    import std.stdio : writeln;

    assert(rev([1, 1, 2, 3, 5, 8]) == [8, 5, 3, 2, 1, 1]);
    assert(revMap([1, 1, 2, 3, 5, 8]) == [8, 5, 3, 2, 1, 1]);
    assert(revForEach(['a', 'b', 'c', 'd', 'e']) == ['e', 'd', 'c', 'b', 'a']);
    assert(revLoop([1, 1, 2, 3, 5, 8]) == [8, 5, 3, 2, 1, 1]);
    assert(revLoop2([1, 1, 2, 3, 5, 8]) == [8, 5, 3, 2, 1, 1]);
    writeln("All tests passed!");
}
