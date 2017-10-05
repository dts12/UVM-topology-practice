class write_xtn extends uvm_sequence_item;
	
	`uvm_object_utils(write_xtn)
	
	extern function new(string name="write_xtn");
	
endclass:write_xtn

function write_xtn::new(string name="write_xtn");
	super.new(name);
endfunction
