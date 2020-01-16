  User.destroy_all

    u1 = User.create! name: 'Tony', email: 'tony@ga.com', password: 'chicken', admin: true, address: '1 York St, Sydney'
    u2 = User.create! name: 'Person1', email: 'person1@ga.com', password: 'chicken', address: '2 York St, Sydney'
    u3 = User.create! name: 'Person2', email: 'person2@ga.com', password: 'chicken', address: '3 York St, Sydney'

    puts "Created #{ User.count } users."

  Project.destroy_all

    p1 = Project.create! name: 'Project A', to: 'Team R', frontend: 'React', backend: 'PHP', customer: 'Company Z',  user_id: u1.id
    p2 = Project.create! name: 'Project B', to: 'Team S', frontend: 'JavaScript', backend: 'Ruby', customer: 'Company K', user_id: u2.id
    p3 = Project.create! name: 'Project C', to: 'Team N', frontend: 'Node.js', backend: 'Java', customer: 'Company Z', user_id: u3.id
    p4 = Project.create! name: 'Project D', to: 'Team H', frontend: 'Angular', backend: 'Python', customer: 'Company O', user_id: u1.id
    p5 = Project.create! name: 'Project E', to: 'Team W', frontend: 'JQuery', backend: 'C#', customer: 'Company V', user_id: u2.id



  puts "Created #{ Project.count } projects."

  p1.users << u1 << u2
  p2.users << u1 << u3
  p3.users << u2 << u1
  p4.users << u2 << u3
  p5.users << u3 << u1

  Bug.destroy_all

    b1 = Bug.create! name: 'Bug A', priority: 'Medium', team_member: 'Tony', status: 'New', start_date: '01/01/2020', due_date: '02/02/2020', project: p3, user: u1
    b2 = Bug.create! name: 'Bug B',  priority: 'Low', team_member: 'Person1', status: 'Checked', start_date: '04/01/2020', due_date: '06/03/2020', project: p3, user: u2
    b3 = Bug.create! name: 'Bug C', priority: 'High', team_member: 'Person2', status: 'New', start_date: '08/01/2020', due_date: '25/01/2020',  project: p2, user: u3
    b4 = Bug.create! name: 'Bug D', priority: 'Medium', team_member: 'Tony', status: 'checked', start_date: '13/01/2020', due_date: '27/02/2020', project: p2, user: u1
    b5 = Bug.create! name: 'Bug E', priority: 'High', team_member: 'Tony', status: 'Completed', start_date: '01/01/2020', due_date: '05/01/2020',project: p1, user: u2

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
