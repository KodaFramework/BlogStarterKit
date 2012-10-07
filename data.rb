require 'koda'

puts 'Koda Data Dump/Restore'

Command        = ARGV[0]

raise "Command must be 'dump' or 'restore'" unless ['dump', 'restore'].include?(Command)

def dump
  mongodump = "mongodump -h localhost:27017 -d koda -o data/"
  puts `#{mongodump}`
end

def restore
  mongorestore = "mongorestore -h localhost:27017 -d koda data/koda"
  puts `#{mongorestore}`
end

eval(Command)