/*
    Modified run-length encoding.
    Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list.
    Only elements with duplicates are transferred as (N, E) terms.

    Example:
        encodeMod(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'])
        --> [(4,'a'), 'b', (2,'c'), (2,'a'), 'd', (4,'e')]
*/
import std.stdio;
import std.algorithm : group, map, each;
import std.array;
import std.typecons : tuple, Tuple;
import std.variant;
import package_utils : writeResult;

auto encode(T)(T[] arr)
{
    Variant[] varArr;
    arr.group.each!(tup => tup[1] == 1 ? (varArr ~= Variant(tup[0])) : (varArr ~= Variant(tup)));
    return varArr;
}

auto encodeMod(T)(T[] arr)
{
    Variant[] varArr;
    foreach (tup; arr.group)
    {
        if (tup[1] == 1)
        {
            varArr ~= Variant(tup[0]);
        }
        else
        {
            varArr ~= Variant(tup);
        }
    }
    return varArr;
}

void main()
{
    dchar[] darr = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'];
    writeResult(darr, encode(darr));
    writeResult(darr, encodeMod(darr));
}

unittest
{
    dchar[] darr = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'];
    auto darrTest = variantArray(Tuple!(dchar, uint)('a', 4), 'b',
            Tuple!(dchar, uint)('c', 2), Tuple!(dchar, uint)('a', 2), 'd',
            Tuple!(dchar, uint)('e', 4));
    assert(encode(darr) == darrTest);
    assert(encodeMod(darr) == darrTest);
}
