class my_rd_monitor extends uvm_monitor;
	
	`uvm_component_utils(my_rd_monitor)
	
	virtual my_interface vif;                         ////////////////////////////modport remaining
	
	my_rd_agt_cfg rd_agt_cfg;
	
	uvm_analysis_port #(read_xtn) rd_mon_ap;
	
	extern function new(string name="my_rd_monitor",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	
endclass:my_rd_monitor

function my_rd_monitor::new(string name="my_rd_monitor",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_rd_monitor::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_rd_agt_cfg)::get(this,"","my_rd_agt_cfg",rd_agt_cfg))
		`uvm_fatal("RD_MON","Getting my_rd_agt_config to rd_agt_cfg failed")
	super.build_phase(phase);
	rd_mon_ap=new("rd_mon_ap",this);
endfunction

function void my_rd_monitor::connect_phase(uvm_phase phase);
	vif=rd_agt_cfg.vif;
endfunction