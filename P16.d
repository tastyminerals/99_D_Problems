/*
Drop every n-th element from the list.

Example:
    dropN(3, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']) -->
    ['a', 'b', 'd', 'e', 'g', 'h', 'j', 'k']
*/

import std.algorithm : filter, map, joiner;
import std.array;
import std.range : chunks, enumerate, take;
import std.stdio;

T[] dropN(T)(in size_t n, T[] arr)
{
    return arr.enumerate(1).filter!(tup => tup.index % n != 0)
        .map!(a => a.value)
        .array;
}

T[] dropN2(T)(in size_t n, T[] arr)
{
    return arr.chunks(n).map!(a => a.take(n - 1)).joiner.array;
}

dchar[] dropN3(in size_t n, dchar[] arr)
{
    dchar[] arrCopy;
    for (int i = 1; i < arr.length + 1; i++)
    {
        if (i % n != 0)
        {
            arrCopy ~= arr[i - 1];
        }
    }
    return arrCopy;
}

void main()
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    int[] arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    writeln(dropN(3, darr));
    writeln(dropN(3, arr));
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    int[] arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    dchar[] test1 = ['a', 'b', 'd', 'e', 'g', 'h', 'j', 'k'];
    int[] test2 = [1, 2, 4, 5, 7, 8, 10];
    assert(dropN(3, darr) == test1);
    assert(dropN(3, arr) == test2);
    assert(dropN2(3, darr) == test1);
    assert(dropN2(3, arr) == test2);
    writeln("Tests passed!");
}
