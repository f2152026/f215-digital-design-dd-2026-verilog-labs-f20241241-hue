module tb;

    // Testbench inputs
    reg [1:0] t_A;
    reg [1:0] t_B;

    // DUT outputs
    wire t_GT;
    wire t_LT;
    wire t_EQ;

    // Instantiate comparator
    comp2 DUT (
        .A(t_A),
        .B(t_B),
        .GT(t_GT),
        .LT(t_LT),
        .EQ(t_EQ)
    );

    integer a, b;
    integer errors;

    initial begin

        errors = 0;

        // Test all 16 combinations
        for (a = 0; a < 4; a = a + 1) begin
            for (b = 0; b < 4; b = b + 1) begin

                t_A = a;
                t_B = b;

                #1;

                if ((t_GT !== (a > b)) ||
                    (t_LT !== (a < b)) ||
                    (t_EQ !== (a == b))) begin

                    $display("ERROR: A=%b B=%b | GT=%b LT=%b EQ=%b",
                             t_A, t_B, t_GT, t_LT, t_EQ);

                    errors = errors + 1;
                end

                else begin

                    $display("PASS:  A=%b B=%b | GT=%b LT=%b EQ=%b",
                             t_A, t_B, t_GT, t_LT, t_EQ);

                end

            end
        end

        if (errors == 0)
            $display("ALL TESTS PASSED");

        else
            $display("TOTAL ERRORS = %0d", errors);

        $finish;
    end

endmodule