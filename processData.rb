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
time = timestamp.split()[1] # Get time without date

timeDetails = time.split(':')
hours = timeDetails[0]
minutes = timeDetails[1]
seconds = timeDetails[2]

puts "hours: " + hours
puts "minutes: " + minutes
puts "seconds: " + seconds

timezoneOffset = '-05' # Eastern Time Zone is UTC-5
parsed = DateTime.parse(timestamp + timezoneOffset)
puts parsed
puts parsed.to_time.to_i