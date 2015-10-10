var Search = React.createClass({
	getInitialState: function(){
		return {alumnis: [],
						employers: []
			};
	},
	componentDidMount: function(){
		this.setState({alumnis: this.props.alumnis, employers: this.props.employers})
	},
	handleAlumni: function(event){
		event.preventDefault;
		this.setState({employers: []});
	},
	handleEmployer: function(event){
		event.preventDefault;
		this.setState({alumnis: []});
	},
	handleViewCount: function(event){
		event.preventDefault;
		var mostviews = this.props.alumnis.sort(function(a, b){
			return (b.view - a.view)
		});
		this.setState({alumnis: mostviews});
	},
	handleClick: function(event){
		event.preventDefault();
		var unsort = React.findDOMNode(this.refs.unsort).text;
		console.log(unsort);
		this.setState({alumnis: this.props.alumnis, employers: this.props.employers});
	},
	handleChange: function(event){
		event.preventDefault;
		var sort = React.findDOMNode(this.refs.sort).value;
		var sortedA = this.props.alumnis.filter(function(value){
			return ( value.location_city == sort);
		});
		var sortedE = this.props.employers.filter(function(value){
			return ( value.location_city == sort);
		});
		this.setState({alumnis: sortedA, employers: sortedE});
	},

	render: function(){
		var people = this.state.alumnis.map(function(alumni){
				return(
				<div className="panel panel-default">
					<div className="panel-heading" role="tab" id="headingOne">
						<h4 className="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href={"#collapseOne"+alumni.user_id}>
							{alumni.first_name} {alumni.last_name} | <small>{alumni.location_city}, {alumni.location_state}</small></a>
						</h4>
					</div>
					<div id={"collapseOne"+alumni.user_id} className="panel-collapse collapse in" role="tabpanel">
						<div className="panel-body">
							<div className='col-md-6'>
								 <p><strong>Title:</strong> {alumni.position}</p>
								 <p><strong>About:</strong> {alumni.about}</p>
							</div>
							<div className='col-md-3'>
								<p><a href={"/alumnis/"+alumni.id} className="btn btn-link" role="button">Check Profile</a></p>
							</div>
						</div>
					</div>
				</div>
				)
		});
		var company = this.state.employers.map(function(employer){
				return(
					<div className="panel panel-default">
						<div className="panel-heading" role="tab" id="headingOne">
							<h4 className="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href={"#collapseOne"+employer.user_id}>
								{employer.company_name} | <small>{employer.location_city}, {employer.location_state}</small></a>
							</h4>
						</div>
						<div id={"collapseOne"+employer.user_id} className="panel-collapse collapse in" role="tabpanel">
							<div className="panel-body">
								<div className='col-md-6'>
									 <p><strong>Company Type:</strong> {employer.company_type}</p>
									 <p><strong>About:</strong> {employer.description}</p>
								</div>
								<div className='col-md-3'>
									<p><a href={"/employers/"+employer.id} className="btn btn-link" role="button">Check Profile</a></p>
								</div>
							</div>
						</div>
					</div>
				)
		});
		var locations = this.props.locations.map(function(location){
			return (
				<option value={location.city}> {location.city}, {location.state}</option>
			)
		})
		return(
			<div className="row">
				<div className='panel panel-default'>
					<div className='panel-heading'>
							<a href='#' className='btn btn-link' ref='unsort' onClick={this.handleClick}>Unsort</a>
							<a href='#' className='btn btn-link' ref='alumnionly' onClick={this.handleAlumni}>Alumni Only</a>
							<a href='#' className='btn btn-link' ref='employeronly' onClick={this.handleEmployer}>Employers Only</a>
							<a href='#' className='btn btn-link' ref='view' onClick={this.handleViewCount}>Viewcount</a>
						<div className="col-xs-3">
							<select className="form-control" name="alumnisort" form="locationselect">
								<option value="">Sort by Alumni</option>
								<option value='' onChange={this.handleAlumni}>Alumni Only</option>

							</select>
						</div>
						<div className="col-xs-3">
							<select className="form-control" name="locationpick" form="locationselect" ref='sort' onChange={this.handleChange}>
								<option value="">Sort by Location</option>
								{locations}
							</select>
						</div>

					</div>
				</div>

				<div className="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							{people}
							{company}
				</div>
			</div>

		)
}
});
