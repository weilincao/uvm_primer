SV_SOURCE := $(wildcard verif/*.sv)


analysis: $(SV_SOURCE)
	vlogan -ntb_opts uvm && vlogan -ntb_opts uvm -sverilog +incdir+src/+verif/  verif/tinyalu_verif_pkg.sv  verif/top.sv

all: analysis
	vcs -ntb_opts uvm -debug_access+all top

clean:
	rm -rf simv.vdb vc_hdrs.h AN.DB csrc simv simv.daidir *.fsdb  ucli.key verdiLog verdi_config_file novas.rc novas_dump.log novas.conf
