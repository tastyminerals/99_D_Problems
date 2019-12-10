module package_utils;


void writeResult(T, R)(T[] param, R result) {
    import std.stdio;
    import std.format;
    writeln(format("%s --> %s", param, result));
}
