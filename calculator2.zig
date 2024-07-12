const std = @import("std");

//TO DO fix a error  " error: member function expected 2 argument(s), found 1"

fn readInt(prompt: []const u8) !i32 {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    
    try stdout.print(prompt);
    
    var line: [100]u8 = undefined;
    const line_len = try stdin.readUntilDelimiterOrEof(&line, '\n');
    
    var num: i32 = 0;
    try std.fmt.parseInt(i32, &num, line[0..line_len - 1], 10);
    return num;
}

fn readOp(prompt: []const u8) !u8 {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    
    try stdout.print(prompt);
    
    var line: [2]u8 = undefined;
    _ = try stdin.readUntilDelimiterOrEof(&line, '\n');
    
    return line[0];
}

fn calculate(num1: i32, num2: i32, op: u8) !i32 {
    switch (op) {
        '+' => return num1 + num2,
        '-' => return num1 - num2,
        '*' => return num1 * num2,
        '/' => {
            if (num2 == 0) {
                return error.DivisionByZero;
            }
            return num1 / num2;
        },
        else => return error.InvalidOperation,
    }
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    
    const num1 = try readInt("Digite o primeiro número: ");
    const num2 = try readInt("Digite o segundo número: ");
    const op = try readOp("Escolha a operação (+, -, *, /): ");
    
    const result = try calculate(num1, num2, op);
    
    try stdout.print("Resultado: {}\n", .{result});
}
