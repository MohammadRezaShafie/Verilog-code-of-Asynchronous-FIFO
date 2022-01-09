`timescale 1ns / 1ps

module Main_module(
		input wen,ren,
		input rclk,wclk,
		input wrst_n,rrst_n,
		input [7:0]wdata,
		output wfull,rempty,
		output[7:0]rdata		
    );
	 
	 parameter depth = 31 , depthsize = 5 , addresssize = 4 ;
	
	wire w_wfull,w_wclken,w_wfull_not,w_rempty_not;
	wire w_rempty,w_rclken;
	wire [addresssize:0]w_waddr,w_raddr;
	wire [depthsize:0]w_wptr,w_rptr,w_rptr_wclk,w_wptr_rclk,w_wptr_Gray,w_rptr_Gray,w_wptr_rclk_Gray,w_rptr_wclk_Gray ;
	
	not		not1(w_wfull_not,w_wfull);
	not		not2(w_rempty_not,w_rempty);
	
	and 		and1(w_wclken,wen,w_wfull_not);
	and		and2(w_rclken,ren,w_rempty_not);
	
	FIFO_MEMORY			FIFO_module(wclk,rclk,w_wclken,w_rclken,w_waddr,w_raddr,wdata,rdata);
	
	read_control		read_control_module(ren,rclk,rrst_n,w_wptr_rclk,w_raddr,w_rptr,w_rempty);
	
	write_control		write_control_module(wen,wclk,wrst_n,w_rptr_wclk,w_waddr,w_wptr,w_wfull);
	
	Binary_to_Gray		Binary_to_Gray_module_writeside(w_wptr,w_wptr_Gray);
	
	Binary_to_Gray		Binary_to_Gray_module_readside(w_rptr,w_rptr_Gray);
	
	Gray_to_Binary		Gray_to_Binary_module_writeside(w_rptr_wclk_Gray,w_rptr_wclk);		
	
	Gray_to_Binary		Gray_to_Binary_module_readside(w_wptr_rclk_Gray,w_wptr_rclk);		
	
	synchronizer		write_to_read_synchronizer(rclk,rrst_n,w_wptr_Gray,w_wptr_rclk_Gray);
	
	synchronizer		read_to_write_synchronizer(wclk,wrst_n,w_rptr_Gray,w_rptr_wclk_Gray);	

	assign rempty=w_rempty;
	assign wfull=w_wfull;
	
endmodule
