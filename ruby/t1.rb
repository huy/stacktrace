puts "test get ruby stacktrace"

def m1
  puts "call m1"
  m2
end

def m2
  puts "call m2"
  m3
end

def m3
  puts "call m3, just wait to have enough time to use gdb to attach to this process"
  sleep (ARGV[0] || 20).to_i
end

m1
