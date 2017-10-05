class my_base_test extends uvm_test;
	
	`uvm_component_utils(my_base_test)
	
	my_tb my_env;
	//my_virtual_seqs my_vseqs;
	
	bit has_vseqr=1;
	bit has_wr_agt=1;
	bit has_rd_agt=1;
	bit has_sb=1;
	
	int no_of_wr_agt=2;
	int no_of_rd_agt=3;
	int no_of_dut=2;
	
	my_env_cfg env_cfg;
	my_wr_agt_cfg wr_agt_cfg[];
	my_rd_agt_cfg rd_agt_cfg[];
	
	extern function new(string name="my_base_test",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void end_of_elaboration_phase(uvm_phase phase);
	
endclass:my_base_test

function my_base_test::new(string name="my_base_test",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_base_test::build_phase(uvm_phase phase);
	
	env_cfg=my_env_cfg::type_id::create("env_cfg");
	
	if(has_wr_agt)
		begin
			wr_agt_cfg=new[no_of_wr_agt];
			env_cfg.wr_agt_cfg=new[no_of_wr_agt];
			foreach(wr_agt_cfg[i])
				begin
					wr_agt_cfg[i]=my_wr_agt_cfg::type_id::create($sformatf("wr_agt_cfg[%0d]",i));
					if(!uvm_config_db #(virtual my_interface)::get(this,"",$sformatf("vif_wr%0d",i),wr_agt_cfg[i].vif))
						`uvm_fatal("TEST","Getting vif to wr_agt_cfg.vif failed")
					wr_agt_cfg[i].is_active=UVM_ACTIVE;
					env_cfg.wr_agt_cfg[i]=wr_agt_cfg[i];
				end
		end
		
	if(has_rd_agt)
		begin
			rd_agt_cfg=new[no_of_rd_agt];
			env_cfg.rd_agt_cfg=new[no_of_rd_agt];
			foreach(rd_agt_cfg[i])
				begin
					rd_agt_cfg[i]=my_rd_agt_cfg::type_id::create($sformatf("rd_agt_cfg[%0d]",i));
					if(!uvm_config_db #(virtual my_interface)::get(this,"",$sformatf("vif_rd%0d",i),rd_agt_cfg[i].vif))
						`uvm_fatal("TEST","Getting vif to rd_agt_cfg.vif failed")
					rd_agt_cfg[i].is_active=UVM_ACTIVE;
					env_cfg.rd_agt_cfg[i]=rd_agt_cfg[i];
				end
			
		end
	
	env_cfg.has_vseqr=has_vseqr;
	env_cfg.has_wr_agt=has_wr_agt;
	env_cfg.has_rd_agt=has_rd_agt;
	env_cfg.has_sb=has_sb;
	
	env_cfg.no_of_wr_agt=no_of_wr_agt;
	env_cfg.no_of_rd_agt=no_of_rd_agt;
	env_cfg.no_of_dut=no_of_dut;
	
	uvm_config_db #(my_env_cfg)::set(this,"*","my_env_cfg",env_cfg);
	
	super.build_phase(phase);
	
	my_env=my_tb::type_id::create("my_env",this);
	
endfunction

function void my_base_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction