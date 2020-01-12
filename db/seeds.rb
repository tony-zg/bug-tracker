  User.destroy_all

    u1 = User.create! name: 'Tony', email: 'tony@ga.com', password: 'chicken', admin: true
    u2 = User.create! name: 'Person1', email: 'person1@ga.com', password: 'chicken'
    u3 = User.create! name: 'Person2', email: 'person2@ga.com', password: 'chicken'

    puts "Created #{ User.count } users."

  Project.destroy_all

    p1 = Project.create! name: 'Project A', user: u1
    p2 = Project.create! name: 'Project B', user: u1
    p3 = Project.create! name: 'Project C', user: u2
    p4 = Project.create! name: 'Project D', user: u2
    p5 = Project.create! name: 'Project E', user: u3

    # u1.projects << p1 << p2

  puts "Created #{ Project.count } projects."

  # Bug.destroy_all
  #
  #   p1 = Bug.create! name: 'Bug A'
  #   p2 = Bug.create! name: 'Bug B'
  #   p3 = Bug.create! name: 'Bug C'
  #   p4 = Bug.create! name: 'Bug D'
  #   p5 = Bug.create! name: 'Bug E'
  #
  #   puts "Created #{ Bug.count } bugs."
  #
  # StaffMember.destroy_all
  #
  #   p1 = Staff.create! name: 'Staff A'
  #   p2 = Staff.create! name: 'Staff B'
  #   p3 = Staff.create! name: 'Staff C'
  #   p4 = Staff.create! name: 'Staff D'
  #   p5 = Staff.create! name: 'Staff E'
  #
  # puts "Created #{ Staff.count } staffs."
