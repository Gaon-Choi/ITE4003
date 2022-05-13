transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week09_11_FINAL_PROJECT/project_fifo {C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week09_11_FINAL_PROJECT/project_fifo/non_circular_fifo_rev1.v}

vlog -vlog01compat -work work +incdir+C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week09_11_FINAL_PROJECT/project_fifo {C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week09_11_FINAL_PROJECT/project_fifo/tb_non_circular_fifo_rev1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_non_circular_fifo_rev1

add wave *
view structure
view signals
run -all
