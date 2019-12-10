/*
    Eliminate consecutive duplicates of array elements.
    If a array contains repeated elements they should be replaced with a single copy of the element.
    The order of the elements should not be changed.

    Example:
    compress(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']); --> ['a', 'b', 'c', 'a', 'd', 'e']
*/


import package_utils : writeResult;
import std.algorithm.iteration : filter, group, map, uniq;
import std.array : array;
import std.range : enumerate;
import std.stdio;


T[] compress(T)(T[] arr)
{
    return arr.uniq.array;
}

T[] compressGroup(T)(T[] arr)
{
    return arr.group.map!(tup => tup[0]).array;
}

T[] compressFilter(T)(T[] arr)
{
    return arr.enumerate
        .filter!(t => t[0] == 0 ? t[1] : t[1] != arr[t[0] - 1])
        .map!(t => t[1])
        .array;
}

void main()
{
    int[] arr = [1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5];
    dchar[] darr = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'];
    writeResult(arr, compress(arr));
    writeResult(darr, compressFilter(darr));
}

unittest
{
    int[] arr = [1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5];
    dchar[] darr = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'];
    int[] testArr = [1, 2, 3, 1, 4, 5];
    dchar[] testDarr = ['a', 'b', 'c', 'a', 'd', 'e'];
    assert(compress(arr) == testArr);
    assert(compress(darr) == testDarr);
    assert(compressFilter(arr) == testArr);
    assert(compressGroup(arr) == testArr);
    writeln("All tests passed!");
}
