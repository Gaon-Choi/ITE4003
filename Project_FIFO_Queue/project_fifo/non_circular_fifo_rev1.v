`timescale 1 ns / 1 ps

module non_circular_fifo_rev1
    #(  parameter   DATA_WIDTH  =   8,
        parameter   ADDR_WIDTH  =   2,
        parameter   RAM_DEPTH   =   1<< ADDR_WIDTH ) //double left shifting means RAM_DEPTH = 4
(
    //----------------------------------------------------------------
    // Input Ports
    //----------------------------------------------------------------
    input                               clk,			//  input clock
    input                               reset,		//  active high reset
    input                               wr_cs,		//  write chip select
    input                               rd_cs,		//  read chip select
    input           [DATA_WIDTH-1:0]    data_in,	//  8bit data_in
    input										rd_en,      //  read enable
    input                               wr_en,		//  write enable

    //----------------------------------------------------------------
    // Output Ports
    //----------------------------------------------------------------
    output  reg     [DATA_WIDTH-1:0]    data_out,   //  8bit data out
    output  wire                        full,       //  FIFO full
    output  wire                        empty,       //  FIFO empty
	 
	 //wire-type data declaration to check for reg data
	 output wire [ADDR_WIDTH:0]			 data_counter_out,
	 output wire [ADDR_WIDTH-1:0]   		 wr_pointer_out, 
	 output wire [ADDR_WIDTH-1:0]   		 rd_pointer_out 	
);

//----------------------------------------------------------------
// internal variables declaration
//----------------------------------------------------------------
reg     [ADDR_WIDTH-1:0]    wr_pointer;             // 2bit regs that can represent 4 address
reg     [ADDR_WIDTH-1:0]    rd_pointer;             // 2bit regs
reg     [DATA_WIDTH-1:0]    memory [0:RAM_DEPTH-1]; // 8bit*4addr memory declaration  
reg     [ADDR_WIDTH:0]      data_counter;           // 3bit regs
reg                         wr_full;                // 1bit regs
//----------------------------------------------------------------
// code for operation start
//----------------------------------------------------------------

//  output port
assign  full        =   ( data_counter == ( RAM_DEPTH ) ) ? 1'b1 : 1'b0;  //data_counter 4 means data full
assign  empty       =   ( data_counter == 1'b0 ) ? 1'b1 : 1'b0;           //data_counter 0 means data empty


//wire-type data declaration to check for reg data on simulation
assign data_counter_out = data_counter;
assign wr_pointer_out = wr_pointer;
assign rd_pointer_out = rd_pointer;


//  write pointer move
always @ ( posedge clk or posedge reset )
begin: WRITE_POINTER
    if ( reset )                                   //if reset=1
    begin
        wr_pointer  <=  'd0;                       // wr_pointer=0
        wr_full     <=  1'b0;                      //wr_full=0
    end
    else 
    begin
        // check write chip selct, enable signal and write pointer 
        if ( wr_cs && wr_en && !full && (wr_pointer != RAM_DEPTH-1))
            wr_pointer  <=  wr_pointer + 'd1; // increase the write pointer
        else 
        	wr_pointer 	<=	wr_pointer;

        // if wr_pointer== RAM_DEPTH-1, wr_full=1
        if ( wr_pointer == RAM_DEPTH-1 )
            wr_full     <=  1'b1; //it means data is full
        else
        	wr_full 	<=	wr_full; // if not, keep its value 
    end
end

//  read pointer move
always @ ( posedge clk or posedge reset )
begin: READ_POINTER
    if ( reset )
    begin
        rd_pointer  <=  'd0;   //if reset=1, rd_pointer=0
    end
    else
    begin
        if ( rd_cs && rd_en && !empty && ( rd_pointer!=RAM_DEPTH-1 ) )  //rd_pointer increments by 1 in this condition
            rd_pointer  <=  rd_pointer + 'd1;
        else 
        	rd_pointer 	<=	rd_pointer;     //if not, keep its value
    end
end

//  data write
always @ ( posedge clk )
begin: DATA_WRITE
    if ( wr_cs && wr_en  && ( data_counter != RAM_DEPTH ) && !wr_full )
		// blank
		// --> write data_in into memory location that is pointed by wr_pointer
		memory[wr_pointer] <= data_in;
    else 
    	memory[wr_pointer] <= memory[wr_pointer]; 
end

//  data read
always @ ( posedge clk )
begin: DATA_READ
    if ( rd_cs && rd_en ) 
        // blank
        // --> read data from memory location that is pointed by rd_pointer
        data_out <= memory[rd_pointer];
    else
        data_out <= 'hx; 
end

//  data counter move
always @ ( posedge clk or posedge reset )
begin: DATA_COUNTER
    if ( reset )  //data counter reset
    begin
        data_counter    <=  'd0;
    end
    else
    begin
        if (!( wr_cs && wr_en ) && ( rd_cs && rd_en ) && !empty)          // blank
            // decrement data_counter
            // : due to the read operation of one element
            // : without any writing new element
            data_counter <= data_counter - 1;
        else if ( ( wr_cs && wr_en ) && ! ( rd_cs && rd_en ) && ( data_counter != RAM_DEPTH ) && !wr_full )    //  write and no read
            // increment data_counter
            // : due to the insertion of one element
            data_counter <= data_counter + 1;
        else
            // if not, keep it's original value
            data_counter <= data_counter;
    end
end

endmodule



