/*
Remove the k-th element from a list.
Return the list and the removed element in a Tuple. Elements are numbered from 0.

Example:
    removeAtIdx(1, ['a', 'b', 'c', 'd'] -->
    (['a', 'c', 'd'], 'b')
*/

import std.stdio;
import std.typecons;
import std.range;
import std.algorithm : remove;

alias dcharTuple = Tuple!(dchar[], dchar);

dcharTuple removeAtIdx(int idx, dchar[] arr)
{
    dchar c = arr[idx];
    arr = arr.remove(idx);
    return dcharTuple(arr, c);
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'd'];
    auto result1 = dcharTuple(['a', 'c', 'd'], 'b');
    assert(removeAtIdx(1, darr.dup) == result1);
}
