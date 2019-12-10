/*
Lotto: Draw N different random numbers from the set 1..M.

Example:
    lotto(6, 49) --> [23, 1, 17, 33, 21, 37]
*/

import std.stdio;
import std.range;
import std.random : uniform, randomShuffle, randomSample;

int[] lotto(int n, int m)
{
    return iota(1, m + 1).array.randomShuffle.take(n);
}

int[] lotto1(int n, int m)
{
    // randomSample is O(n)
    return iota(1, m + 1).randomSample(n, m).array;
}

void main()
{
    writeln(lotto(6, 49));
    writeln(lotto1(6, 49));
}

unittest
{
    assert(lotto(6, 49).length == 6); // some lazy test
    assert(lotto1(6, 49).length == 6); // some lazy test
}
