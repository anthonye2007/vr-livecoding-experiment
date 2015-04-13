require "date"

folderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-2\\"
ext = '.log'
filename = 'live'
filePath = folderPath + filename + ext

puts filePath
done = ''

File.readlines(filePath).each do |line|
  done = line if line.include?('Done')
end

puts done
timestamp = done.split(']')[0] # Returns timestamp but with a leading square bracket
timestamp.slice!(0) # Remove leading bracket, now have date, then time

timezoneOffset = '-05' # Eastern Time Zone is UTC-5
parsed = DateTime.parse(timestamp + timezoneOffset)
puts parsed
puts parsed.to_time.to_i #seconds since epoch

doneTime = parsed.to_time.to_i

####

start = ''
File.readlines(filePath).each do |line|
  start = line if line.include?('Start')
end

puts start