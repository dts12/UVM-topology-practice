class my_wr_agent extends uvm_agent;
	
	`uvm_component_utils(my_wr_agent)
	
	my_wr_driver wr_drv;
	my_wr_monitor wr_mon;
	my_wr_sequencer wr_seqr;
	
	my_wr_agt_cfg wr_agt_cfg;
	
	extern function new(string name="my_wr_agent",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass:my_wr_agent

function my_wr_agent::new(string name="my_wr_agent",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_wr_agent::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_wr_agt_cfg)::get(this,"","my_wr_agt_cfg",wr_agt_cfg))
		`uvm_fatal("WR_AGENT","Getting my_wr_agt_config to wr_agt_cfg failed")
	super.build_phase(phase);
	
	wr_mon=my_wr_monitor::type_id::create("wr_mon",this);
	
	if(wr_agt_cfg.is_active == UVM_ACTIVE)
		begin
			wr_drv=my_wr_driver::type_id::create("wr_drv",this);
			wr_seqr=my_wr_sequencer::type_id::create("wr_seqr",this);
		end

endfunction