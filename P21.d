/*
Insert an element at a given position into a list.

Example:
    insertAt("new", 1, ["a", "b", "c", "d"]) -->
    ["a", "new", "b", "c", "d"];
*/

import std.stdio;
import std.array : insertInPlace;
import std.range;

string[] insertAt(in int idx, string str, string[] arr)
{
    arr.insertInPlace(idx, str);
    return arr;
}

string[] insertAt2(in int idx, string str, string[] arr)
{
    return arr.take(idx) ~ str ~ arr.drop(idx);
}

void main()
{
    string[] sarr = ["a", "b", "c", "d"];
    writeln(insertAt(1, "new", sarr.dup));
}

unittest
{
    string[] sarr = ["a", "b", "c", "d"];
    string[] result1 = ["a", "new", "b", "c", "d"];
    assert(insertAt(1, "new", sarr.dup) == result1);
    assert(insertAt2(1, "new", sarr.dup) == result1);
}
