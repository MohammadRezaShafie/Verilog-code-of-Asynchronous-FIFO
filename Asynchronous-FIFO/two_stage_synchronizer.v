`timescale 1ns / 1ps

	module synchronizer (	
		input       clk, rst_n,
		input      [depthsize:0] input_data,  
		output reg [depthsize:0] output_data);  

	 parameter depth = 31 , depthsize = 5 , addresssize = 4 ;

	reg [depthsize:0] r_data;

	always @(posedge clk) 
	begin  
		if (rst_n==1) 
		begin
		r_data <= input_data;
		output_data <= r_data;
		end	
		else
		begin
			r_data <= 0 ;
			output_data <= 0;
		end
	end	
	endmodule 