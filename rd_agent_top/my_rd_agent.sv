class my_rd_agent extends uvm_agent;
	
	`uvm_component_utils(my_rd_agent)
	
	my_rd_driver rd_drv;
	my_rd_monitor rd_mon;
	my_rd_sequencer rd_seqr;
	
	my_rd_agt_cfg rd_agt_cfg;
	
	extern function new(string name="my_rd_agent",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass:my_rd_agent

function my_rd_agent::new(string name="my_rd_agent",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_rd_agent::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_rd_agt_cfg)::get(this,"","my_rd_agt_cfg",rd_agt_cfg))
		`uvm_fatal("RD_AGENT","Getting my_rd_agt_config to rd_agt_cfg failed")
	super.build_phase(phase);
	
	rd_mon=my_rd_monitor::type_id::create("rd_mon",this);
	if(rd_agt_cfg.is_active == UVM_ACTIVE)
		begin
			rd_drv=my_rd_driver::type_id::create("rd_drv",this);
			rd_seqr=my_rd_sequencer::type_id::create("rd_seqr",this);
		end
endfunction