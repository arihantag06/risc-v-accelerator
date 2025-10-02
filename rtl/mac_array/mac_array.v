module mac_array #(
    parameter MAC_WIDTH = 8,
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH = 32
)(
    input  wire clk,
    input  wire rst_n,
    input  wire enable,
    input  wire clear_acc,
    input  wire [MAC_WIDTH*DATA_WIDTH-1:0] matrix_a_row,
    input  wire [MAC_WIDTH*DATA_WIDTH-1:0] matrix_b_col,
    output wire [MAC_WIDTH*MAC_WIDTH*ACC_WIDTH-1:0] accumulators
);

    genvar i, j;
    generate
        for (i = 0; i < MAC_WIDTH; i = i + 1) begin : ROW
            for (j = 0; j < MAC_WIDTH; j = j + 1) begin : COL
                pe #(.DATA_WIDTH(DATA_WIDTH), .ACC_WIDTH(ACC_WIDTH)) u_pe (
                    .clk(clk),
                    .rst_n(rst_n),
                    .enable(enable),
                    .clear_acc(clear_acc),
                    .a_in(matrix_a_row[i*DATA_WIDTH +: DATA_WIDTH]),
                    .b_in(matrix_b_col[j*DATA_WIDTH +: DATA_WIDTH]),
                    .acc_out(accumulators[(i*MAC_WIDTH+j)*ACC_WIDTH +: ACC_WIDTH])
                );
            end
        end
    endgenerate

endmodule