`timescale 1 ns / 1 ps

module tb_non_circular_fifo_rev1;

//----------------------------------------------------------------
// default parameter value setting
//----------------------------------------------------------------
parameter   delay           =   0.1;            //  simulation delay
parameter   one_clk         =   2.0;            //  clock period

parameter   TB_DATA_WIDTH   =   8;
parameter   TB_ADDR_WIDTH   =   2;
parameter   TB_RAM_DEPTH    =   1 << TB_ADDR_WIDTH;

//----------------------------------------------------------------
// variable declaration
//----------------------------------------------------------------
reg                         tb_clk;        //  input clock
reg                         tb_reset;      //  active high reset
reg                         tb_wr_cs;      //  write chip select
reg                         tb_wr_en;      //  write enable

reg                         tb_rd_cs;      //  read chip select

reg                         tb_rd_en;      //  read enable

reg     [TB_DATA_WIDTH-1:0] tb_data_in;    //  data_in

wire    [TB_DATA_WIDTH-1:0] tb_data_out;   //  data out
wire                        tb_full;       //  FIFO full
wire                        tb_empty;      //  FIFO empty

wire	  [TB_ADDR_WIDTH:0]      tb_data_counter;
wire 	  [TB_ADDR_WIDTH-1:0]	 tb_wr_pointer;
wire 	  [TB_ADDR_WIDTH-1:0] 	 tb_rd_pointer;	

//----------------------------------------------------------------
// Test module instantiation
//----------------------------------------------------------------
non_circular_fifo_rev1 #(
    .DATA_WIDTH     ( TB_DATA_WIDTH ),
    .ADDR_WIDTH     ( TB_ADDR_WIDTH ),
    .RAM_DEPTH      ( TB_RAM_DEPTH )
)
U0_RAM_SP_SR_SW
(
    .clk            ( tb_clk ),
    .reset          ( tb_reset ),
    .wr_cs          ( tb_wr_cs ),
    .rd_cs          ( tb_rd_cs ),
    .data_in        ( tb_data_in ),
    .rd_en          ( tb_rd_en ),
    .wr_en          ( tb_wr_en ),

    .data_out       ( tb_data_out ),
    .full           ( tb_full ),
    .empty          ( tb_empty ),
	 .data_counter_out(tb_data_counter),
	 .wr_pointer_out(tb_wr_pointer),
	 .rd_pointer_out(tb_rd_pointer)
);


//----------------------------------------------------------------
// code for simulation start
//----------------------------------------------------------------

//  test clock generation
always 
begin
    # ( one_clk / 2)    tb_clk  =   ~tb_clk;
end


//  test input control
initial 
begin
    
    //  initial value setting
    tb_clk      =   1'b1;
    tb_reset    =   1'b1;
    tb_wr_cs    =   1'b0;
    tb_rd_cs    =   1'b0;
    tb_data_in  =   'h0;
    tb_rd_en    =   1'b0;
    tb_wr_en    =   1'b0;
    

    # ( 1 * one_clk );
    tb_reset    =   1'b0;

    # ( 16 * delay );

    tb_wr_cs    =   1'b1;
    tb_wr_en    =   1'b1;
    tb_data_in  =   'hAA;

    # ( 1 * one_clk );
    tb_data_in  =   'hBB;

    # ( 1 * one_clk );
    tb_data_in  =   'hCC;

    # ( 1 * one_clk );
    tb_data_in  =   'hDD;

    # ( 1 * one_clk );
    tb_data_in  =   'hEE;
	 
	 
	 
    # ( 1 * one_clk );
    tb_wr_cs    =   1'b0;
    tb_wr_en    =   1'b0;

    # ( 2 * one_clk );
    tb_rd_cs    =   1'b1;
    tb_rd_en    =   1'b1;

    # ( 1 * one_clk );
    tb_rd_cs    =   1'b0;
    tb_rd_en    =   1'b0;    

    # ( 1 * one_clk );
    tb_rd_cs    =   1'b1;
    tb_rd_en    =   1'b1;

    # ( 1 * one_clk );
    tb_rd_cs    =   1'b0;
    tb_rd_en    =   1'b0;

    # ( 1 * one_clk );
    tb_rd_cs    =   1'b1;
    tb_rd_en    =   1'b1;

    # ( 1 * one_clk );
    tb_rd_cs    =   1'b0;
    tb_rd_en    =   1'b0; 

    # ( 1 * one_clk );
    tb_wr_cs    =   1'b1;
    tb_wr_en    =   1'b1;
    tb_data_in  =   'h77;


    # ( 1 * one_clk );

    tb_data_in  =   'h66;



    # ( 1 * one_clk );

    tb_data_in  =   'h55;



    # ( 2 * one_clk );
    tb_wr_cs    =   1'b0;
    tb_wr_en    =   1'b0;	 
	 
	 
    # ( 1 * one_clk );
    tb_rd_cs    =   1'b1;
    tb_rd_en    =   1'b1;
	 
	 # ( 1 * one_clk );
    tb_rd_cs    =   1'b0;
    tb_rd_en    =   1'b0; 

    # ( 1 * one_clk );
    tb_rd_cs    =   1'b1;
    tb_rd_en    =   1'b1;
	 
	 # ( 1 * one_clk );
    tb_rd_cs    =   1'b0;
    tb_rd_en    =   1'b0; 
	
    # ( 1 * one_clk );
    tb_rd_cs    =   1'b1;
    tb_rd_en    =   1'b1;
	 
	 # ( 1 * one_clk );
    tb_rd_cs    =   1'b0;
    tb_rd_en    =   1'b0; 

    # ( 1 * one_clk );
    tb_rd_cs    =   1'b1;
    tb_rd_en    =   1'b1;
	 
	 # ( 1 * one_clk );
    tb_rd_cs    =   1'b0;
    tb_rd_en    =   1'b0;
	  	 

	 
	 	 	 
    # ( 3 * one_clk )
    $display ( "Simulation end");
    $stop();
end
endmodule