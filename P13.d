/*
Implement the so-called run-length encoding data compression method directly.
I.e. don't use other methods you've written (like P09's pack); do all the work directly.

    Example:
    encodeDirect(('a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e')) -->
    [(4,'a'), (1,'b'), (2,'c'), (2,'a'), (1,'d'), (4,'e')]
*/

import std.stdio;
import std.algorithm : map;
import std.typecons : tuple, Tuple;
import package_utils : writeResult;

// Does not return tuples but an associative array instead!
int[dchar] encode(in dchar[] arr)
{
    int[dchar] ass;
    arr.map!(a => ++ass[a]);
    return ass;
}

auto encodeRec(T)(T[] arr, Tuple!(int, T)[] tempCache, int count, int idx)
{
    ++idx;
    ++count;
    if (idx == arr.length)
    {
        tempCache ~= tuple(count, arr[idx - 1]);
        return tempCache;
    }
    if (arr[idx - 1] != arr[idx])
    {
        tempCache ~= tuple(count, arr[idx - 1]);
        count = 0;
    }

    return encodeRec(arr, tempCache, count, idx);
}

auto encodeDirect(T)(T[] arr)
{
    Tuple!(int, T)[] newArr;
    T prevC = arr[0];
    int count;
    foreach (T c; arr)
    {
        if (prevC != c)
        {
            newArr ~= tuple(count, prevC);
            count = 0;
        }
        ++count;
        prevC = c;
    }
    newArr ~= tuple(count, prevC);
    return newArr;
}

void main()
{
    dchar[] arr = [
        'a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'
    ];
    writeResult(arr, encodeDirect(arr));

    Tuple!(int, dchar)[] newArr;
    int count;
    int idx;
    writeResult(arr, encodeRec(arr, newArr, count, idx));
    writeResult(arr, encode(arr));
}

unittest
{
    dchar[] arr = [
        'a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'
    ];
    auto testArr = [
        tuple(4, 'a'), tuple(1, 'b'), tuple(2, 'c'), tuple(2, 'a'), tuple(1, 'd'),
        tuple(4, 'e')
    ];
    assert(encodeDirect(arr) == testArr);
    Tuple!(int, dchar)[] newArr;
    int count;
    int idx;
    assert(encodeRec(arr, newArr, count, idx) == testArr);
}
