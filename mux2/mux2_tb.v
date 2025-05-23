`timescale 1ns / 1ps
`include "mux2.v"
module mux2_tb;

    // Declare testbench signals
    reg a;
    reg b;
    reg sel;
    wire y;

    // Instantiate or gate module
    mux2 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    // Stimulus block
    initial begin

       $display("Time\tSel\tA\tB\tY");
       $monitor("%0dns\t%b\t%b\t%b\t%b", $time, sel, a, b, y);

        // Apply all input combinations
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 1; sel = 0; #10;

        a = 0; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;
        $finish;
    end
    
initial begin
    $dumpfile("mux2.vcd");
    $dumpvars(0, mux2_tb);
end
endmodule