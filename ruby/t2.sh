ruby t1.rb &
echo "attach to ruby process $! and call rb_eval_string('puts caller') to print current stack to stdout"
gdb -x ./t2.gdb -p $!
