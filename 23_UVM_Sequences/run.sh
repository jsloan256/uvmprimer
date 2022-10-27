FILE=xvhdl.log
if [ -f "$FILE" ]; then
    echo "Deleting last sim"
    rm -rf xelab.*
    rm -rf xsim.dir
    rm -rf xvhdl.*
    rm -rf xvlog.*
fi

xvhdl -f dut.f
xvlog -sv -i ./tb_classes -L uvm -f tb.f
xelab top -s mysnap --debug all
xsim mysnap --testplusarg UVM_TESTNAME=full_test -gui

