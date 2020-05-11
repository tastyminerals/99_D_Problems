/*
Pack consecutive duplicates of list elements into sublists.
    If a list contains repeated elements they should be placed in separate sublists.

    Example:

    pack(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'])
        --> [['a', 'a', 'a', 'a'], ['b'], ['c', 'c', 'c'], ['a', 'a'], ['d'], ['e', 'e', 'e', 'e']]
*/
module P09;
import std.stdio;
import std.algorithm : map, group;
import std.array : array;
import std.range : repeat;
import package_utils : writeResult;

T[][] pack(T)(T[] arr)
{
    // HINT: repeat is lazy, std.algorithm.replicate allocates, fills and returns new array
    // return arr.group.map!(g => g[0].repeat(g[1]).array).array;
    return arr.group.map!(g => [g[0]].replicate(g[1])).array;
}

T[][] packLoop(T)(T[] arr)
{
    T[][] nArr;
    T[] cache;
    foreach (n; arr)
    {
        if (cache.length == 0)
        {
            cache ~= n;
        }
        else if (cache[$ - 1] != n)
        {
            nArr ~= cache;
            cache = null;
            cache ~= n;
        }
        else
        {
            cache ~= n;
        }
    }
    if (cache.length > 0)
    {
        nArr ~= cache;
    }
    return nArr;
}

void main()
{
    int[] arr = [1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5];
    dchar[] darr = [
        'a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'
    ];
    writeResult(arr, pack(arr));
    writeResult(darr, pack(darr));
}

unittest
{
    int[] arr = [1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5];
    int[][] testArr = [[1, 1, 1, 1], [2], [3, 3], [1, 1], [4], [5, 5, 5, 5]];
    dchar[] darr = [
        'a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'
    ];
    dchar[][] testDarr = [
        ['a', 'a', 'a', 'a'], ['b'], ['c', 'c'], ['a', 'a'], ['d'],
        ['e', 'e', 'e', 'e']
    ];
    assert(pack(arr) == testArr);
    assert(pack(darr) == testDarr);
    assert(packLoop(arr) == testArr);
    assert(packLoop(darr) == testDarr);
    writeln("All tests passed!");
}
