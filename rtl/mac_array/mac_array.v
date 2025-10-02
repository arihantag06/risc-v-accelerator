// MAC Array - NxN grid of PEs
// Each PE computes a multiply-accumulate operation in parallel

module mac_array #(
    parameter MAC_WIDTH  = 8,   // Array size = MAC_WIDTH x MAC_WIDTH
    parameter DATA_WIDTH = 8,   // Input data width (8 or 16)
    parameter ACC_WIDTH  = 32   // Accumulator width
)(
    input  wire clk,
    input  wire rst_n,
    input  wire enable,
    input  wire clear_acc,

    // Packed input row of A and column of B
    input  wire [MAC_WIDTH*DATA_WIDTH-1:0] matrix_a_row,
    input  wire [MAC_WIDTH*DATA_WIDTH-1:0] matrix_b_col,

    // Packed accumulators from each PE
    output wire [MAC_WIDTH*MAC_WIDTH*ACC_WIDTH-1:0] accumulators
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
                    // Slice out one element of A row and B col
                    .a_in(matrix_a_row[((i+1)*DATA_WIDTH-1) : (i*DATA_WIDTH)]),
                    .b_in(matrix_b_col[((j+1)*DATA_WIDTH-1) : (j*DATA_WIDTH)]),
                    // Place this PE's accumulator in the packed bus
                    .acc_out(accumulators[((i*MAC_WIDTH + j + 1)*ACC_WIDTH-1) : ((i*MAC_WIDTH + j)*ACC_WIDTH)])
                );
            end
        end
    endgenerate

endmodule