`timescale 1ns/1ps

module alu_tb;

parameter WIDTH = 16;

// Inputs
reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg [3:0] opcode;

// Outputs
wire [WIDTH-1:0] result;
wire carry_out;
wire zero_flag;
wire overflow_flag;
wire negative_flag;

// Design Under Test (DUT)
alu #(
    .WIDTH(WIDTH)
) dut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry_out(carry_out),
    .zero_flag(zero_flag),
    .overflow_flag(overflow_flag),
    .negative_flag(negative_flag)
);

// Expected values
reg [WIDTH-1:0] expected_result;
reg expected_carry_out;
reg expected_zero_flag;
reg expected_overflow_flag;
reg expected_negative_flag;

integer pass_count;
integer fail_count;

integer i;
    reg [WIDTH:0] expected_temp;

initial begin
    $dumpfile("waveforms/alu.vcd");
    $dumpvars(0, alu_tb);

    pass_count = 0;
    fail_count = 0;
end

task check_result;

    input [WIDTH-1:0] exp_result;
    input exp_carry;
    input exp_zero;
    input exp_overflow;
    input exp_negative;

begin

    #1;

    if ((result == exp_result) &&
        (carry_out == exp_carry) &&
        (zero_flag == exp_zero) &&
        (overflow_flag == exp_overflow) &&
        (negative_flag == exp_negative))
    begin
        pass_count = pass_count + 1;
        $display("PASS");
    end
    else
    begin
        fail_count = fail_count + 1;

        $display("--------------------------------");
        $display("FAIL");
        $display("Expected Result = %h, Actual Result = %h", exp_result, result);
        $display("Expected Carry = %b, Actual Carry = %b", exp_carry, carry_out);
        $display("Expected Zero = %b, Actual Zero = %b", exp_zero, zero_flag);
        $display("Expected Overflow = %b, Actual Overflow = %b", exp_overflow, overflow_flag);
        $display("Expected Negative = %b, Actual Negative = %b", exp_negative, negative_flag);
        $display("--------------------------------");
    end

end

endtask

initial begin

    //-------------------------------------------------
    // Test 1 : ADD
    //-------------------------------------------------
    A = 16'd25;
    B = 16'd10;
    opcode = 4'b0000;

    check_result(16'd35, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 2 : SUB
    //-------------------------------------------------
    A = 16'd20;
    B = 16'd5;
    opcode = 4'b0001;

    check_result(16'd15, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 3 : AND
    //-------------------------------------------------
    A = 16'h00FF;
    B = 16'h0F0F;
    opcode = 4'b0010;

    check_result(16'h000F, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 4 : OR
    //-------------------------------------------------
    A = 16'h00F0;
    B = 16'h0F00;
    opcode = 4'b0011;

    check_result(16'h0FF0, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 5 : XOR
    //-------------------------------------------------
    A = 16'hAAAA;
    B = 16'h5555;
    opcode = 4'b0100;

    check_result(16'hFFFF, 1'b0, 1'b0, 1'b0, 1'b1);

    //-------------------------------------------------
    // Test 6 : NOT
    //-------------------------------------------------
    A = 16'h00FF;
    opcode = 4'b0101;

    check_result(16'hFF00, 1'b0, 1'b0, 1'b0, 1'b1);

    //-------------------------------------------------
    // Test 7 : Shift Left
    //-------------------------------------------------
    A = 16'h0003;
    opcode = 4'b0110;

    check_result(16'h0006, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 8 : Shift Right
    //-------------------------------------------------
    A = 16'h0008;
    opcode = 4'b0111;

    check_result(16'h0004, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 9 : Multiply
    //-------------------------------------------------
    A = 16'd10;
    B = 16'd5;
    opcode = 4'b1000;

    check_result(16'd50, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 10 : Increment
    //-------------------------------------------------
    A = 16'd99;
    opcode = 4'b1001;

    check_result(16'd100, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 11 : Decrement
    //-------------------------------------------------
    A = 16'd100;
    opcode = 4'b1010;

    check_result(16'd99, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 12 : Pass A
    //-------------------------------------------------
    A = 16'h1234;
    opcode = 4'b1011;

    check_result(16'h1234, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 13 : Pass B
    //-------------------------------------------------
    B = 16'h5678;
    opcode = 4'b1100;

    check_result(16'h5678, 1'b0, 1'b0, 1'b0, 1'b0);

    //-------------------------------------------------
    // Test 14 : NAND
    //-------------------------------------------------
    A = 16'hFFFF;
    B = 16'h0F0F;
    opcode = 4'b1101;

    check_result(16'hF0F0, 1'b0, 1'b0, 1'b0, 1'b1);

    //-------------------------------------------------
    // Test 15 : NOR
    //-------------------------------------------------
    A = 16'h0000;
    B = 16'h0000;
    opcode = 4'b1110;

    check_result(16'hFFFF, 1'b0, 1'b0, 1'b0, 1'b1);

    //-------------------------------------------------
    // Test 16 : XNOR
    //-------------------------------------------------
    A = 16'hAAAA;
    B = 16'h5555;
    opcode = 4'b1111;

    check_result(16'h0000, 1'b0, 1'b1, 1'b0, 1'b0);

    //-------------------------------------------------
    // Corner 1 : Add Zero
    //-------------------------------------------------
    A=16'h0000; B=16'h0000; opcode=4'b0000;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 2 : Add Carry
    //-------------------------------------------------
    A=16'hFFFF; B=16'h0001; opcode=4'b0000;
    check_result(16'h0000,1,1,0,0);

    //-------------------------------------------------
    // Corner 3 : Add Signed Overflow
    //-------------------------------------------------
    A=16'h7FFF; B=16'h0001; opcode=4'b0000;
    check_result(16'h8000,0,0,1,1);

    //-------------------------------------------------
    // Corner 4 : Add Negative Overflow
    //-------------------------------------------------
    A=16'h8000; B=16'h8000; opcode=4'b0000;
    check_result(16'h0000,1,1,1,0);

    //-------------------------------------------------
    // Corner 5 : Sub Zero
    //-------------------------------------------------
    A=16'd100; B=16'd100; opcode=4'b0001;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 6 : Sub Negative
    //-------------------------------------------------
    A=16'd5; B=16'd10; opcode=4'b0001;
    check_result(16'hFFFB,1,0,0,1);

    //-------------------------------------------------
    // Corner 7 : Sub Overflow
    //-------------------------------------------------
    A=16'h8000; B=16'h0001; opcode=4'b0001;
    check_result(16'h7FFF,0,0,1,0);

    //-------------------------------------------------
    // Corner 8 : AND All Ones
    //-------------------------------------------------
    A=16'hFFFF; B=16'hFFFF; opcode=4'b0010;
    check_result(16'hFFFF,0,0,0,1);

    //-------------------------------------------------
    // Corner 9 : AND Zero
    //-------------------------------------------------
    A=16'h0000; B=16'hFFFF; opcode=4'b0010;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 10 : OR Zero
    //-------------------------------------------------
    A=16'h0000; B=16'h0000; opcode=4'b0011;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 11 : XOR Same
    //-------------------------------------------------
    A=16'hAAAA; B=16'hAAAA; opcode=4'b0100;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 12 : NOT Zero
    //-------------------------------------------------
    A=16'h0000; opcode=4'b0101;
    check_result(16'hFFFF,0,0,0,1);

    //-------------------------------------------------
    // Corner 13 : Shift Left MSB
    //-------------------------------------------------
    A=16'h8000; opcode=4'b0110;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 14 : Shift Right One
    //-------------------------------------------------
    A=16'h0001; opcode=4'b0111;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 15 : Multiply Zero
    //-------------------------------------------------
    A=16'd500; B=16'd0; opcode=4'b1000;
    check_result(16'd0,0,1,0,0);

    //-------------------------------------------------
    // Corner 16 : Multiply One
    //-------------------------------------------------
    A=16'd1234; B=16'd1; opcode=4'b1000;
    check_result(16'd1234,0,0,0,0);

    //-------------------------------------------------
    // Corner 17 : Increment Max
    //-------------------------------------------------
    A=16'hFFFF; opcode=4'b1001;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 18 : Increment Overflow
    //-------------------------------------------------
    A=16'h7FFF; opcode=4'b1001;
    check_result(16'h8000,0,0,0,1);

    //-------------------------------------------------
    // Corner 19 : Decrement Zero
    //-------------------------------------------------
    A=16'h0000; opcode=4'b1010;
    check_result(16'hFFFF,0,0,0,1);

    //-------------------------------------------------
    // Corner 20 : Pass A
    //-------------------------------------------------
    A=16'hABCD; opcode=4'b1011;
    check_result(16'hABCD,0,0,0,1);

    //-------------------------------------------------
    // Corner 21 : Pass B
    //-------------------------------------------------
    B=16'h1234; opcode=4'b1100;
    check_result(16'h1234,0,0,0,0);

    //-------------------------------------------------
    // Corner 22 : NAND
    //-------------------------------------------------
    A=16'hFFFF; B=16'hFFFF; opcode=4'b1101;
    check_result(16'h0000,0,1,0,0);

    //-------------------------------------------------
    // Corner 23 : NOR
    //-------------------------------------------------
    A=16'h0000; B=16'h0000; opcode=4'b1110;
    check_result(16'hFFFF,0,0,0,1);

    //-------------------------------------------------
    // Corner 24 : XNOR
    //-------------------------------------------------
    A=16'hAAAA; B=16'hAAAA; opcode=4'b1111;
    check_result(16'hFFFF,0,0,0,1);

    //-------------------------------------------------
    // Randomized Testing
    //-------------------------------------------------

    

    for(i = 0; i < 100; i = i + 1)
    begin

        A = $random;
        B = $random;
        opcode = $random % 16;

        case(opcode)

            4'b0000: begin
                expected_temp = A + B;
                expected_result = expected_temp[WIDTH-1:0];
                expected_carry_out = expected_temp[WIDTH];
                expected_overflow_flag =
                    (~(A[WIDTH-1]^B[WIDTH-1])) &
                    (A[WIDTH-1]^expected_result[WIDTH-1]);
            end

            4'b0001: begin
                expected_temp = A - B;
                expected_result = expected_temp[WIDTH-1:0];
                expected_carry_out = expected_temp[WIDTH];
                expected_overflow_flag =
                    (A[WIDTH-1]^B[WIDTH-1]) &
                    (A[WIDTH-1]^expected_result[WIDTH-1]);
            end

            4'b0010: expected_result = A & B;
            4'b0011: expected_result = A | B;
            4'b0100: expected_result = A ^ B;
            4'b0101: expected_result = ~A;
            4'b0110: expected_result = A << 1;
            4'b0111: expected_result = A >> 1;
            4'b1000: expected_result = A * B;
            4'b1001: expected_result = A + 1;
            4'b1010: expected_result = A - 1;
            4'b1011: expected_result = A;
            4'b1100: expected_result = B;
            4'b1101: expected_result = ~(A & B);
            4'b1110: expected_result = ~(A | B);
            4'b1111: expected_result = ~(A ^ B);

        endcase

        if(opcode != 4'b0000 && opcode != 4'b0001)
        begin
            expected_carry_out = 0;
            expected_overflow_flag = 0;
        end

        expected_zero_flag = (expected_result == 0);
        expected_negative_flag = expected_result[WIDTH-1];

        check_result(
            expected_result,
            expected_carry_out,
            expected_zero_flag,
            expected_overflow_flag,
            expected_negative_flag
        );

    end


    //-------------------------------------------------
    // Summary
    //-------------------------------------------------

    $display("=================================");
    $display("PASS = %0d", pass_count);
    $display("FAIL = %0d", fail_count);
    $display("=================================");

    $finish;

end


endmodule