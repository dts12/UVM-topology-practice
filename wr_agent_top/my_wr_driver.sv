class my_wr_driver extends uvm_driver #(write_xtn);
	
	`uvm_component_utils(my_wr_driver)
	
	virtual my_interface vif;                         ////////////////////////////modport remaining
	
	my_wr_agt_cfg wr_agt_cfg;
	
	extern function new(string name="my_wr_driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	
endclass:my_wr_driver

function my_wr_driver::new(string name="my_wr_driver",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_wr_driver::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_wr_agt_cfg)::get(this,"","my_wr_agt_cfg",wr_agt_cfg))
		`uvm_fatal("WR_DRV","Getting my_wr_agt_config to wr_agt_cfg failed")
	
	super.build_phase(phase);
	
endfunction

function void my_wr_driver::connect_phase(uvm_phase phase);
	vif=wr_agt_cfg.vif;
endfunction
