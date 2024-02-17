const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("readline/readline.h");
});

pub fn readline(prompt: [*c]const u8) [*c]u8 {
    const out = c.readline(prompt);
    return out;
}
