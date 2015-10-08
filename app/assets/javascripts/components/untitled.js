var NewProject = React.createClass({
	getInitialState: function(){
		return{show: ''};
	},
	createForm: function() {
		this.setState({show: 'form'});
	},	
	hideForm: function() {
		this.setState({show: ''});
	},
	render: function() {
		return(
			<div>
				<button>Create A New Project</button>
				<a onClick={this.createForm}>New Project</a>
				<ProjectForm onDone={this.hideForm} build={this.state.show} />
			</div>
		);
	}
});

var ProjectForm = React.createClass({
	render: function() {
		if (this.props.build == '') {
			return <div></div>;
		} else {
			return (
				<div>
					<strong>Write your form here</strong>
					<a onClick={this.props.onDone}>Hide</a>
				</div>
			);
		}
	}
});

