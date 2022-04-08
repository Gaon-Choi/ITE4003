transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week06/blk {C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week06/blk/blk1.v}

