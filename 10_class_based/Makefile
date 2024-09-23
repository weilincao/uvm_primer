SV_SOURCE := $(wildcard verif/*.sv)


analysis: $(SV_SOURCE)
	vlogan -sverilog +incdir+src/+verif/ verif/top.sv

all: analysis
	vcs -debug_access+all top  && ./simv

clean:
	rm -rf AN.DB csrc simv simv.daidir *.fsdb  ucli.key verdiLog verdi_config_file novas.rc novas_dump.log novas.conf
