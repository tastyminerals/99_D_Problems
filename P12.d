/*
    Decode a run-length encoded list.
    Given a run-length code list generated as specified in problem P10, construct its uncompressed version.

    Example:
    decode((4, 'a'), (1, 'b'), (2, 'c'), (2, 'a'), (1, 'd'), (4, 'e')))
    --> ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
*/

import std.stdio;
import std.typecons : tuple, Tuple;
import std.algorithm : map, fill;
import std.range : repeat;
import std.array : array, join, split;
import package_utils : writeResult;


auto decode(Tuple!(int, char)[] arr)
{
    return arr.map!(tup => repeat(tup[1], tup[0])).join.split("");
}

void main()
{
    auto arr = [tuple(4, 'a'), tuple(1, 'b'), tuple(2, 'c'), tuple(2, 'a'),
        tuple(1, 'd'), tuple(4, 'e')];
    writeResult(arr, decode(arr));
}

unittest
{
    auto arr = [tuple(4, 'a'), tuple(1, 'b'), tuple(2, 'c'), tuple(2, 'a'),
        tuple(1, 'd'), tuple(4, 'e')];
    string[] testArr = ["a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e"];
    assert(decode(arr) == testArr);
}
