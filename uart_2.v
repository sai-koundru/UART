
module uart_2
(
input tx_1,
input clk_2,

output reg [7:0] dout_2 = 0
);

parameter       START                                  =           4'd0,
                           RECIEVE                              =           4'd1,
                           PARITY                                =           4'd2,
                           STOP_REMOVE                 =           4'd3,
                           DATA                                   =           4'd4;
                          
                           
reg [7:0] data_reg = 8'h00;
reg [3:0] state = START;
reg [2:0] bit_count = 0; 
reg even_parity = 0;
reg odd_parity = 0;
reg success = 0;



always @(negedge clk_2)
    begin
    
    
        case(state)
        
        START : begin
                        if(tx_1 == 0) 
                            begin
                                state <= RECIEVE;
                            end
                       end
                   
                   
                   
         RECIEVE : begin
                                data_reg <= {data_reg[6:0], tx_1};
                                
                                if(bit_count == 7)
                                    begin
                                        bit_count <= 0;
                                        state <= PARITY;
                                    end    
                                    
                                  else 
                                    begin 
                                        bit_count <= bit_count+ 1;
                                  end 
                           end     
                          
                           
                           
           PARITY : begin
                                if(tx_1 == 1)
                                    begin
                                        odd_parity <= 1;
                                        state <= STOP_REMOVE;
                                    end
                                    
                                else
                                    begin
                                        even_parity <= 1;
                                        state <= STOP_REMOVE;
                                    end
                           end                           
                           
                           
                           
          STOP_REMOVE : begin
                                               if(tx_1 == 1)
                                                    begin
                                                        state <= DATA;
                                                    end
                                           end
                                          
                                         
                                         
          DATA : begin
                            dout_2 <= data_reg;
                            success <= 1;
                        end




        endcase
        
    end
    
endmodule