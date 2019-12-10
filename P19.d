/*
Rotate a list N places to the left.

Examples:
    rotate(3, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']) -->
    ['d', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'a', 'b', 'c']

    rotate(-2, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']) -->
    ['j', 'k', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']
*/

import std.stdio;
import std.range;
import std.math : abs;
import std.algorithm : reverse, bringToFront;

dchar[] rotate(int n, dchar[] arr)
{
    arr = n < 0 ? arr.reverse : arr;
    bringToFront(arr[0 .. abs(n)], arr[abs(n) .. $]);
    return n < 0 ? arr.reverse : arr;
}

dchar[] rotate2(int n, dchar[] arr)
{
    int start = n % arr.length;
    return n > 0 ? arr.drop(n) ~ arr.take(n) : rotate2(n + arr.length, arr);
}


void main()
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    writeln(rotate(3, darr.dup));
    writeln(rotate(-2, darr.dup));
    writeln(rotate3(3, darr.dup));
    writeln(rotate3(-2, darr.dup));
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    dchar[] result1 = ['d', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'a', 'b', 'c'];
    dchar[] result2 = ['j', 'k', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i'];
    assert(rotate(3, darr.dup) == result1);
    assert(rotate(-2, darr.dup) == result2);
    assert(rotate2(3, darr.dup) == result1);
    assert(rotate2(-2, darr.dup) == result2);
    writeln("Tests passed!");
}
