/*
Split an array into two parts given the index.

Example:
    splitAt(3, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']) -->
    ('a', 'b', 'c'), ('d', 'e', 'f', 'g', 'h', 'i', 'j', 'k')
*/

import std.stdio;
import std.range;
import std.typecons;

Tuple!(T[], T[]) splitAt(T)(T[] arr, in size_t idx)
{
    T[] part1 = arr.take(idx);
    T[] part2 = arr.drop(idx);
    return tuple(part1, part2);
}

T[][] splitAt2(T)(T[] arr, size_t idx)
{
    T[][] wrapArr;
    T[] temp;
    foreach (i, d; arr)
    {
        if (i < idx)
        {
            temp ~= d;
        }
        else
        {
            wrapArr ~= temp;
            temp = null;
            temp ~= d;
            idx = arr.length;
        }
    }
    wrapArr ~= temp;
    return wrapArr;
}

void main()
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    auto result1 = splitAt(darr, 3);
    writeln(result1);
    splitAt2(darr, 3);
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    dchar[] part1 = ['a', 'b', 'c'];
    dchar[] part2 = ['d', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    assert(splitAt(darr, 3) == tuple(part1, part2));
    writeln("Tests passed!");
}
