const std = @import("std");

const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("readline/readline.h");
});

pub fn main() !void {
    const stdout = std.io.getStdOut();

    try stdout.writeAll("bytes: []const u8\n");

    var data: [*c]u8 = 0;
    const out = c.readline(data);
    defer std.c.free(data);

    std.debug.print("You entered: {s}", .{out});
}
