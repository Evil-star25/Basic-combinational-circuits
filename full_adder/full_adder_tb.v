`timescale 1ns / 1ps
`include "full_adder.v"
module full_adder_tb;

    // Declare testbench signals
    reg a;
    reg b;
    reg cin;
    wire cout;
    wire sum;

    // Instantiate and gate module
    full_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .cin(cin),
        .cout(cout)
    );

    // Stimulus
    initial begin
        $display("Time | a   b   cin  |   cout   sum");
        $display("--------------------------");

        a = 0; b = 0; cin = 0; #10;
        $display("%4t | %b   %b   %b  |  %b    %b", $time, a, b, cin, cout, sum);

        a = 0; b = 0; cin = 1; #10;
        $display("%4t | %b   %b   %b  |  %b    %b", $time, a, b, cin, cout, sum);

        a = 0; b = 1; cin = 0; #10;
        $display("%4t | %b   %b   %b  |  %b    %b", $time, a, b, cin, cout, sum);
 
        a = 0; b = 1; cin = 1; #10;
        $display("%4t | %b   %b   %b  |  %b    %b", $time, a, b, cin, cout, sum);

        a = 1; b = 0; cin = 0; #10;
        $display("%4t | %b   %b   %b  |  %b    %b", $time, a, b, cin, cout, sum);

        a = 1; b = 0; cin = 1; #10;
        $display("%4t | %b   %b   %b  |  %b    %b", $time, a, b, cin, cout, sum);

        a = 1; b = 1; cin = 0; #10;
        $display("%4t | %b   %b   %b  |  %b    %b", $time, a, b, cin, cout, sum);

        a = 1; b = 1; cin = 1; #10;
        $display("%4t | %b   %b   %b  |  %b    %b", $time, a, b, cin, cout, sum);

        $finish;
    end

    // For waveform generation
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);
    end

endmodule