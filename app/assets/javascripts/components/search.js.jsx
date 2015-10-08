var Search = React.createClass({
	render: function(){
		var people = this.props.alumni.map(function(name){
				var about = name.about
				return( about )
		});
		var search = this.props.searchtext;
		console.log(people)
		if(people[0].indexOf(search) != -1){
			alert(search + " found");
		}
				return(
					<h1>Hello{people.indexOf('coding')}</h1>
				)


}
});
