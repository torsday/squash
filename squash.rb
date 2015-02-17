#!/usr/bin/env ruby

require "set"

match_list = Set.new
ARGV.each do |arg|
  Dir.new('.').select{|f| f.downcase.match(/#{arg.downcase}/)}.each do |file|
    puts file
    match_list << file
  end
end

match_list.delete_if{|x|x.match(/\.swp$/)}
match_list.delete_if{|x|x.match(/\.git$/)}

puts "files to squash"
match_list.each{|f| puts "  #{f}"}
puts "-" * 32

t = Time.now.localtime

new_file_name = "#{ARGV[0]} #{t.strftime("%Y-%m-%d %H:%M:%S")}.md"
puts "New File: #{new_file_name}"

new_file = File.new(new_file_name, "w+")

new_file.puts "# #{ARGV[0]}\n\n---\n" # title
new_file.puts "## ARCHIVE INDEX"
match_list.each{|f| new_file.puts "* #{f}"}
new_file.puts "\n\n---\n"

match_list.each do |file|
  f = File.open(file,"r")
  new_file.puts "\n\n---\n"
  new_file.puts "\#\# ```#{file}```\n"
  f.each_line do |line|
    if line =~ /^#/
      new_file.puts "\##{line}"
    else
      new_file.puts line
    end
  end
  f.close
  File.delete(file)
end

