transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week05/encoder_4to2 {C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week05/encoder_4to2/encoder_4to2_if_default.v}

vlog -vlog01compat -work work +incdir+C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week05/encoder_4to2 {C:/Users/USER/Documents/SOC-Design_2019009261_GAONCHOI/Week05/encoder_4to2/tb_encoder_4to2.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_encoder_4to2

add wave *
view structure
view signals
run -all
