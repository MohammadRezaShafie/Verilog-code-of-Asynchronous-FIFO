`timescale 1ns / 1ps
module write_control(		
		input  wen,wclk,wrst_n,
		input  [depthsize:0]rptr_wclk,
		output reg[addresssize:0]waddr,
		output reg[depthsize:0]wptr,
		output reg wfull
    );

	 parameter depth = 31 , depthsize = 5 , addresssize = 4 ;

	 initial 
	 begin
		wptr=5'b00000;
		waddr = 4'b0000;
		wfull=0 ; 
	 end
	 
	 always @ (posedge wclk)
		begin
			if(wrst_n==0)
			begin
			wptr = 5'b00000;
			wfull = 0 ;
			waddr = 4'b0000;
			end
			else
			begin
				if (wen==1)
				begin
					if (wfull==0)
						begin
						waddr=wptr[addresssize:0];
							if({~wptr[depthsize],wptr[depthsize-1:0]} == rptr_wclk[depthsize:0]) wfull=1;
							else 
							begin
							wptr = wptr+ 1'b1;
							wfull=0;
							end
						end
					else
						begin
						if({~wptr[depthsize],wptr[depthsize-1:0]} != rptr_wclk[depthsize:0]) wfull=0;
						end
				end
			end
		end
		
endmodule
