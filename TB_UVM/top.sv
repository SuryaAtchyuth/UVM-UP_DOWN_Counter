
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "count_packet.sv"
`include "count_sequence.sv"
`include "count_interface.sv"
`include "count_sequencer.sv"
`include "count_driver.sv"
`include "count_monitor.sv"
`include "count_scoreboard.sv"
`include "count_agent.sv"
`include "count_env.sv"
`include "count_test.sv"


module top;
  
  bit clk;
  
  count_interface intf(clk);
  
  counter DUT(.clk(clk), .rst(intf.rst), .out(intf.out));
  
  always #5 clk = ~clk;
  
  initial begin
    run_test("count_test");
  end
  
  initial begin
    uvm_config_db#(virtual count_interface)::set(null,"uvm_test_top.env.agent.*","vif",intf);  
  end
  
 initial begin
   $dumpfile("top.vcd"); $dumpvars(0, top.DUT);
 end 
endmodule: top
