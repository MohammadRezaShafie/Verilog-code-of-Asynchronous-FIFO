`timescale 1ns / 1ps
module read_control(	
		input  ren,rclk,rrst_n,
		input  [depthsize:0]wptr_rclk,
		output reg[addresssize:0]raddr,
		output reg[depthsize:0]rptr,
		output reg rempty
    );

	 parameter depth = 31 , depthsize = 5 , addresssize = 4 ;
		
	 initial 
	 begin
		rptr=5'b00000;
		rempty=1; 
	 end
	 
	 always @ (posedge rclk)
		begin
			if (rrst_n == 0)
			begin
			rptr = 5'b00000;
			rempty = 1;
			raddr = 4'b0000;
			end
			else 
			begin
			if (wptr_rclk != rptr) rempty = 0 ; 
				if (ren == 1)
				begin
						if (rempty == 0)
						begin
							if (rptr == wptr_rclk) rempty =1 ; 
							else
							begin
							raddr = rptr[addresssize:0];
							rptr = rptr + 1'b1 ; 
							end
						end
				end
			end
		end
endmodule
