  User.destroy_all

    u1 = User.create! name: 'Tony', email: 'tony@ga.com', password: 'chicken', admin: true
    u2 = User.create! name: 'Person1', email: 'person1@ga.com', password: 'chicken'
    u3 = User.create! name: 'Person2', email: 'person2@ga.com', password: 'chicken'

    puts "Created #{ User.count } users."

  Project.destroy_all

    p1 = Project.create! name: 'Project A', user_id: u1.id
    p2 = Project.create! name: 'Project B', user_id: u2.id
    p3 = Project.create! name: 'Project C', user_id: u3.id
    p4 = Project.create! name: 'Project D', user_id: u1.id
    p5 = Project.create! name: 'Project E', user_id: u2.id



  puts "Created #{ Project.count } projects."

  p1.users << u1 << u2
  p2.users << u1 << u3
  p3.users << u2 << u1
  p4.users << u2 << u3
  p5.users << u3 << u1

  Bug.destroy_all

    b1 = Bug.create! name: 'Bug A', project: p3, user: u1
    b2 = Bug.create! name: 'Bug B', project: p3, user: u2
    b3 = Bug.create! name: 'Bug C', project: p2, user: u3
    b4 = Bug.create! name: 'Bug D', project: p2, user: u1
    b5 = Bug.create! name: 'Bug E', project: p1, user: u2

    puts "Created #{ Bug.count } bugs."
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
