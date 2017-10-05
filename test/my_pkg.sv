package my_pkg;
	import uvm_pkg::*;
	`include "uvm_macros.svh"
	
	`include "my_wr_agt_cfg.sv"
	`include "my_rd_agt_cfg.sv"
	`include "my_env_cfg.sv"
	
	`include "write_xtn.sv"
	`include "my_wr_monitor.sv"
	`include "my_wr_driver.sv"
	`include "my_wr_sequencer.sv"
	`include "my_wr_agent.sv"
	`include "my_wr_agent_top.sv"
	
	`include "read_xtn.sv"
	`include "my_rd_monitor.sv"
	`include "my_rd_driver.sv"
	`include "my_rd_sequencer.sv"
	`include "my_rd_agent.sv"
	`include "my_rd_agent_top.sv"
	
	`include "my_scoreboard.sv"
	`include "my_virtual_sequencer.sv"
	`include "my_tb.sv"
	`include "my_test_lib.sv"
endpackage