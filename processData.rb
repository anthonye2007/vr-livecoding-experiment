require "date"

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

#folderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-1\\"
Participant = ARGV[0] && ARGV[0].is_integer? ? ARGV[0] : 1
FolderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-" + Participant.to_s + "\\"
puts FolderPath
Ext = '.log'

Verbose = ARGV.include?('-v') || ARGV.include?('--verbose')
WriteToFile = ARGV.include?('-f') || ARGV.include?('--file')
RunPositioning = ARGV.include?('-p') || ARGV.include?('--positioning')

Environments = ['non-live', 'live', 'verticalHand', 'fullHandMovement']

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

def write(str)
  if WriteToFile
    open('positioning.csv', 'a') do |f|
      f.puts str
    end
  else
    puts str
  end
end

def runPositioning
  puts "Positioning Task"
  puts ""

  positioning = []

  Environments.each do |env| 
    puts "Environment: " + env

    seconds = processFile(env)
    seconds += processFile(env + '(1)')
    seconds += processFile(env + '(2)')

    average = (seconds / 3.0).round(1)
    positioning.push(average)
    puts "Average time: " + average.to_s
    puts ''
  end

  write("P" + Participant + "," + positioning.join(","))
end

def runFeatureLocation
  puts ""
  puts "Feature Location Task"
  puts ""

  Environments.each do |env| 
    puts "Environment: " + env

    seconds = processFile(env + '(3)')
    seconds += processFile(env + '(4)')
    seconds += processFile(env + '(5)')

    average = (seconds / 3.0).round(1)
    puts "Average time: " + average.to_s
    puts ''
  end
end

#write('experiment,non-live,live,vertical,full')

if RunPositioning
  runPositioning()
else
  runFeatureLocation()
end
