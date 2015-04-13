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

def parseTime(str)
  timestamp = str.split(']')[0] # Returns timestamp but with a leading square bracket
  timestamp.slice!(0) # Remove leading bracket, now have date, then time

  timezoneOffset = '-05' # Eastern Time Zone is UTC-5
  parsed = DateTime.parse(timestamp + timezoneOffset)
  return parsed.to_time.to_i
end

puts done

doneTime = parseTime(done)
puts "Finished at: " + doneTime.to_s

####

start = ''
File.readlines(filePath).each do |line|
  line.strip!
  start = line if line.end_with?(':')
end

puts start
startTime = parseTime(start)
puts "Started at: " + startTime.to_s

duration = doneTime - start
puts "Duration (in seconds): " + duration.to_s