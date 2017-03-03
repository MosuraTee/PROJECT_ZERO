require 'time'

#condition: BAC test, Hazard, Collision, Closure,
class Main
  @@incidents = [
  {street: "batman", time: "08 AM", time_until: "10 AM", condition: "Closure" },
  {street: "folk", time: "09 PM", time_until: "11 PM", condition: "Hazard" },
  {street: "phoenix", time: "11 AM", time_until: "12 PM", condition: "Collision"},
  {street: "mac", time: "04 PM", time_until: "08 PM", condition: "Closure"},
  {street: "man", time: "08 AM", time_until: "10 AM", condition: "BAC test"}
]

def self.run
begin
  print "Provide street name info ?"
  street_name = gets.chomp
  info = @@incidents.find {|i| i[:street].strip.downcase == street_name.strip.downcase}
  if info.nil?
    puts "We have no current information for this street name..."
    puts "However, here are streets we have information: "
    @@incidents.each {|i| puts "\tStreet: #{i[:street]}"}
  else
    puts " We have the following info for this street #{info}:"
  end

  # 11 => 11:00 or 11 AM
  #
begin
  print "Provide time of interest (in 24 hours format HH:MM)?"
  time_str = gets.chomp
  if (time_str =~ /^[0-9]|0[0-9]|1[0-9]|2[0-3]:[0-5][0-9]$/).nil?
    puts "Invalid time format. Please try again:"
  else
    break
  end
end
while true
  time =Time.parse(time_str)
  matches = @@incidents.select {|i|
    t = Time.parse(i[:time]);
    ut = Time.parse(i[:time_until]);
    (time >= t && time <= ut)
  }
    if matches.empty?
    puts "There are no incidents at this time..."
        else
    matches.each {|i| puts i}
    end

  print "Do you want to exit (y/n)?"
  choice = gets.chomp
    end while choice.downcase.include?("n")
end

  # def self.display_table
  #     rows = []
  #     @@incidents.each do |i|
  #     rows << [i[:street]
  #   end
  #   table = Terminal::Table.new :headings => ['Street'], :rows => rows
  #   puts table
  # end

  def self.incidents
    @incidents
end
end 
