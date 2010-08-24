puts '**** HOOK ****'
if migrate?
  puts "I am running migrations!"
else
  puts "No migrations for me."
end

puts '**** /HOOK ****'
