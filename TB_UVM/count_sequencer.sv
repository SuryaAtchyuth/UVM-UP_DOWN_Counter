class count_sequencer extends uvm_sequencer#(count_packet);
  
  `uvm_component_utils(count_sequencer)
  
  //---------------------------------------------------------
  //Constructor
  //---------------------------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "Inside start of Constructor !", UVM_HIGH)
  endfunction: new
  
  
  
endclass: count_sequencer
