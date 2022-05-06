transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week08/FIR_filter_pipeline {C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week08/FIR_filter_pipeline/FIR_Filter_pipe.v}

vlog -vlog01compat -work work +incdir+C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week08/FIR_filter_pipeline {C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week08/FIR_filter_pipeline/tb_FIR_Filter.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_FIR_Filter

add wave *
view structure
view signals
run -all
