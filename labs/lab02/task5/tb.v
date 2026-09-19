module tb;

    reg [3:0] t_a;
    reg [3:0] t_b;
    reg       t_op;

    wire [3:0] t_result;

    alu DUT (
        .a(t_a),
        .b(t_b),
        .op(t_op),
        .result(t_result)
    );

    initial begin

        // Addition
        t_a = 4'd3;
        t_b = 4'd2;
        t_op = 1'b0;
        #10;

        // Subtraction
        t_a = 4'd5;
        t_b = 4'd2;
        t_op = 1'b1;
        #10;

        // Change ONLY op
        // This should expose the sensitivity-list bug
        t_a = 4'd5;
        t_b = 4'd2;
        t_op = 1'b0;
        #10;

        t_op = 1'b1;
        #10;

        // More subtraction tests
        t_a = 4'd7;
        t_b = 4'd3;
        t_op = 1'b1;
        #10;

        $finish;
    end

    initial begin
        $monitor($time,
                 " a=%d b=%d op=%b | result=%d",
                 t_a, t_b, t_op, t_result);
    end

endmodule