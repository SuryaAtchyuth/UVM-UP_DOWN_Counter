class count_monitor extends uvm_monitor;
  
  virtual count_interface vif;
  
  count_packet pkt;
  
  int pkts_rcvd=0;
  
  `uvm_component_utils(count_monitor)
  
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
      `uvm_error("Monitor_CLASS", "Failed to get VIF from config db !");
    
  endfunction: connect_phase
  
  //---------------------------------------------------------
  //Run Phase
  //---------------------------------------------------------
  task run_phase(uvm_phase phase);
    
    forever begin
      pkt = count_packet::type_id::create("pkt");
      
      @(posedge vif.clk);
      pkt.rst  = vif.rst;
      pkt.out  = vif.out;
      pkts_rcvd++;
      
      #1;
      
      `uvm_info(get_type_name(),$sformatf(" Packet Recieved:\n %s", pkt.sprint()), UVM_HIGH)
      
    end
    
  endtask: run_phase
  
  //---------------------------------------------------------
  //Report Phase
  //---------------------------------------------------------
  function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf(" Total Packets Recieved: %0d", pkts_rcvd), UVM_HIGH) 
  endfunction: report_phase
  
  
endclass: count_monitor
