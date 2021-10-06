module dlatch (
    input wire D,
    input wire E,
    output wire Q,
    output wire NOT_Q
);

wire R = ~D & E;
wire S = D & E;

srlatch srlatch(
    .R(R),
    .S(S),
    .Q(Q),
    .NOT_Q(NOT_Q)
);
    
endmodule