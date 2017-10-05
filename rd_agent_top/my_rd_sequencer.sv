class my_rd_sequencer extends uvm_sequencer #(uvm_sequence_item);
	
	`uvm_component_utils(my_rd_sequencer)
	
	extern function new(string name="my_rd_sequencer",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass:my_rd_sequencer

function my_rd_sequencer::new(string name="my_rd_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_rd_sequencer::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction
