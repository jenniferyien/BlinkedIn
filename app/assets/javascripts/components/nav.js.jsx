var MainDiv = React.createClass({
	render: function(){
		return(
			<div>
				<NavBar user={this.props.user}/>
			</div>
		);
	}
});

var NavBar = React.createClass({
	render: function(){
		return(
			<nav className="navbar navbar-default">
				<div className="container-fluid">
					<Logo/>
				

				<div className="collapse navbar-collapse">
					<SearchForm/>
				</div>
				<UserStatus loggedIn={this.props.user}/>
				</div>
			</nav>
		);
	}
});

var Logo = React.createClass({
	render: function(){
		return(
			<a className="navbar-brand" href="/">
				<h4>logo</h4>
			</a>
		);
	}
});

var SearchForm = React.createClass({
	render: function(){
		return(
			<form className="navbar-form navbar-right" role="search">
				<div className="form-group">
					<input type="text" className="form-control" placeholder="search"/>

				</div>	
			</form>
		);
	}
});

var UserStatus = React.createClass({
	render: function(){
		if (this.props.loggedIn)  
		return (
			<a href='/logout'>Logout</a>
			);
		else 
		return(
			<a href='/auth/google_oauth2'>Sign In with Google</a>
			);
	}
})