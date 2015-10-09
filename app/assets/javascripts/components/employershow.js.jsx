var EProfile = React.createClass({
  render: function(){
     if (this.props.id){
       var editaccess = <a href={"/employers/"+this.props.id+"/edit"}>Edit</a>
     }
    return (
    <div>
      <div className="col-md-4 panel panel-default profile">
        <img src={this.props.avatar.avatar.url} />

        <h4 >{this.props.company} <small><small>{editaccess}</small></small></h4>
      </div>
      <div className='col-md-8'>
          <div className= 'panel panel-info'>
              <p className='panel-heading'><strong>Company Type:</strong></p>
              <p className='panel-body'>{this.props.type}</p>
              <p className='panel-heading'><strong>Website:</strong></p>
              <p className='panel-body'>{this.props.website} </p>
              <p className='panel-heading'><strong>Company Location:</strong></p>
              <p className='panel-body'>{this.props.location.city}, {this.props.location.state}</p>
              <p className='panel-heading'><strong>Description:</strong></p>
              <p className='panel-body'> {this.props.description} </p>
          </div>

      </div>
      <div className='col-md-4'>
        <p><strong>Looking for skills:</strong></p>
      </div>
    </div>
    )
  }
});
