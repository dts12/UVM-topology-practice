class my_rd_agt_cfg extends uvm_object;

	`uvm_object_utils(my_rd_agt_cfg)
	
	virtual my_interface vif;
	
	uvm_active_passive_enum is_active = UVM_ACTIVE;
	
	function new(string name="my_rd_agt_cfg");
		super.new(name);
	endfunction
	
endclass:my_rd_agt_cfg