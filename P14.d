/*
Duplicate the elements of a list.

Example:
    duplicate(['a', 'b', 'c', 'c', 'd']) -->
    ['a', 'a', 'b', 'b', 'c', 'c', 'c', 'c', 'd', 'd']
*/

import std.stdio;
import std.range : repeat, join;
import std.algorithm : map;

dchar[][] duplicate(in dchar[] arr)
{
    dchar[] arr2;
    return arr.map!(a => (arr2 ~ a).repeat(2)).join;
}

dchar[] duplicateLoop(in dchar[] arr)
{
    dchar[] arr2;
    foreach (d; arr)
    {
        arr2 ~= d;
        arr2 ~= d;
    }
    return arr2;
}

void main()
{
    dchar[] darr = ['a', 'b', 'c', 'c', 'd'];
    writeln(duplicate(darr).join);
    writeln(duplicateLoop(darr));
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'c', 'd'];
    dchar[] testDarr = ['a', 'a', 'b', 'b', 'c', 'c', 'c', 'c', 'd', 'd'];
    assert(duplicate(darr).join == testDarr);
    assert(duplicateLoop(darr) == testDarr);
    writeln("Tests passed!");
}
