ruby t1.rb 1>t1.log &
echo "atatch to ruby process $!" 
gdb -x ./t1.gdb -p $!
