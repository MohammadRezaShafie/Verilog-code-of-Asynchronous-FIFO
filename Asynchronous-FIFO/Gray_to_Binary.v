`timescale 1ns / 1ps

module Gray_to_Binary(
		input  [depthsize:0]gray,
		output [depthsize:0]binary
    );

	 parameter depth = 31 , depthsize = 5 , addresssize = 4 ;

assign binary[depthsize] = gray[depthsize];

generate 
genvar i ; 
		for(i=0 ; i<depthsize ; i = i +1)
		begin : Gray_to_Binary
			assign binary[i] = gray[i]^binary[i+1] ;
		end
endgenerate		

endmodule 