var Search = React.createClass({
	render: function(){
		var people = this.props.alumnis.map(function(alumni){
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
		var company = this.props.employers.map(function(employer){
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
		var endorsement = this.props.endorsement.map(function(endorse){
				return(
				<div className="panel panel-default">
					<div className="panel-heading" role="tab" id="headingOne">
						<h4 className="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href={"#collapseOne"+endorse.user_id}>
							{endorse.first_name} {endorse.last_name} | <small>{endorse.location_city}, {endorse.location_state}</small></a>
						</h4>
					</div>
					<div id={"collapseOne"+endorse.user_id} className="panel-collapse collapse in" role="tabpanel">
						<div className="panel-body">
							<div className='col-md-6'>
								 <p><strong>Title:</strong> {endorse.position}</p>
								 <p><strong>About:</strong> {endorse.about}</p>s
							</div>
							<div className='col-md-3'>
								<p><a href={"/alumnis/"+endorse.user_id} className="btn btn-link" role="button">Check Profile</a></p>
							</div>
						</div>
					</div>
				</div>
				)
		});
		console.log(endorsement)
		return(
					<div className="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								{people}
								{company}
								{endorsement}
					</div>
		)
}
});
