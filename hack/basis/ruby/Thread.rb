threads = []
10.times d
    thread = Thread.new do
        10.times { |i| print i; $stdout.flush; sleep rand(2)}
    end
    threads<< thread
end

threads.each {|thread| thread.join}