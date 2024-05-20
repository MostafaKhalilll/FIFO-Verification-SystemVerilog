
module top;
  
  bit clk;
  
  always #10 clk = ~ clk;
  
  
  fifo_if 	fifoif 	(clk);
  fifo_tb 	tb 		(fifoif);
  FIFO 		dut		(clk, fifoif.reset, fifoif.Wr_enable, fifoif.Read_enable, fifoif.data_in, fifoif.data_out, fifoif.full, fifoif.empty);
  
  
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars;
    
  end
  
    
    assert property(@(posedge clk) disable iff(fifoif.reset) (fifoif.Wr_enable && $stable(fifoif.full)) |-> $rose(dut.write_ptr));
  
endmodule
