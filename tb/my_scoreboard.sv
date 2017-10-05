class my_scoreboard extends uvm_scoreboard;
	
	`uvm_component_utils(my_scoreboard)
	
	uvm_tlm_analysis_fifo #(write_xtn) fifo_wr[];
	uvm_tlm_analysis_fifo #(read_xtn) fifo_rd[];
	
	my_env_cfg env_cfg;
	
	extern function new(string name="my_scoreboard",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass:my_scoreboard

function my_scoreboard::new(string name="my_scoreboard",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_scoreboard::build_phase(uvm_phase phase);
	if(!uvm_config_db #(my_env_cfg)::get(this,"","my_env_cfg",env_cfg))
		`uvm_fatal("ENV","Getting my_env_config to env_cfg failed")
	
	if(env_cfg.has_wr_agt)
		begin
			fifo_wr=new[env_cfg.no_of_wr_agt];
			foreach(fifo_wr[i])
				fifo_wr[i]=new($sformatf("fifo_wr[%0d]",i),this);
		end
	
	if(env_cfg.has_rd_agt)
		begin	
			fifo_rd=new[env_cfg.no_of_rd_agt];
			foreach(fifo_rd[i])
				fifo_rd[i]=new($sformatf("fifo_rd[%0d]",i),this);
		end
	
	super.build_phase(phase);
endfunction
