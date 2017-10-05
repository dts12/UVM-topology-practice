module my_top();

import my_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

bit clock;

//always 
	//#10 clock=!clock;

/*initial
	begin
		clock=0;
		forever
			#5 clock=~clock;
	end
*/

my_interface if_wr0(clock);
my_interface if_wr1(clock);
//my_interface if_wr2(clock);
//my_interface if_wr3(clock);

my_interface if_rd0(clock);
my_interface if_rd1(clock);
my_interface if_rd2(clock);
//my_interface if_rd3(clock);

//instantiate DUV here//


initial
	begin
		uvm_config_db #(virtual my_interface)::set(null,"*","vif_wr0",if_wr0);
		uvm_config_db #(virtual my_interface)::set(null,"*","vif_wr1",if_wr1);
		//uvm_config_db #(virtual my_interface)::set(null,"*","vif_wr2",if_wr2);
		//uvm_config_db #(virtual my_interface)::set(null,"*","vif_wr3",if_wr3);
		
		uvm_config_db #(virtual my_interface)::set(null,"*","vif_rd0",if_rd0);
		uvm_config_db #(virtual my_interface)::set(null,"*","vif_rd1",if_rd1);
		uvm_config_db #(virtual my_interface)::set(null,"*","vif_rd2",if_rd2);
		//uvm_config_db #(virtual my_interface)::set(null,"*","vif_rd3",if_wr3);
		
		run_test();
	end

endmodule:my_top