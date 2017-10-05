class my_virtual_sequencer extends uvm_sequencer #(uvm_sequence_item);
	
	`uvm_component_utils(my_virtual_sequencer)
	
	my_wr_sequencer wr_seqr[];
	my_rd_sequencer rd_seqr[];
	
	my_env_cfg env_cfg;
	
	extern function new(string name="my_virtual_sequencer",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass:my_virtual_sequencer

function my_virtual_sequencer::new(string name="my_virtual_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_virtual_sequencer::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_env_cfg)::get(this,"","my_env_cfg",env_cfg))
		`uvm_fatal("ENV","Getting my_env_cfg to env_cfg failed")
	super.build_phase(phase);
	//wr_seqr=new[env_cfg.no_of_wr_agt];
	//rd_seqr=new[env_cfg.no_of_rd_agt];
	//wr_seqr=new[env_cfg.no_of_dut];
	wr_seqr=new[env_cfg.no_of_wr_agt];
	//rd_seqr=new[env_cfg.no_of_dut];
	rd_seqr=new[env_cfg.no_of_rd_agt];
endfunction
