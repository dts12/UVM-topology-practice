class my_rd_agent_top extends uvm_env;
	
	`uvm_component_utils(my_rd_agent_top)
	
	my_env_cfg env_cfg;
	
	my_rd_agent rd_agt[];

	extern function new(string name="my_rd_agent_top",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass:my_rd_agent_top

function my_rd_agent_top::new(string name="my_rd_agent_top",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_rd_agent_top::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_env_cfg)::get(this,"","my_env_cfg",env_cfg))
		`uvm_fatal("ENV","Getting my_env_config to env_cfg failed")
		
	super.build_phase(phase);
	
	rd_agt=new[env_cfg.no_of_rd_agt];
	foreach(rd_agt[i])
		rd_agt[i]=my_rd_agent::type_id::create($sformatf("rd_agt[%0d]",i),this);
endfunction
