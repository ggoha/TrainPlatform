# frozen_string_literal: true

['Python', 'Ruby on Rails', 'Go', 'Elixir'].each do |title|
  Course.create(title: title)
end

course = Course.find_by(title: 'Python')
Random.rand(1..5).times do |count|
  course.groups.create(start_date: 1.year.ago + count.week)
end
course = Course.find_by(title: 'Ruby on Rails')
Random.rand(2..5).times do |count|
  course.groups.create(start_date: 1.week.ago + count.week)
end
course = Course.find_by(title: 'Go')
Random.rand(1..5).times do |count|
  course.groups.create(start_date: 1.year.from_now + count.week)
end

Student.create(email: 'nothing@test.com')
student = Student.create(email: 'all@test.com')
Group.all.each { |group| group.participations.create(student: student) }
