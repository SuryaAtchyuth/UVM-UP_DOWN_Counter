class count_packet extends uvm_sequence_item;
  
    rand logic rst;
    logic[3:0] out;
  
  `uvm_object_utils_begin(count_packet)
  `uvm_field_int(rst, UVM_ALL_ON + UVM_BIN)
  `uvm_field_int(out, UVM_ALL_ON + UVM_BIN)
  `uvm_object_utils_end
 
  constraint rst_c { rst dist {1:=1, 0:=5}; }
  
  //---------------------------------------------------------
  //Constructor
  //---------------------------------------------------------  
  function new (string name = "count_packet");
    super.new(name);
  endfunction: new
  
  
 
endclass: count_packet
