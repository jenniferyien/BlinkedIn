

locations = [
	[ 'Atlanta','Georgia' ],
	[ 'Austin', 'Texas' ],
	[ 'Boston', 'Massachussettes' ],
	[ 'Chicago', 'Illinois' ],
	[ 'Hong Kong', 'China' ],
	[ 'London', 'United Kindom' ],
	[ 'Los Angeles', 'California' ],
	[ 'Melbourne', 'Australia' ],
	[ 'New York', 'New York' ],
	[ 'San Francisco', 'California' ],
	[ 'Seattle', 'Washington' ],
	[ 'Singapore', 'Singapore' ],
	[ 'Sydney', 'Australia' ],
	[ 'Washington', 'D.C.' ]
	]

locations.each do |city, state|
	Location.create( city: city, state: state )
end

skills = [ "Javascript", "React.js", "Ruby", "Ruby on Rails", "Angular", "JQuery", "JSON", "CoffeeScript", "Digital Ocean", "Jasmine", "Git", "Backbone", "Three.js", "CSS", "Bootstrap", "Sinatra", "AJAX", "PostgreSQL", "SQL", "RSPEC", "Bash", "C++", "C", "C#", "Python", "ImageMagik", "Materialize", "MATLAB", "WebGL", "Pascal", "Perl", "UNITY", "Visual Basic", "Redis", "Varnish", "Puffing Billing", "Heroku", "JCrop", "OAuth", "Selenium", "Poltergeist", "Capybara" ]

skills.each do |skill|
  Skill.create( name: skill )
end

# Populating users who are employers
ben = User.create(first_name: 'Benjamin', last_name: 'Button' ,email: 'bensButtons@gmail.com')
harry = User.create(first_name: 'Parry', last_name: 'Hotter' ,email: 'wizKid@gmail.com')
eli = User.create(first_name: 'Eli', last_name: 'Betanning' ,email: 'AlwaysTanning@gmail.com')
frank = User.create(first_name: 'Frank', last_name: 'Footer' ,email: 'TastyDog@gmail.com')
mike = User.create(first_name: 'Mike', last_name: 'Jones' ,email: 'MikeJones@gmail.com')
	
Employer.create(location_id: 1,user_id:ben.id , company_name: 'Frugal',website:'www.Frugal.com', company_type:'Corporate', description: "We want to be the best, but also spend the least.")
Employer.create(location_id: 2,user_id:harry.id , company_name: 'The Wizard Station',website:'www.magic.com', company_type:'Startup', description: "We magically make things appear.")
Employer.create(location_id: 3,user_id:eli.id , company_name: 'The Dark Fellas',website:'www.TanCheeks.com', company_type:'Dev Shop', description: "We like to color you.")
Employer.create(location_id: 4,user_id:frank.id , company_name: 'Footers',website:'www.TheLongDog.com', company_type:'Consulting', description: "Home of the tastiest longeset hotdogs.")
Employer.create(location_id: 5,user_id:mike.id , company_name: 'Who?',website:'www.WhoIsMike.com', company_type:'Startup', description: "We aim to find out who Mike Jones is!")

# Populating users who are Alumnis
bobby = User.create(first_name: 'Bobby', last_name: 'King' ,email: 'TheKing@gmail.com')
pan = User.create(first_name: 'Pan', last_name: 'Wangperawong' ,email: 'PanDaMan@gmail.com')
dennis = User.create(first_name: 'Dennis', last_name: 'Liaw' ,email: 'DennisTheMenace@gmail.com')
jaden = User.create(first_name: 'Jaden', last_name: 'Carver' ,email: 'JadenDontBeHatin@gmail.com')

Alumni.create(user_id: bobby.id, location_id: 1, about: "I like snowboarding and coding", q1: "My muscles",q2:"Catcher in the Rye" ,q3: "Yes", position: "BackEnd Developer", fun_fact: "I can jump 5 feet high.")
Alumni.create(user_id: pan.id, location_id: 3, about: "I like coding and cooking like its nobody's business", q1: "Everything",q2:"Zesty Styled Cook Book" ,q3: "Of course", position: "CEO", fun_fact: "I can jump 10 feet high.")
Alumni.create(user_id: dennis.id, location_id: 2, about: "Im a ninja on a Ninja", q1: "Acquiring Currency and disregarding females",q2:"Import Tunerz" ,q3: "Not sure", position: "Down for anything", fun_fact: "Im a master at taking selfies")
Alumni.create(user_id: jaden.id, location_id: 4, about: "Long walks on the beach with my dog and disc golf", q1: "Problem solving",q2:"Holes" ,q3: "Not sure", position: "FrontEnd Dev", fun_fact: "I once threw a paper plane inside a real plane")












