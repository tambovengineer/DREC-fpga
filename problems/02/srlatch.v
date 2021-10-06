module srlatch (
    input wire R,
    input wire S,
    output wire Q,
    output wire NOT_Q
);

assign Q = ~(NOT_Q | R);
assign NOT_Q = ~(Q | S);
    
endmodule