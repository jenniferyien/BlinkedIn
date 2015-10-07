

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
