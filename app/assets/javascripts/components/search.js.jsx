var Search = React.createClass({
	// Initial values
	getInitialState: function(){
		return {alumnis: [],
						employers: []
			};
	},
	//Page will display values of alumni and employers based on search
	componentDidMount: function(){
		this.setState({alumnis: this.props.alumnis, employers: this.props.employers})
	},
	//if only alumni search set employer will be 0
	handleAlumni: function(event){
		event.preventDefault;
		this.setState({alumnis: this.props.alumnis, employers: []});
	},
	//if only employer search set alumni wiill be 0
	handleEmployer: function(event){
		event.preventDefault;
		this.setState({alumnis: [], employers: this.props.employers});
	},
	//sorting viewcount for most to least views for alumni
	handleViewMCount: function(event){
		event.preventDefault;
		var mostviews = this.props.alumnis.sort(function(a, b){
			return (b.view - a.view)
		});
		this.setState({alumnis: mostviews});
	},
	//sorting viewcount for least to most views for alumni
	handleViewLCount: function(event){
		event.preventDefault;
		var leastviews = this.props.alumnis.sort(function(a,b){
			return (a.view - b.view)
		});
		this.setState({alumnis: leastviews});
	},
	//if clicking on unsort, everything reverts back to search
	handleClick: function(event){
		event.preventDefault();
		this.setState({alumnis: this.props.alumnis, employers: this.props.employers});
	},
	//filtering search based on location
	handleChange: function(event){
		event.preventDefault;
		var sort = React.findDOMNode(this.refs.sort).value;
		var sortedA = this.props.alumnis.filter(function(value){
			return ( value.location_id == sort);
		});
		var sortedE = this.props.employers.filter(function(value){
			return ( value.location_id == sort);
		});
		this.setState({alumnis: sortedA, employers: sortedE});
	},
	// filtering search based on if alumni has the skill
	handleSkillSelect: function(event){
		event.preventDefault;
		var skillsort = React.findDOMNode(this.refs.sortskill).value;
		var skillSelected = this.props.alumnis.filter(function(skill){
			var skills = skill.skills.map(function(name){
				if (name.id == skillsort){
				return(true)
			}
			});
			return (skills.indexOf(true) > -1)
		});
		this.setState({alumnis: skillSelected, employers: []});
	},
	// rendering the view
	render: function(){
		var people = this.state.alumnis.map(function(alumni){
				return(
				<div className="panel panel-success">
					<div className="panel-heading success" role="tab" id="headingOne">
						<h4 className="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href={"#collapseOne"+alumni.user_id}>
							{alumni.first_name} {alumni.last_name} | <small>{alumni.location_city}, {alumni.location_state}</small></a>
							<span className="badge pull-right">Views: {alumni.view}</span>
						</h4>
					</div>
					<div id={"collapseOne"+alumni.user_id} className="panel-collapse collapse" role="tabpanel">
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
					<div className="panel panel-warning">
						<div className="panel-heading warning" role="tab" id="headingOne">
							<h4 className="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href={"#collapseOne"+employer.user_id}>
								{employer.company_name} | <small>{employer.location_city}, {employer.location_state}</small></a>
							</h4>
						</div>
						<div id={"collapseOne"+employer.user_id} className="panel-collapse collapse" role="tabpanel">
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
				<option value={location.id}> {location.city}, {location.state}</option>
			)
		});
		var skills = this.props.skills.map(function(skill){
			return (
				<option value={skill.id}> {skill.name} </option>
			)
		});
		return(
			<div className="row">
				<div className='panel panel-default'>
					<div className='panel-heading search'>
							<div className="btn-group btn-group-sm" role="group">
								<div class="form-group">
										<label>&#160; Alumni View Count Sort &#160;</label>
										<button type="button" onClick={this.handleViewMCount} className="btn btn-primary btn-xs btn-default"><span className="glyphicon glyphicon-arrow-up span12"></span></button>
										<button type="button" onClick={this.handleViewLCount} className="btn btn-primary btn-xs btn-default"><span className="glyphicon glyphicon-arrow-down span12"></span></button>&#160;
										<a href='#' className='btn btn-xs btn-primary' ref='alumnionly' onClick={this.handleAlumni}>Alumni Only</a> &#160;
									  <a href='#' className='btn btn-xs btn-primary' ref='employeronly' onClick={this.handleEmployer}>Employers Only</a>
								</div>
							</div>

					 		<div className="col-xs-3">
								<select className="form-control input-sm" name="locationpick" form="locationselect" ref='sort' onChange={this.handleChange}>
									<option>Filter by Location</option>
									{locations}
								</select>
							</div>
							<div className="col-xs-3">
								<select className="form-control input-sm" name="skillpick" form="skillselect" ref='sortskill' onChange={this.handleSkillSelect}>
									<option>Filter by Alumni Skill</option>
									{skills}
								</select>
							</div>

							<a href='#' className='btn btn-sm badge pull-right' ref='unsort' onClick={this.handleClick}>Unfilter</a>

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
