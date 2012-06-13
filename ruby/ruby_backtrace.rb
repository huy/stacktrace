require 'pp'

def backtrace_for_all_threads(signame)
    File.open("/tmp/ruby_backtrace_#{Process.pid}.txt","a") do |f|
      f.puts "--- got signal #{signame}, dump backtrace for all threads at #{Time.now}"
      if Thread.current.respond_to?(:bactrace)
        Thread.list.each do |t|
          f.puts t.inspect
          PP.pp(t.backtrace.delete_if {|frame| frame =~ /^#{File.expand_path(__FILE__)}/},
               f) # remove frames resulting from calling this method
        end
      else
        f.puts Thread.current.inspect
        PP.pp(caller)
      end
  end
end

Signal.trap("INFO") do
  backtrace_for_all_threads("INFO")
end
