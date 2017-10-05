class my_wr_sequencer extends uvm_sequencer #(uvm_sequence_item);

	`uvm_component_utils(my_wr_sequencer)
	
	extern function new(string name="my_wr_sequencer",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass:my_wr_sequencer

function my_wr_sequencer::new(string name="my_wr_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction

function void my_wr_sequencer::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction
