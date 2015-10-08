var Search = React.createClass({
	render: function(){
		console.log('alumni', this.props.alumnis);

		var people = this.props.alumnis.map(function(alumni){

				return(
					<ul>
					<li>{alumni.name}</li>
					<li>{alumni.about}</li>
					<li>{alumni.fun_fact}</li>
					</ul>
				)
		});


		return(
					<div>
					{people}

					</div>
		)


}
});
