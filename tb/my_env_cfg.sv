class my_env_cfg extends uvm_object;

	`uvm_object_utils(my_env_cfg)
	
	my_wr_agt_cfg wr_agt_cfg[];
	my_rd_agt_cfg rd_agt_cfg[];
	
	bit has_vseqr=1;
	bit has_wr_agt=1;
	bit has_rd_agt=1;
	bit has_sb=1;
	int no_of_wr_agt=1;
	int no_of_rd_agt=1;
	int no_of_dut=1;
	
	function new(string name="my_env_cfg");
		super.new(name);
	endfunction
	
endclass:my_env_cfg