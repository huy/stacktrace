ruby t1.rb 1>t1.log &
echo "attach to ruby process $! and call rb_backtrace to print current stack to stdout" 
gdb -x ./t1.gdb -p $!
