/*
    Use the result of problem P09 to implement the so-called run-length encoding data compression method.
    Consecutive duplicates of elements are encoded as tuples (N, E) where N is the number of duplicates of the element E.

    Example:

    encode(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']) -->
    [[4,'a'], [1,'b'], [2,'c'], [2,'a'], [1,'d'], [4,'e']]
*/

import std.stdio;
import std.algorithm : map, each, group;
import std.array : array, assocArray;
import package_utils : writeResult;
import std.typecons : tuple, Tuple;

auto encode(T)(T[] arr)
{
    return arr.group.array;
}

Tuple!(int, dchar)[] encodeFun(T)(T[] arr)
{
    int[T] newArr;
    arr.each!(a => ++newArr[a]);
    auto res = newArr.byKeyValue.map!(pair => tuple(pair.value, pair.key));
    return res.array;
}

void main()
{
    dchar[] darr = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'];
    writeResult(darr, encode(darr));
}

unittest
{
    dchar[] darr = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'];
    auto darrTest = [Tuple!(int, dchar)(1, 'd'), Tuple!(int, dchar)(4, 'e'),
        Tuple!(int, dchar)(1, 'b'), Tuple!(int, dchar)(2, 'c'), Tuple!(int, dchar)(6, 'a')];
    assert(encodeFun(darr) == darrTest);
}
