interface fifo_if(input clk);
  
    bit reset;
    bit Wr_enable;
    bit Read_enable;
 	logic [7:0] data_in;
  	logic [7:0] data_out;
    bit full;
    bit empty;

  
  clocking cb @(posedge clk);
    
    default input #1ns output #2ns;
    
    input full, empty, data_out;
    
    output Wr_enable, Read_enable, reset, data_in;
  
  
  endclocking
  
  modport tb (clocking cb, input clk, output reset);
  
endinterface
