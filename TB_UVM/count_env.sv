class count_env extends uvm_env;
  
  count_agent agent;
  
  `uvm_component_utils(count_env)
  
  //---------------------------------------------------------
  //Constructor
  //---------------------------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "Inside start of Constructor !", UVM_HIGH)
  endfunction: new
  
  
  //---------------------------------------------------------
  //Build Phase
  //---------------------------------------------------------
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    agent = count_agent::type_id::create("agent", this);
    
  endfunction: build_phase
  


endclass: count_env
