/*
Extract a given number of randomly selected elements from a list.

Example:
    randomSelect(3, ['a', 'b', 'c', 'd', 'f', 'g', 'h']) --> ['e', 'd', 'a']
*/

import std.stdio;
import std.range;
import std.random : uniform, randomShuffle, MinstdRand0;
import std.algorithm : map;

dchar[] randomSelect(in int i, dchar[] arr)
{
    auto rnd = MinstdRand0(1);
    return arr.randomShuffle(rnd).take(i).array;
}

dchar[] randomSelect1(in int i, dchar[] arr)
{
    return generate!(() => arr[uniform(0, i)]).take(i).array;
}

dchar[] randomSelect2(in int i, dchar[] arr)
{
    auto idx = generate!(() => uniform(0, i)).take(i);
    return arr.indexed(idx).array;
}

void main()
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'f', 'g', 'h'];
    writeln(randomSelect(3, darr));
    writeln(randomSelect1(3, darr));
    writeln(randomSelect2(3, darr));
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'f', 'g', 'h'];
    assert(randomSelect(3, darr).length == 3);
}
