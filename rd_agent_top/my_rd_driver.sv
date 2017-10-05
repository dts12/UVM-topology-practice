class my_rd_driver extends uvm_driver #(read_xtn);
	
	`uvm_component_utils(my_rd_driver)
	
	virtual my_interface vif;                         ////////////////////////////modport remaining
	
	my_rd_agt_cfg rd_agt_cfg;
	
	extern function new(string name="my_rd_driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	
endclass:my_rd_driver

function my_rd_driver::new(string name="my_rd_driver",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_rd_driver::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_rd_agt_cfg)::get(this,"","my_rd_agt_cfg",rd_agt_cfg))
		`uvm_fatal("RD_DRV","Getting my_rd_agt_config to rd_agt_cfg failed")
	super.build_phase(phase);
endfunction

function void my_rd_driver::connect_phase(uvm_phase phase);
	vif=rd_agt_cfg.vif;
endfunction