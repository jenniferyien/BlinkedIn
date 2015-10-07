var MainDiv = React.createClass({
	componentDidMount: function(){
			function open(){
				$('#lefteye').attr('class',"lefteye");
				$('#lefteye').removeClass("lefteyeclose");
			};
			function close(){
				$('#lefteye').removeClass("lefteye");
				$('#lefteye').attr('class',"lefteyeclose");
			};
			setInterval(open, 1000);
			setInterval(close, 1600);
	},
	render: function(){
		return(
			<nav className="navbar navbar-inverse">
				<NavBar user={this.props.user}/>
			</nav>
		);
	}
});

var NavBar = React.createClass({
	render: function(){
		return(
			<div className="container-fluid">
					<Logo/>
				<div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

						<ul className="nav navbar-nav navbar-right">
							<UserStatus loggedIn={this.props.user}/>
						</ul>
						<SearchForm/>
				</div>
			</div>
		);
	}
});

var Logo = React.createClass({
	render: function(){
		return(
			<div className='navbar-header col-md-8'>
				<button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span className="sr-only">Toggle navigation</span>
					<span className="icon-bar"></span>
					<span className="icon-bar"></span>
					<span className="icon-bar"></span>
				</button>

				<a className="navbar-brand" href="/users">
					<div className='col-md-4'>
						<div id='lefteye' className='eye'>
						</div>
					</div>
					<div className='col-md-4'>
						BLinkedIn
					</div>
				</a>
			</div>
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
				<button type="submit" id='search' className="btn btn-default glyphicon glyphicon-search"></button>
			</form>
		);
	}
});

var UserStatus = React.createClass({
	render: function(){
		if (this.props.loggedIn)
		return (

	      <li><a className='btn btn-default navbar-btn' href='/logout'>Logout</a></li>

			);
		else
		return(
			<li><a className='btn btn-default navbar-btn' href='/auth/google_oauth2'>Sign In with Google</a></li>
			);
	}
})
