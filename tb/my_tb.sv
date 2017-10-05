class my_tb extends uvm_env;
	
	`uvm_component_utils(my_tb)
	
	my_env_cfg env_cfg;
	
	my_virtual_sequencer vseqr;
	my_scoreboard sb[];
	my_wr_agent_top wr_agt_top[];
	my_rd_agent_top rd_agt_top[];
	
	extern function new(string name="my_tb",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	
endclass:my_tb

function my_tb::new(string name="my_tb",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_tb::build_phase(uvm_phase phase);
	
	
	if(!uvm_config_db #(my_env_cfg)::get(this,"","my_env_cfg",env_cfg))
		`uvm_fatal("ENV","Getting my_env_config to env_cfg failed")
		
	super.build_phase(phase);
	
	if(env_cfg.has_wr_agt)
		begin
			wr_agt_top=new[env_cfg.no_of_dut];
			foreach(wr_agt_top[i])
				begin
					wr_agt_top[i]=my_wr_agent_top::type_id::create($sformatf("wr_agt_top[%0d]",i),this);
					foreach(env_cfg.wr_agt_cfg[j])
						uvm_config_db #(my_wr_agt_cfg)::set(this,$sformatf("wr_agt_top[%0d].wr_agt[%0d]*",i,j),"my_wr_agt_cfg",env_cfg.wr_agt_cfg[j]);
				end
		end
		
	if(env_cfg.has_rd_agt)
		begin
			rd_agt_top=new[env_cfg.no_of_dut];
			foreach(rd_agt_top[i])
				begin
					rd_agt_top[i]=my_rd_agent_top::type_id::create($sformatf("rd_agt_top[%0d]",i),this);
					foreach(env_cfg.rd_agt_cfg[j])
						uvm_config_db #(my_rd_agt_cfg)::set(this,$sformatf("rd_agt_top[%0d].rd_agt[%0d]*",i,j),"my_rd_agt_cfg",env_cfg.rd_agt_cfg[j]);
				end
		end
	
	if(env_cfg.has_vseqr)
		vseqr=my_virtual_sequencer::type_id::create("vseqr",this);
	
	if(env_cfg.has_sb)
		begin
			sb=new[env_cfg.no_of_dut];
			foreach(sb[i])	
				sb[i]=my_scoreboard::type_id::create($sformatf("sb[%0d]",i),this);
		end
		
endfunction

function void my_tb::connect_phase(uvm_phase phase);
	///*
	if(env_cfg.has_vseqr)
		begin
			if(env_cfg.has_wr_agt)
				foreach(wr_agt_top[i])
					foreach(wr_agt_top[i].wr_agt[j])
						vseqr.wr_seqr[j]=wr_agt_top[i].wr_agt[j].wr_seqr;     /////////////////////////
			if(env_cfg.has_rd_agt)
				foreach(rd_agt_top[i])
					foreach(rd_agt_top[i].rd_agt[j])
						vseqr.rd_seqr[j]=rd_agt_top[i].rd_agt[j].rd_seqr;     /////////////////////////
		end
	//*/
	
	if(env_cfg.has_sb)
		begin
			if(env_cfg.has_wr_agt)
				foreach(wr_agt_top[i])
					foreach(wr_agt_top[i].wr_agt[j])
						wr_agt_top[i].wr_agt[j].wr_mon.wr_mon_ap.connect(sb[i].fifo_wr[j].analysis_export);
						
			if(env_cfg.has_rd_agt)
				foreach(rd_agt_top[i])
					foreach(rd_agt_top[i].rd_agt[j])
						rd_agt_top[i].rd_agt[j].rd_mon.rd_mon_ap.connect(sb[i].fifo_rd[j].analysis_export);
		end
endfunction