folderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-2\\"
ext = '.log'
filename = 'live'
filePath = folderPath + filename + ext

puts filePath


File.readlines(filePath).each do |line|
  puts line if line.include?('Done')
end