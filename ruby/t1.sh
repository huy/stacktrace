ruby t1.rb &
echo "attach to ruby process $! and call rb_backtrace to print current stack to stdout" 
gdb -x ./t1.gdb -p $!
