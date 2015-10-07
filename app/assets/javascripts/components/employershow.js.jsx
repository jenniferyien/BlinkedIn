var EProfile = React.createClass({
  render: function(){
     if (this.props.id){
       var editaccess = <a href={"/employers/"+this.props.id+"/edit"}>Edit</a>
     }
    return (
    <div>
      <div className="page-header">
        <h1> <img src={this.props.avatar.avatar.profile.url} /> {this.props.company} <small><small>{editaccess}</small></small></h1>
      </div>
      <div className='col-md-8'>
        <p><strong>Company Type:</strong> {this.props.type}</p>
        <p><strong>Website:</strong> {this.props.website} </p>
        <p><strong>Company Location:</strong> {this.props.location.city}, {this.props.location.state}</p>
        <p><strong>Description:</strong> {this.props.description} </p>
      </div>
      <div className='col-md-4'>
        <p><strong>Looking for skills:</strong></p>
      </div>
    </div>
    )
  }
});
