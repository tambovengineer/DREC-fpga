`timescale 1 ns / 100 ps

module testbench(); 

reg clk = 1'b0; 

always begin
    #1 clk = ~clk; 
end

reg clear = 1;

dflipflop dflipflop(
    .D(tmp & (~clear)),
    .CLK(clk),
    .Q(clk1),
    .NOT_Q(tmp)
);


initial begin
    $dumpvars;     
    $display("Test started...");

    #2 clear = 0;
     
    #8 $finish;   
end

endmodule