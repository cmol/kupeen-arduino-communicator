#!/usr/bin/env ruby

require 'serialport' # use Kernel::require on windows, works better 

#params for serial port
port_str = "/dev/ttyACM4"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
puts "Sleeping for borad to become active"
sleep(1)

loop do
  puts "Input mode (0-15)"
  cols = $stdin.gets.chomp
  exit(0) if (cols == "q")
  data = [0x00, cols.to_i]
  sp.write(data.pack("CC"))
end
