// MAC Array - NxN grid of PEs
// Each PE(i,j) computes A[i,k] * B[k,j] and accumulates into C[i,j]

module mac_array #(
    parameter MAC_WIDTH  = 8,   // Array size = MAC_WIDTH x MAC_WIDTH
    parameter DATA_WIDTH = 8,   // Input data width (8 or 16)
    parameter ACC_WIDTH  = 32   // Accumulator width
)(
    input  wire clk,
    input  wire rst_n,
    input  wire enable,
    input  wire clear_acc,

    // Row inputs: one element of A for each row (A[i,k])
    input  wire [DATA_WIDTH-1:0] a_row [0:MAC_WIDTH-1],

    // Column inputs: one element of B for each column (B[k,j])
    input  wire [DATA_WIDTH-1:0] b_col [0:MAC_WIDTH-1],

    // Accumulator outputs for each C[i,j]
    output wire [ACC_WIDTH-1:0] c_acc [0:MAC_WIDTH-1][0:MAC_WIDTH-1]
);

    genvar i, j;
    generate
        for (i = 0; i < MAC_WIDTH; i = i + 1) begin : ROW
            for (j = 0; j < MAC_WIDTH; j = j + 1) begin : COL
                pe #(
                    .DATA_WIDTH(DATA_WIDTH),
                    .ACC_WIDTH(ACC_WIDTH)
                ) u_pe (
                    .clk(clk),
                    .rst_n(rst_n),
                    .enable(enable),
                    .clear_acc(clear_acc),
                    .a_in(a_row[i]),          // A[i,k]
                    .b_in(b_col[j]),          // B[k,j]
                    .acc_out(c_acc[i][j])     // C[i,j]
                );
            end
        end
    endgenerate

endmodule