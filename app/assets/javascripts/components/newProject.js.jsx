var NewProject = React.createClass({
	getInitialState: function(){
		return{show: false};
	},
	createForm: function() {
		this.setState({show: true});
	},	
	hideForm: function() {
		this.setState({show: false});
	},
	render: function() {
		return(
			<div>
				<a onClick={this.createForm} >Create A New Project</a>
				<ProjectForm onDone={this.hideForm} build={this.state.show} />
			</div>
		);
	}
});

var ProjectForm = React.createClass({
	render: function() {
		if (this.props.build == false) {
			return <div></div>;
		} else {
			return (
				<div>
					<form>
						<label>Project Name</label>
						<input type="text"/>
						<label>Project URL</label>
						<input type="text"/>
						<label>alumni id</label>
						<input type="text"/>
						
					<a onClick={this.props.onDone}>Hide</a>
					</form>
				</div>
			);
		}
	}
});

