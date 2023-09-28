class count_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(count_monitor)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "Inside start of Constructor !", UVM_HIGH)
  endfunction: new
  
  
  
endclass: count_scoreboard
