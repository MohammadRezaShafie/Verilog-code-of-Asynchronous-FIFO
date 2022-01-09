`timescale 1ns / 1ps

module FIFO_MEMORY(
		input  wclk,rclk,
		input  wclken,rclken,
		input  [addresssize:0]waddr,raddr,
		input  [7:0]wdata,
		output reg [7:0]rdata
    );
	 
	 parameter depth = 31 , depthsize = 5 , addresssize = 4 ;

	reg [7:0]FIFO[0:depth];
	
	always @ (posedge wclk)
		begin
			if (wclken==1) FIFO[waddr]=wdata;
		end
	always @ (posedge rclk)
		begin
			if (rclken==1) rdata=FIFO[raddr];
		end		
endmodule
