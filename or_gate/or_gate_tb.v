`timescale 1ns / 1ps
`include "or_gate.v"
module or_gate_tb;

    // Declare testbench signals
    reg a;
    reg b;
    wire y;

    // Instantiate or gate module
    or_gate dut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Stimulus block
    initial begin
        $display("Time | a b | y");
        $display("-------------");

        // Apply all input combinations
        a = 0; b = 0; #10;
        $display("%4t | %b %b | %b", $time, a, b, y);

        a = 0; b = 1; #10;
        $display("%4t | %b %b | %b", $time, a, b, y);

        a = 1; b = 0; #10;
        $display("%4t | %b %b | %b", $time, a, b, y);

        a = 1; b = 1; #10;
        $display("%4t | %b %b | %b", $time, a, b, y);

        $finish;
    end
    
initial begin
    $dumpfile("or_gate.vcd");
    $dumpvars(0, or_gate_tb);
end
endmodule