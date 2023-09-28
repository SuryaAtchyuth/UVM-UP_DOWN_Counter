class count_driver extends uvm_driver#(count_packet);
  
  virtual count_interface vif;
  
  //count_packet pkt;
  
  int pkts_sent=0;
  
  `uvm_component_utils(count_driver)
  
  //---------------------------------------------------------
  //Constructor
  //---------------------------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "Inside start of Constructor !", UVM_HIGH)
  endfunction: new
  
  //---------------------------------------------------------
  //Connect Phase
  //---------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    
    if( !uvm_config_db#(virtual count_interface)::get(this,"","vif",vif) )
      	`uvm_error("DRIVER_CLASS", "Failed to get VIF from config db !");
    
  endfunction: connect_phase
  
  
  //---------------------------------------------------------
  //Run Phase
  //---------------------------------------------------------
  task run_phase(uvm_phase phase);
    
    //pkt = count_packet::type_id::create("pkt");
    
    forever begin
      seq_item_port.get_next_item(req);
      drive(req);
      pkts_sent++;
      seq_item_port.item_done();
    end
  endtask: run_phase
  
  //---------------------------------------------------------
  //Drive Task
  //---------------------------------------------------------
  task drive(count_packet pkt);
    
    @(posedge vif.clk);
    vif.rst <= pkt.rst;
    `uvm_info(get_type_name(),$sformatf(" Packet Sent:\n %s", pkt.sprint()), UVM_HIGH)
    
  endtask: drive
  
  //---------------------------------------------------------
  //Report Phase
  //---------------------------------------------------------
  function void report_phase(uvm_phase phase);
     `uvm_info(get_type_name(), $sformatf(" Total Packets Sent: %0d", pkts_sent), UVM_HIGH) 
  endfunction: report_phase
  
endclass: count_driver
