require 'koda'

puts 'Koda Data Dump/Restore'

Command        = ARGV[0]
Path           = ARGV[1]

raise "Command must be 'dump' or 'restore'" unless ['dump', 'restore'].include?(Command)

def dump
  mongodump = "mongodump -h localhost:27017 -d kodacms -o #{Path}"
  puts `#{mongodump}`
end

def restore
  mongorestore = "mongorestore -h localhost:27017 -d kodacms #{Path}"
  puts `#{mongorestore}`
end

eval(Command)