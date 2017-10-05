class my_wr_monitor extends uvm_monitor;
	
	`uvm_component_utils(my_wr_monitor)
	
	virtual my_interface vif;                         ////////////////////////////modport remaining
	
	my_wr_agt_cfg wr_agt_cfg;
	
	uvm_analysis_port #(write_xtn) wr_mon_ap;
	
	extern function new(string name="my_wr_monitor",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	
endclass:my_wr_monitor

function my_wr_monitor::new(string name="my_wr_monitor",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_wr_monitor::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_wr_agt_cfg)::get(this,"","my_wr_agt_cfg",wr_agt_cfg))
		`uvm_fatal("WR_MON","Getting my_wr_agt_config to wr_agt_cfg failed")
	super.build_phase(phase);
	
	wr_mon_ap=new("wr_mon_ap",this);
endfunction

function void my_wr_monitor::connect_phase(uvm_phase phase);
	vif=wr_agt_cfg.vif;
endfunction
