require 'terminal-table'
students = {name: [],email: [],size: []}
# students = {name: ['John','Steve','Henry','Vinny','Lupe'],email: ['John','Steve','Henry','Vinny','Lupe'],size: ['xs','xs','m','m','xl']}
while true
  puts "Please choose what you want to do"
  puts "1.Add students 2.See Tally 3.Print all orders table 4. Exit"
  opt = gets.to_i
  case opt
  when 1
    while true
      puts "Please enter the following details"
      print "Name:"
      name = gets.chomp
      print "Email:"
      email = gets.chomp
      puts "Please choose between XS,S,M,L,XL"
      print "Size:"
      size = gets.chomp.downcase.strip
      student_names = students[:name]
      student_emails = students[:email]
      student_sizes = students[:size]
      student_names.push(name)
      student_emails.push(email)
      student_sizes.push(size)
      system 'clear'
      puts "1.Add Another student 2. Exit"
      break if gets.to_i == 2
    end
  when 2
    extra_small = 0
    small = 0
    medium = 0
    large = 0
    extra_large = 0
    students[:size].each do |size|
      case size
      when "xs"
        extra_small += 1
      when "s"
        small += 1
      when "m"
        medium += 1
      when "l"
        large += 1
      when "xl"
        extra_large += 1
      end
    end
    system 'clear'
    graph = AsciiCharts::Cartesian.new([['Extra Small', extra_small], ['Small', small], ['Medium', medium], ['Large', large], ['Extra Large', extra_large]], :bar => true, :hide_zero => true).draw
    puts graph
  when 3
    student_names = students[:name]
    student_emails = students[:email]
    student_sizes = students[:size]
    count = student_names.count - 1
    rows = []
    for k in 0..count
      rows << [student_names[k],student_emails[k],student_sizes[k]]
    end
    table = Terminal::Table.new :title => "Student Sizes", :headings => ['Names', 'Email','Size'], :rows => rows
    puts table
  when 4
    break
  end
end
