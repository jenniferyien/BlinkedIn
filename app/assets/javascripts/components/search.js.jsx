var Search = React.createClass({
	render: function(){
		var people = this.props.alumni.map(function(alumni){

				return(
				<ul>

				<li>{alumni.about}</li>
				<li>{alumni.user_id}</li>
				</ul>
				)
		});
		var company = this.props.company.map(function(name){
				return (
				<li>{name.company_name}</li>
				)
		});

				return(
					<div>
					{people}
					{company}
					</div>
				)


}
});
