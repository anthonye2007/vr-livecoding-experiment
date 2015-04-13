folderPath = "C:\\Users\\Anthony\\Documents\\code\\data\\participant-2\\"
puts folderPath
file = File.open(folderPath + 'live.log', 'r').read
puts file.to_s