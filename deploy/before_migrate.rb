puts '**** HOOK ****'
if migrate?
  puts "I am running migrations!"
else
  puts "No migrations for me."
end

require 'pp'
puts "Configuration is " + config.pretty_inspect
puts '**** /HOOK ****'
