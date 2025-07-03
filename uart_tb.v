 `timescale 1ns / 1ps

module uart_tb;

reg clk_1;      
reg [7:0] din_1;
reg trigger_1;  

reg clk_2; 


wire  [8:0] dout_2;   



    initial clk_1 = 0;
    always #65 clk_1 = ~clk_1;
    
    initial clk_2 = 0;
    always #65 clk_2 = ~clk_2;    
    

        uart_top finale(.clk_1(clk_1), .din_1(din_1), .trigger_1(trigger_1), .clk_2(clk_2), .dout_2(dout_2) );


    initial 
        begin
        
        
         trigger_1 = 0;   
         
        din_1 = 8'b10101010;     
        

            # 5;
            
        trigger_1 = 1;
        
            #320;
        
        trigger_1 = 0;
        

        #10000;
        

        $finish;        
        
    end

endmodule