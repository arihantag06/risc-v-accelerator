// Single Processing Element (PE) - Multiply and Accumulate
// Supports int8 or int16 inputs with 32-bit accumulation

module pe #(
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH  = 32
)(
    input  wire clk,
    input  wire rst_n,
    input  wire enable,
    input  wire clear_acc,

    input  wire signed [DATA_WIDTH-1:0] a_in,
    input  wire signed [DATA_WIDTH-1:0] b_in,

    output reg signed [ACC_WIDTH-1:0] acc_out
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            acc_out <= 0;
        else if (clear_acc)
            acc_out <= 0;
        else if (enable)
            acc_out <= acc_out + (a_in * b_in);
    end

endmodule