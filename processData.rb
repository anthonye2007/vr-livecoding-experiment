require "date"

#folderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-2\\"
participant = ARGV[0] ? ARGV[0] : 2
FolderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-" + participant.to_s + "\\"
puts FolderPath
Ext = '.log'

Verbose = ARGV[1] == '-v'

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
  start = findStartTime(filename)
  done = findEndTime(filename)

  duration = done - start
  puts "Duration (in seconds): " + duration.to_s if Verbose

  return duration
end

environments = ['non-live', 'live', 'verticalHand', 'fullHandMovement']

puts "Positioning Task"
puts ""

environments.each do |env| 
  puts "Environment: " + env

  seconds = processFile(env)
  seconds += processFile(env + '(1)')
  seconds += processFile(env + '(2)')

  average = (seconds / 3.0).round(1)
  puts "Average time: " + average.to_s
  puts ''
end

puts ""
puts "Feature Location Task"
puts ""

environments.each do |env| 
  puts "Environment: " + env

  seconds = processFile(env + '(3)')
  seconds += processFile(env + '(4)')
  seconds += processFile(env + '(5)')

  average = (seconds / 3.0).round(1)
  puts "Average time: " + average.to_s
  puts ''
end
