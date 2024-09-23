SV_SOURCE := $(wildcard *.sv)

all: $(SV_SOURCE)
	vcs -kdb -debug_access+all -sverilog $(SV_SOURCE) && ./simv

compile: $(SV_SOURCE)
	vcs -kdb -debug_access+all -sverilog $(SV_SOURCE)

clean:
	rm -rf csrc simv simv.daidir *.fsdb  ucli.key verdiLog verdi_config_file novas.rc novas_dump.log novas.conf
