var Search = React.createClass({
	render: function(){
		var people = this.props.alumnis.map(function(alumni){
				return(
					<div className="thumbnail">
						<img src={alumni.avatar.avatar.profile.url} />
						<div className="caption">
							<h3>{alumni.first_name} {alumni.last_name}</h3>

					<li>{alumni.city}</li>
					<li>{alumni.state}</li>
						</div>
					</div>
				)
		});
		var company = this.props.employers.map(function(employer){
				return(
					<div className="thumbnail">
					<li><img src={employer.avatar.avatar.profile.url} /></li>
					<li>{employer.company_name}</li>
					<li>{employer.city}</li>
					<li>{employer.state}</li>
					</div>
				)
		});

		return(
					<div className='row'>
						<div className="col-sm-6 col-md-4">
					{people}
					{company}
						</div>
					</div>
		)


}
});
