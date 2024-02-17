const std = @import("std");
const readline = @import("readline.zig");

const PathIterator = std.mem.SplitIterator(u8, .scalar);

pub fn main() !void {
    const stdout = std.io.getStdOut();

    try stdout.writeAll("bytes: []const u8\n");

    const out = readline.readline("> ");
    defer std.c.free(out);

    var buf: [std.fs.MAX_PATH_BYTES]u8 = undefined;
    const pwd = try std.os.getcwd(&buf);

    const path = std.os.getenv("PATH") orelse "/bin";

    var iter = PathIterator{
        .buffer = path,
        .delimiter = ':',
        .index = 0,
    };

    const el = iter.first();

    std.debug.print("{s} {?s}", .{ pwd, el });
}
