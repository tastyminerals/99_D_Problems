module fibo;
/*
The Fibonacci Sequence is the series of numbers:
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
The next number is found by adding up the two numbers before it.
*/

import std.stdio;
import std.conv : to;
import std.datetime;
import std.format;
import std.exception;
import std.datetime.stopwatch : benchmark;


// evil fibonacci, one day it will consume the world!
uint evilFib(uint n = 35)
{
    return n < 2 ? n : evilFib(n - 1) + evilFib(n - 2);
}

uint fib(uint n = 35)
{
    uint iter(uint i, uint fib_1, uint fib_2)
    {
        return i == n ? fib_2 : iter(i + 1, fib_1 + fib_2, fib_1);
    }

    return iter(0, 1, 0);
}

uint fibPure(uint n) pure
{
    uint fib_1 = 1, fib_2 = 0;
    foreach (i; 0 .. n)
    {
        auto t = fib_1;
        fib_1 += fib_2;
        fib_2 = t;
    }
    return fib_2;
}

void main(string[] args)
{
    uint num = to!uint(args[1]);
    assert(num < 50, "Seriously, you don't want to do it");

    auto results = benchmark!(() { evilFib(num); }, () { fib(num); }, () {
        fibPure(num);
    })(1);

    foreach (Duration r; results)
    {
        writeln(r);
    }
}

unittest
{
    assert(evilFib(13) == 233);
    assert(fib(13) == 233);
    assert(fibPure(13) == 233);
    writeln("tests passed!");
}
