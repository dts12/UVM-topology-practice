class my_wr_agent_top extends uvm_env;
	
	`uvm_component_utils(my_wr_agent_top)
	
	my_env_cfg env_cfg;
	
	my_wr_agent wr_agt[];
	
	extern function new(string name="my_wr_agent_top",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass:my_wr_agent_top

function my_wr_agent_top::new(string name="my_wr_agent_top",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_wr_agent_top::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_env_cfg)::get(this,"","my_env_cfg",env_cfg))
		`uvm_fatal("ENV","Getting my_env_config to env_cfg failed")
		
	super.build_phase(phase);
	
	wr_agt=new[env_cfg.no_of_wr_agt];
	foreach(wr_agt[i])
		wr_agt[i]=my_wr_agent::type_id::create($sformatf("wr_agt[%0d]",i),this);
endfunction
