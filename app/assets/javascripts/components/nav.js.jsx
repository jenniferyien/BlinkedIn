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
				<NavBar user={this.props.user} avatar={this.props.user_avatar}/>
			</nav>
		);
	}
});

var NavBar = React.createClass({
	render: function(){
		return(
			<div className="container-fluid">
					<Logo/>
				<div className="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<SearchForm/>
					<ul className="nav navbar-nav navbar-right">
						<UserStatus loggedIn={this.props.user} avataricon={this.props.avatar}/>
					</ul>
				</div>
			</div>
		);
	}
});

var Logo = React.createClass({
	render: function(){
		return(
			<div className='navbar-header col-md-8'>
				<div id='lefteye' className='eye'>
				</div>
				<div id='eye' className='eye'>
				</div>
				<a className="navbar-brand" href="/users">
					&#160;BLinkedIn
				</a>
				<button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span className="sr-only">Toggle navigation</span>
	        <span className="icon-bar"></span>
	        <span className="icon-bar"></span>
	        <span className="icon-bar"></span>
	      </button>
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
			<div>
			<li className="dropdown">
			<a href="#" id='avatar-link' className="dropdown-toggle" data-toggle="dropdown" role="button">
				<img id='avatar-icon' src={this.props.avataricon.avatar.profile.url} /></a>
				<ul className="dropdown-menu">
	            <li><a href="#">Homepage</a></li>
	            <li><a href="#">Profile</a></li>
	            <li><a className='btn btn-default navbar-btn' href='/logout'>Logout</a></li>
	      </ul>
			</li>
			</div>
			);
		else
		return(
			<li><a className='btn btn-default navbar-btn' href='/auth/google_oauth2'>Sign In with Google</a></li>
			);
	}
})
