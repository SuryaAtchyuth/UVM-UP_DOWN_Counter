class count_agent extends uvm_agent;
  
  count_sequencer sequencer;
  count_driver    driver;
  count_monitor   monitor;
  
  `uvm_component_utils(count_agent)
  
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
    sequencer = count_sequencer::type_id::create("sequencer", this);
    driver    = count_driver::type_id::create("driver", this);
    monitor   = count_monitor::type_id::create("monitor", this);
    
  endfunction: build_phase
  
  //---------------------------------------------------------
  //Build Phase
  //---------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    
    driver.seq_item_port.connect(sequencer.seq_item_export);
    
  endfunction: connect_phase 
  
  
endclass: count_agent
