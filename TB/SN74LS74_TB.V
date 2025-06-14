
module SN74LS74_TB;
    reg CLR_1, PRE_1, D_1, CLK_1;
    reg CLR_2, PRE_2, D_2, CLK_2;
    wire Q_1, Q_1b, Q_2, Q_2b;

    SN74LS74 uut (
        .CLR_1(CLR_1), .PRE_1(PRE_1), .D_1(D_1), .CLK_1(CLK_1),
        .Q_1(Q_1), .Q_1b(Q_1b),
        .CLR_2(CLR_2), .PRE_2(PRE_2), .D_2(D_2), .CLK_2(CLK_2),
        .Q_2(Q_2), .Q_2b(Q_2b)
    );

    // Clock generation both clocks are independent
    always begin #5 CLK_1 = ~CLK_1;end  // 10ns period
    always begin #10 CLK_2 = ~CLK_2; end // 20ns period

    initial begin
        CLK_1 = 0; CLK_2 = 0;
        CLR_1 = 1; PRE_1 = 1; D_1 = 0;
        CLR_2 = 1; PRE_2 = 1; D_2 = 0;
        #20;

        // Testing ff1 Preset and Clear
        PRE_1 = 0; #10; PRE_1 = 1; #10;
        CLR_1 = 0; #10; CLR_1 = 1; #10;

        // Test ff1 Clocked operation
		  //t=60 reached
        D_1 = 1; #15; // should update at t=65
        D_1 = 0; #15; // should update at t=75
        #10;

        // Test FF2: Preset/Clear
        PRE_2 = 0; #10; PRE_2 = 1; #10;
        CLR_2 = 0; #10; CLR_2 = 1; #10;

        // Test FF2: Clocked operation
        #10; // t=80ns
        D_2 = 1; #20; // should update at t=90
        D_2 = 0; #20; // should update at t=110
        #50 $finish;
    end
//still trying to find better way to monitor outputs in ISE
//will update if i find something more convenient
    initial begin
        $monitor("Time=%0d: CLK1=%b D1=%b Q1=%b | CLK2=%b D2=%b Q2=%b",
            $time, CLK_1, D_1, Q_1, CLK_2, D_2, Q_2);
    end
endmodule

