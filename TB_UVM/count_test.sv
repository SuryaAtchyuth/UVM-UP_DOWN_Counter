
class base_test extends uvm_test;
  
  count_env env;
  base_sequence  base_item;
  count_sequence count_item;
  
  `uvm_component_utils(base_test)
  
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
    uvm_config_int::set(this,"*", "recording_detail", 1);
    super.build_phase(phase);
    env = count_env::type_id::create("env", this);
    
  endfunction: build_phase
  
  //---------------------------------------------------------
  //End of Elaboration Phase
  //---------------------------------------------------------
  function void end_of_elaboration_phase(uvm_phase phase);
  	uvm_top.print_topology();
    
  endfunction: end_of_elaboration_phase
  
  
  //---------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------- 
  task run_phase(uvm_phase phase);
    
    uvm_objection obj = phase.get_objection();
    obj.set_drain_time(this, 5ns);
    
  endtask: run_phase
  
endclass: base_test



class count_test extends base_test;
  
  `uvm_component_utils(count_test)
  
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
    uvm_config_wrapper::set(this, "env.agent.sequencer.run_phase", "default_sequence", count_sequence::get_type());
    super.build_phase(phase);
  endfunction: build_phase
  
  
endclass: count_test
