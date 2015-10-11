

locations = [
  %w(Atlanta Georgia),
  %w(Austin Texas),
  %w(Boston Massachussettes),
  %w(Chicago Illinois),
  ['Hong Kong', 'China'],
  ['London', 'United Kindom'],
  ['Los Angeles', 'California'],
  %w(Melbourne Australia),
  ['New York', 'New York'],
  ['San Francisco', 'California'],
  %w(Seattle Washington),
  %w(Singapore Singapore),
  %w(Sydney Australia),
  ['Washington', 'D.C.']
]

locations.each do |city, state|
  Location.create!(city: city, state: state)
end

skills = [
  'Javascript', 'React.js', 'Ruby', 'Ruby on Rails', 'Angular', 'JQuery',
  'JSON', 'CoffeeScript', 'Digital Ocean', 'Jasmine', 'Git', 'Backbone',
  'Three.js', 'CSS', 'Bootstrap', 'Sinatra', 'AJAX', 'PostgreSQL', 'SQL',
  'RSPEC', 'Bash', 'C++', 'C', 'C#', 'Python', 'ImageMagik', 'Materialize',
  'MATLAB', 'WebGL', 'Pascal', 'Perl', 'UNITY', 'Visual Basic', 'Redis',
  'Varnish', 'Puffing Billing', 'Heroku', 'JCrop', 'OAuth', 'Selenium',
  'Poltergeist', 'Capybara'
]

skills.each do |skill|
  Skill.create!(name: skill)
end

# Populating users who are employers
ben = User.create(first_name: 'Benjamin', last_name: 'Button', email: 'bensButtons@gmail.com')
harry = User.create(first_name: 'Parry', last_name: 'Hotter', email: 'wizKid@gmail.com')
eli = User.create(first_name: 'Eli', last_name: 'Betanning', email: 'AlwaysTanning@gmail.com')
frank = User.create(first_name: 'Frank', last_name: 'Footer', email: 'TastyDog@gmail.com')
mike = User.create(first_name: 'Mike', last_name: 'Jones', email: 'MikeJones@gmail.com')

emp_ben = Employer.create(location_id: 1, user_id: ben.id, company_name: 'Frugal', website: 'www.Frugal.com', company_type: 'Corporate', description: 'We want to be the best, but also spend the least.')
emp_harry = Employer.create(location_id: 2, user_id: harry.id, company_name: 'The Wizard Station', website: 'www.magic.com', company_type: 'Startup', description: 'We magically make things appear.')
Employer.create(location_id: 3, user_id: eli.id, company_name: 'The Dark Fellas', website: 'www.TanCheeks.com', company_type: 'Dev Shop', description: 'We like to color you.')
Employer.create(location_id: 4, user_id: frank.id, company_name: 'Footers', website: 'www.TheLongDog.com', company_type: 'Consulting', description: 'Home of the tastiest longeset hotdogs.')
Employer.create(location_id: 5, user_id: mike.id, company_name: 'Who?', website: 'www.WhoIsMike.com', company_type: 'Startup', description: 'We aim to find out who Mike Jones is!')

# Populating users who are Alumnis
bobby = User.create(first_name: 'Bobby', last_name: 'King', email: 'TheKing@gmail.com')
pan = User.create(first_name: 'Pan', last_name: 'Wangperawong', email: 'PanDaMan@gmail.com')
dennis = User.create(first_name: 'Dennis', last_name: 'Liaw', email: 'DennisTheMenace@gmail.com')
jaden = User.create(first_name: 'Jaden', last_name: 'Carver', email: 'JadenDontBeHatin@gmail.com')

alum_bobby = Alumni.create(user_id: bobby.id, location_id: 1, about: 'I like snowboarding and coding', q1: 'My muscles', q2: 'Catcher in the Rye', q3: 'Yes', position: 'BackEnd Developer', fun_fact: 'I can jump 5 feet high.', view: 115)
alum_pan = Alumni.create(user_id: pan.id, location_id: 3, about: "I like coding and cooking like its nobody's business", q1: 'Everything', q2: 'Zesty Styled Cook Book', q3: 'Of course', position: 'CEO', fun_fact: 'I can jump 10 feet high.', view: 60)
alum_dennis = Alumni.create(user_id: dennis.id, location_id: 2, about: 'Im a ninja on a Ninja', q1: 'Acquiring Currency and disregarding females', q2: 'Import Tunerz', q3: 'Not sure', position: 'Down for anything', fun_fact: 'Im a master at taking selfies', view: 90)
Alumni.create(user_id: jaden.id, location_id: 4, about: 'Long walks on the beach with my dog and disc golf', q1: 'Problem solving', q2: 'Holes', q3: 'Not sure', position: 'FrontEnd Dev', fun_fact: 'I once threw a paper plane inside a real plane', view: 15)

Endorsement.create([
  { user_id: bobby.id, alumni_id: alum_bobby.id, skill_id: 1 },
  { user_id: bobby.id, alumni_id: alum_bobby.id, skill_id: 2 },
  { user_id: pan.id, alumni_id: alum_pan.id, skill_id: 4 },
  { user_id: pan.id, alumni_id: alum_bobby.id, skill_id: 3 },
  { user_id: bobby.id, alumni_id: alum_pan.id, skill_id: 5 }])

DesiredSkill.create([
  { employer_id: emp_ben.id, skill_id: 1 },
  { employer_id: emp_ben.id, skill_id: 3 },
  { employer_id: emp_ben.id, skill_id: 4 },
  { employer_id: emp_harry.id, skill_id: 2 },
  { employer_id: emp_harry.id, skill_id: 7 }
])

# Some fake projects
Project.create(alumni_id: alum_dennis.id, name: 'awesome project', url: 'https://www.reddit.com', description: 'made this in 5 minutes')
Project.create(alumni_id: alum_dennis.id, name: 'bad project', url: 'https://www.reddit.com', description: 'made this in 1 minutes')
