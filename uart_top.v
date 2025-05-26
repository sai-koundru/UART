module uart_top
(
    input wire clk_1,
    input wire [7:0] din_1, 
    input wire trigger_1,

    input wire clk_2,

    output wire [8:0] dout_2
);

            wire tx_line;

        uart_1 uart_tb_1( .clk_1(clk_1), .din_1(din_1), .trigger_1(trigger_1), .tx_1(tx_line) );
        
        uart_2 uart_tb_2( .clk_2(clk_2), .tx_1(tx_line), .dout_2(dout_2) );

endmodule