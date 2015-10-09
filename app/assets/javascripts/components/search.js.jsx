var Search = React.createClass({
	render: function(){
		var people = this.props.alumnis.map(function(alumni){
				return(
					<div className="thumbnail">
						<img src={alumni.avatar.avatar.url} />
						<div className="caption">
							<h3>{alumni.first_name} {alumni.last_name}</h3>
							<p>{alumni.city} {alumni.state} </p>
							<p><a href={"/alumnis/"+alumni.id} className="btn btn-primary" role="button">Check Profile</a></p>
						</div>
					</div>
				)
		});
		var company = this.props.employers.map(function(employer){
				return(
					<div className="thumbnail">
						<img src={employer.avatar.avatar.url} />
						<div className="caption">
							<h3>{employer.company_name}</h3>
							<p>{employer.city} {employer.state} </p>
							<p><a href={"/employers/"+employer.id} className="btn btn-primary" role="button">Check Profile</a></p>
						</div>
					</div>
				)
		});

		return(
					<div className='row'>
						<div className="col-md-6">
								{people}
						</div>
						<div className="col-md-6">
								{company}
						</div>
					</div>
		)
}
});
