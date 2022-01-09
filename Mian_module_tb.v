`timescale 1ns / 1ps

module Mian_module_tb();

	reg wen,ren;
	reg rclk,wclk;
	reg wrst_n,rrst_n;
	reg [7:0]wdata;
	wire wfull,rempty;
	wire[7:0]rdata;	

	Main_module DUT(wen,ren,rclk,wclk,wrst_n,rrst_n,wdata,wfull,rempty,rdata);

	initial 
	begin
		rclk = 0;
		wclk = 0;
		wen  = 0;
		ren  = 0;
		wrst_n = 0 ;
		rrst_n = 0 ;
	end 
		
		parameter readclk = 30 , writeclk = 10; 
		
		parameter two_readclk=2*readclk;
		parameter two_writeclk=2*writeclk;
		
		// if readclk = 1 => T = 2ns => f = 500MHz
		
		always #readclk rclk = ~ rclk;
		always #writeclk wclk = ~ wclk;
		
		initial 
		begin
			#5
			wrst_n = 1 ;
			rrst_n = 1 ;
			wen = 1 ; 
			ren = 0 ;
			#two_writeclk
			wdata = 8'b00000000;
			#two_writeclk
			wdata = 8'b00000001;
			#two_writeclk
			wdata = 8'b00000010;
			#two_writeclk
			wdata = 8'b00000011;
			#two_writeclk
			wdata = 8'b00000100;
			#two_writeclk
			wdata = 8'b00000101;
			#two_writeclk
			wdata = 8'b00000110;
			#two_writeclk
			wdata = 8'b00000111;
			#two_writeclk;
			wdata = 8'b00001000;
			#two_writeclk;
			wdata = 8'b00001001;
			#two_writeclk
			wdata = 8'b00001010;
			#two_writeclk
			wdata = 8'b00001011;
			#two_writeclk
			wdata = 8'b00001100;
			#two_writeclk
			wdata = 8'b00001101;
			#two_writeclk;
			wdata = 8'b00001110;
			#two_writeclk;
			wdata = 8'b00001111;
			#two_writeclk
			wdata = 8'b11110000;
			#two_writeclk
			wdata = 8'b11110001;
			#two_writeclk
			wdata = 8'b11110010;
			#two_writeclk
			wdata = 8'b11110011;
			#two_writeclk
			wdata = 8'b11110100;
			#two_writeclk
			wdata = 8'b11110101;
			#two_writeclk
			wdata = 8'b11110110;
			#two_writeclk
			wdata = 8'b11110111;
			#two_writeclk;
			wdata = 8'b11111000;
			#two_writeclk;
			wdata = 8'b11111001;
			#two_writeclk
			wdata = 8'b11111010;
			#two_writeclk
			wdata = 8'b11111011;
			#two_writeclk
			wdata = 8'b11111100;
			#two_writeclk
			wdata = 8'b11111101;
			#two_writeclk;
			wdata = 8'b11111110;
			#two_writeclk;
			wdata = 8'b11111111;
			#two_writeclk;
			ren=1;
			
			#two_readclk
			#two_readclk
			#two_readclk
			#two_readclk
			#two_readclk
			#two_readclk
			#two_readclk
			#two_readclk
	
			
			rrst_n = 0 ;
			#two_readclk
			rrst_n = 1 ;
			#two_readclk;
			
		end

endmodule
