`timescale 1ns / 1ps
`include "half_adder.v"
module half_adder_tb;

    // Declare testbench signals
    reg a;
    reg b;
    wire carry,sum;

    // Instantiate and gate module
    half_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Stimulus block
    initial begin
        $display("Time | a     b     |  carry  | sum");
        $display("----------------------------------");

        // Apply all input combinations
        a = 0; b = 0; #10;
        $display("%4t  | %b   %b     | %b    | %b"  , $time, a, b, carry, sum);

        a = 0; b = 1; #10;
        $display("%4t  | %b   %b     | %b    | %b" , $time, a, b, carry, sum);

        a = 1; b = 0; #10;
        $display("%4t  | %b   %b     | %b    | %b" , $time, a, b, carry, sum);

        a = 1; b = 1; #10;
        $display("%4t  | %b   %b     | %b    | %b" , $time, a, b, carry, sum);

        $finish;
    end
    
initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, half_adder_tb);
end
endmodule