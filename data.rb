require 'koda'

puts 'Koda Data Dump/Restore'

raise "No Path Specified" unless ARGV.length > 1

Command        = ARGV[0]
Path           = ARGV[1]

raise "Command must be 'dump' or 'restore'" unless ['dump', 'restore'].include?(Command)

@config = MongoConfig.GetConfig()

def server
  @config[:server]
end

def port
  @config[:port]
end

def db
  @config[:db]
end

def username
  @config[:username]
end

def password
  @config[:password]
end

def dump
  puts "using config: #{@config.inspect}"
  if username
    mongodump = "mongodump -h #{server}:#{port} -d #{db} -u #{username} -p #{password} -o #{Path}"
    puts "executing: #{mongodump}"
    puts `#{mongodump}`
  else
    mongodump = "mongodump -h #{server}:#{port} -d #{db} -o #{Path}"
    puts "executing: #{mongodump}"
    puts `#{mongodump}`
  end
end

def restore
  puts "using config: #{@config.inspect}"
  if username
    mongorestore = "mongorestore -h #{server}:#{port} -d #{db} -u #{username} -p #{password} #{Path}"
    puts "executing: #{mongorestore}"
    puts `#{mongorestore}`
  else
    mongorestore = "mongorestore -h #{server}:#{port} -d #{db} #{Path}"
    puts "executing: #{mongorestore}"
    puts `#{mongorestore}`
  end
end

eval(Command)