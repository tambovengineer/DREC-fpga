module dflipflop (
    input wire D,
    input wire CLK,
    output wire Q,
    output wire NOT_Q
);

wire QM;

dlatch dlatch1(
    .D(D),
    .E(~CLK),
    .Q(QM),
    .NOT_Q()
);

dlatch dlatch2(
    .D(QM),
    .E(CLK),
    .Q(Q),
    .NOT_Q(NOT_Q)
);
    
endmodule