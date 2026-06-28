module alu #(
    parameter WIDTH = 16
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  [3:0] opcode,

    output reg [WIDTH-1:0] result,
    output reg carry_out,
    output reg zero_flag,
    output reg overflow_flag,
    output reg negative_flag
);

reg [WIDTH:0] temp;

always @(*) begin

    result = 0;
    carry_out = 0;
    zero_flag = 0;
    overflow_flag = 0;
    negative_flag = 0;
    temp = 0;

    case (opcode)

        4'b0000: begin
            temp = A + B;
            result = temp[WIDTH-1:0];
            carry_out = temp[WIDTH];
        end

        4'b0001: begin
            temp = A - B;
            result = temp[WIDTH-1:0];
            carry_out = temp[WIDTH];
        end

        4'b0010: begin
            result = A & B;
        end

        4'b0011: begin
            result = A | B;
        end

        4'b0100: begin
            result = A ^ B;
        end

        4'b0101: begin
            result = ~A;
        end

        4'b0110: begin
            result = A << 1;
        end

        4'b0111: begin
            result = A >> 1;
        end

        4'b1000: begin
            result = A * B;
        end

        4'b1001: begin
            result = A + 1;
        end

        4'b1010: begin
            result = A - 1;
        end

        4'b1011: begin
            result = A;
        end

        4'b1100: begin
            result = B;
        end

        4'b1101: begin
            result = ~(A & B);
        end

        4'b1110: begin
            result = ~(A | B);
        end

        4'b1111: begin
            result = ~(A ^ B);
        end

        default: begin
            result = 0;
        end

    endcase

    // Zero Flag
    zero_flag = (result == 0);

    // Negative Flag
    negative_flag = result[WIDTH-1];

    // Overflow Flag
    if (opcode == 4'b0000)
        overflow_flag = (~(A[WIDTH-1] ^ B[WIDTH-1])) &
                        (A[WIDTH-1] ^ result[WIDTH-1]);
    else if (opcode == 4'b0001)
        overflow_flag = (A[WIDTH-1] ^ B[WIDTH-1]) &
                        (A[WIDTH-1] ^ result[WIDTH-1]);

end

endmodule