require "date"

#folderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-2\\"
folderPath = ARGV[0]
ext = '.log'
filename = 'live'
FilePath = folderPath + filename + ext
puts FilePath

def parseTime(str)
  timestamp = str.split(']')[0] # Returns timestamp but with a leading square bracket
  timestamp.slice!(0) # Remove leading bracket, now have date, then time

  timezoneOffset = '-05' # Eastern Time Zone is UTC-5
  parsed = DateTime.parse(timestamp + timezoneOffset)
  return parsed.to_time.to_i
end

def findStartTime
  start = ''
  File.readlines(FilePath).each do |line|
    line.strip!
    start = line if line.end_with?(':')
  end

  startTime = parseTime(start)
  puts "Started at: " + startTime.to_s

  return startTime
end

def findEndTime
  done = ''

  File.readlines(FilePath).each do |line|
    done = line if line.include?('Done')
  end

  doneTime = parseTime(done)
  puts "Finished at: " + doneTime.to_s

  return doneTime
end

def processFile
  start = findStartTime()
  done = findEndTime()

  duration = done - start
  puts "Duration (in seconds): " + duration.to_s
end

processFile
