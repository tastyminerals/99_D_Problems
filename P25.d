/*
Generate a random permutation of the elements of a list.

Example:
    randomPermute(['a', 'b', 'c', 'd', 'e', 'f']) --> ['b', 'a', 'd', 'c', 'e', 'f']
*/

import std.stdio;
import std.random : randomShuffle;

dchar[] randomPermute(dchar[] arr)
{
    return arr.randomShuffle;
}

void main()
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f'];
    writeln(randomPermute(darr));
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f'];
    assert(randomPermute(darr).length == darr.length); // lazy test
}
