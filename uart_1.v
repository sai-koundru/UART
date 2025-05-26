
module uart_1
(
input wire clk_1,
input wire [7:0] din_1, 
input wire trigger_1,


output reg tx_1 = 1
);

parameter       TRIGGER                        =           4'd0,
                           IDLE                                =           4'd1,
                           START                            =           4'd2,
                           DATA                             =           4'd3,
                           PARITY                          =           4'd4,
                           STOP                             =           4'd5;
                          
                           
                           
reg [7:0] shift_reg = 0;

reg [3:0] state = TRIGGER;

reg [7:0] data_hold = 0;
reg [2:0] bit_count = 0;
reg parity_bit ;
reg parity_2 = 0;




always @(posedge clk_1)
    begin
    
        case(state)
        
        
        TRIGGER : begin
                                if (trigger_1) 
                                    begin
                                        shift_reg <= din_1;
                                        
                                        parity_bit <= (parity_2 == 0) ? ^din_1 : ~^din_1;
                                        
                                        state <= IDLE;
                                    end
                           end
                           
                           
                           
        IDLE : begin    
                        tx_1 <= 1;        
                            if (trigger_1) 
                                    begin
                                        state <= START;
                                    end
                    end 
    
    
    
        START : begin
                           tx_1 <= 0;
                           state <= DATA;
                       end
                       
                       
                       
        DATA : begin
                           tx_1 <= shift_reg[7];       
                           shift_reg <= {shift_reg[6:0], 1'b0};
                           bit_count <= bit_count + 1;
                           
                                if (bit_count == 7)
                                    begin
                                        state <= PARITY;
                                    end
                      end
                      
                      
                      
         PARITY : begin 
                                tx_1 <= parity_bit; 
                                state <= STOP;
                         end
                                

                                
          STOP : begin
                            tx_1 <= 1;
                            state <= IDLE;
                       end
                                
                        
                                                
         default: state <= IDLE;
        
        
        endcase
        
    end
    
endmodule