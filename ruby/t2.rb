require 'thread'
require './ruby_backtrace'

def foo
   bar
end

def bar
   sleep 100
end

thread1 = Thread.new do
   foo
end

thread2 = Thread.new do
   sleep 100
end

# Give other threads some chance to run.
thread1.join
thread2.join
