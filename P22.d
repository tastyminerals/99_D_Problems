/*
Create a list containing all integers within a given range.

Example:
    range(4, 9) --> [4, 5, 6, 7, 8, 9]
*/

import std.stdio;
import std.range;

int[] range(in int start, in int end)
{
    return iota(start, end + 1).array;
}

int[] range1(int start, int end)
{
    // auto fun = recurrence!("a[n] + 1")(start);
    return recurrence!((a, n) => a[n] + 1)(start).take(end - start + 1).array;
}

int[] range2(int start, int end)
in
{
    assert(start >= 0 && end >= 0);
    assert(start < end);
}
do
{
    int[] arr;
    arr.reserve(end - start + 1);
    int[] inner(int start, int end, int[] arr)
    {
        return start < end + 1 ? inner(start + 1, end, arr ~ start) : arr;
    }

    return inner(start, end, arr);
}

int[] range3(int start, int end)
in
{
    assert(start >= 0 && end >= 0);
    assert(start < end);
}
do
{
    int[] arr;
    arr.reserve(end - start + 1);
    foreach (i; start .. end + 1)
    {
        arr ~= i;
    }
    return arr;
}

void main()
{
    writeln(range1(4, 9));
}

unittest
{
    int[] result = [4, 5, 6, 7, 8, 9];
    assert(range(4, 9) == result);
    assert(range1(4, 9) == result);
    assert(range2(4, 9) == result);
    assert(range3(4, 9) == result);
}
