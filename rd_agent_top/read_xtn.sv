class read_xtn extends uvm_sequence_item;
	
	`uvm_object_utils(read_xtn)
	
	extern function new(string name="read_xtn");
	
endclass:read_xtn

function read_xtn::new(string name="read_xtn");
	super.new(name);
endfunction
