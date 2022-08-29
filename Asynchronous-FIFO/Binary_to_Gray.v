`timescale 1ns / 1ps

module Binary_to_Gray(
		input  [depthsize:0]binary,
		output [depthsize:0]gray
    );
		
	 parameter depth = 31 , depthsize = 5 , addresssize = 4 ;

assign gray = (binary >> 1) ^ binary;


	
endmodule
