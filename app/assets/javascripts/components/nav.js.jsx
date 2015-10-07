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
				<div className="collapse navbar-collapse navbar-right">
					<SearchForm/>
					<div className='nav navbar-nav navbar-right'>
						<UserStatus loggedIn={this.props.user}/>
					</div>
				</div>
				</div>
			</nav>
		);
	}
});

var Logo = React.createClass({
	render: function(){
		return(
			<div className='navbar-header col-md-4'>
				<div id='eye' className='eye branding'>
				</div>
				<a className="navbar-brand branding" href="/users">
					&#160;BLinkedIn
				</a>
			</div>
		);
	}
});

var SearchForm = React.createClass({
	render: function(){
		return(
			<form className="navbar-form navbar-left" role="search">
				<div className="form-group">
					<input type="text" className="form-control" placeholder="search"/>
				</div>
				<button type="submit" id='search' className="btn btn-default glyphicon glyphicon-search"></button>
			</form>
		);
	}
});

var UserStatus = React.createClass({
	render: function(){
		if (this.props.loggedIn)
		return (
			<a className='btn btn-default navbar-btn' href='/logout'>Logout</a>
			);
		else
		return(
			<a className='btn btn-default navbar-btn' href='/auth/google_oauth2'>Sign In with Google</a>
			);
	}
})
