/*
Duplicate the elements of a list n number of times.

Example:
    duplicateN(3, ['a', 'b', 'c', 'c', 'd']) -->
    ['a', 'a', 'a', 'b', 'b', 'b', 'c', 'c', 'c', 'c', 'c', 'c', 'd', 'd', 'd']
*/

import std.stdio;
import std.algorithm : map;
import std.range : repeat;
import std.array : join;


dchar[][] duplicate(in size_t rep, in dchar[] arr)
{
    dchar[] arr2;
    return arr.map!(a => (arr2 ~ a).repeat(rep)).join;
}

void main()
{
    dchar[] darr = ['a', 'b', 'c', 'c', 'd'];
    auto res = duplicate(3, darr).join;
    writeln(res);
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'c', 'd'];
    dchar[] testDarr = [
        'a', 'a', 'a', 'b', 'b', 'b', 'c', 'c', 'c', 'c', 'c', 'c', 'd', 'd', 'd'
    ];
    assert(duplicate(3, darr).join == testDarr);
    writeln("Tests passed!");
}
