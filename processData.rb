require "date"

#folderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-2\\"
FolderPath = ARGV[0]
Ext = '.log'

def parseTime(str)
  timestamp = str.split(']')[0] # Returns timestamp but with a leading square bracket
  timestamp.slice!(0) # Remove leading bracket, now have date, then time

  timezoneOffset = '-05' # Eastern Time Zone is UTC-5
  parsed = DateTime.parse(timestamp + timezoneOffset)
  return parsed.to_time.to_i
end

def findStartTime(filename)
  path = FolderPath + filename + Ext
  start = ''
  File.readlines(path).each do |line|
    line.strip!
    start = line if line.end_with?(':')
  end

  startTime = parseTime(start)
  #puts "Started at: " + startTime.to_s

  return startTime
end

def findEndTime(filename)
  done = ''
  path = FolderPath + filename + Ext
  File.readlines(path).each do |line|
    done = line if line.include?('Done')
  end

  doneTime = parseTime(done)
  #puts "Finished at: " + doneTime.to_s

  return doneTime
end

def processFile(filename)
  puts "Environment: " + filename
  start = findStartTime(filename)
  done = findEndTime(filename)

  duration = done - start
  puts "Duration (in seconds): " + duration.to_s
  puts ''

  return duration
end

environment = 'fullHandMovement'

seconds = 0

seconds += processFile(environment)
seconds += processFile(environment + '(1)')
seconds += processFile(environment + '(2)')

average = seconds / 3.0
puts "Average time: " + average.to_s