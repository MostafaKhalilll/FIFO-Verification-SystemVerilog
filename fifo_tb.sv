  class Packet;
  
    rand logic [31:0] data_in;
    rand bit Wr_enable, Read_enable;
    
    
    constraint d1 {
      data_in[7:0]   inside {[100:230]};
      data_in[15:8]  inside {[200:255]};
      data_in[23:16]  dist { [0:100] :/30, [100:200] :/60, [200:255] :/10 };
    
      if(data_in[7:0] >= 150){
        data_in[31:24] inside {[0:50]};
      }
        else {
          data_in[31:24] inside {[0:0255]};
        }
    };

    constraint w {
			Wr_enable dist {1 :/90, 0:/10};
} 
    constraint r {
			 Read_enable dist {0 :/90, 1:/10};
}

    
    function void display1();
      $display ("data_in %b", this.data_in);
      $display ("Wr_enable %b", this.Wr_enable);
      $display ("Read_enable %b", this.Read_enable);
    endfunction
    
    
  endclass

module fifo_tb(fifo_if.tb fifoif);

bit[0:2] y;
bit[0:2] values[$]='{3,5,6};

  logic clk;
  
  
  Packet p[5];
  
 initial begin
   
   for (int i = 0; i < 5; i++) begin
      p[i] = new ();  
     p[i].randomize();
      p[i].display1();       
    end
  
 end
 


      covergroup fe @(posedge clk);
        
        full_flag : coverpoint     fifoif.cb.full;

        empty_flag : coverpoint    fifoif.cb.empty;
        
      endgroup : fe
      
      fe fe_inst = new();


    
  initial begin

	fifoif.reset = 1;
    #10;
    fifoif.reset = 0;
    
		fe_inst.sample();

    $finish;
    
  end
      
endmodule
