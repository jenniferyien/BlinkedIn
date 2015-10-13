$(function(){

$(".chosen-select").chosen({
  allow_single_deselect: true,
  no_results_text: 'No results matched',
  width: '100%'
});

$('button.skill').click( function(event) {
  var skillId = event.currentTarget.dataset.skill;
  var alumniId = event.currentTarget.dataset.alumni;
  var userId = event.currentTarget.dataset.user;
  $.ajax({
    method: 'POST',
    url: '/endorsements',
    data: {
      endorsement: {
        user_id: userId,
        alumni_id: alumniId,
        skill_id: skillId
      }
    },
    // success never triggers in ajax, even though database is updated.
    // not sure why, it returns a 500 Internal Server Error no matter what.
    success: function(data, status, xhr) {
      var actual_count = parseInt( $("#skill"+skillId).text() );
      $("#skill"+skillId).text(actual_count+1);
    },
    error: function(xhr, status, error) {
      console.log(error);
      // this is a temporary compromise:
      // the number will go up when you click it no matter what, with a '?'
      var actual_count = parseInt( $("#skill"+skillId).text() );
      $("#skill"+skillId).text((actual_count+1)+"?");
    }
  });
});

});
