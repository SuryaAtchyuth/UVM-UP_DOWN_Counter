class base_sequence extends uvm_sequence#(count_packet);
  
  `uvm_object_utils(base_sequence)
  
  count_packet pkt;
  
  //---------------------------------------------------------
  //Constructor
  //---------------------------------------------------------
  function new (string name = "base_sequence");
    super.new(name);
  endfunction: new
  
  //---------------------------------------------------------
  //Pre Body
  //---------------------------------------------------------
  task pre_body();
    
    uvm_phase phase;
    
    phase = get_starting_phase();
    
    if(phase != null)
      phase.raise_objection(this, get_type_name());
    
  endtask: pre_body
  
  //---------------------------------------------------------
  //Post Body
  //---------------------------------------------------------
  task post_body();
    
    uvm_phase phase;
    phase = get_starting_phase();
    
    if(phase != null)
      phase.drop_objection(this, get_type_name());
    
  endtask: post_body
  
  
//   //---------------------------------------------------------
//   //Body
//   //---------------------------------------------------------
//   virtual task body();
    
//     pkt = count_packet::type_id::create("pkt");
    
//     start_item(pkt);
//     pkt.randomize() with {rst==1;};
//     finish_item(pkt);
    
//   endtask: body
  
  
endclass:base_sequence



class count_sequence extends base_sequence;
  
  `uvm_object_utils(count_sequence)
  
  //---------------------------------------------------------
  //Constructor
  //---------------------------------------------------------
  function new (string name = "count_sequence");
    super.new(name);
  endfunction: new
  
  //---------------------------------------------------------
  //Body
  //---------------------------------------------------------
  virtual task body();
    
    `uvm_do_with(req, {req.rst == 1;})
    repeat(5)
      `uvm_do(req)
      
    
  endtask: body
  
  
endclass:count_sequence
