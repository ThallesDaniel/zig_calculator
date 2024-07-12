const std = @import("std");

pub fn main() void {
    const stdout = std.io.getStdOut().writer();
    const allocator = std.heap.page_allocator;

    const num1 = 10;
    const num2 = 20;

    const sum = num1 + num2;
    const diff = num1 - num2;
    const prod = num1 * num2;
    const quot = num1 / num2;

    _ = allocator; // Para evitar o erro de constante não utilizada

    stdout.print("Soma: {}\n", .{sum}) catch {};
    stdout.print("Diferença: {}\n", .{diff}) catch {};
    stdout.print("Produto: {}\n", .{prod}) catch {};
    stdout.print("Quociente: {}\n", .{quot}) catch {};
}
