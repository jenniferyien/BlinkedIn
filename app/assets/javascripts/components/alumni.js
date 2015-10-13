$(function(){

$(".chosen-select").chosen({
  allow_single_deselect: true,
  no_results_text: 'No results matched',
  width: '100%'
});

$('button.skill').each( function(i,element) {
  var skillId = element.dataset.skill;
  var alumniId = element.dataset.alumni;
  $.ajax({
      url: '/alumnis/'+alumniId+'.json',
      method: 'GET',
      success: function(data, status, xhr) {
          var endorsementCount = data.endorsements.filter( function(endorsement) { return endorsement.skill_id == skillId }).length;
          $("#skill"+skillId).text(endorsementCount);
      },
      error: function(xhr, status, error) {
          console.log("Nope!", error);
      }
  });
})

$('button.skill').click( function(event) {
  event.preventDefault();
  var skillId = event.currentTarget.dataset.skill;
  var alumniId = event.currentTarget.dataset.alumni;
  var userId = event.currentTarget.dataset.user;
  $.ajax({
    url: '/endorsements',
    method: 'POST',
    data: {
      endorsement: {
        user_id: userId,
        alumni_id: alumniId,
        skill_id: skillId
      }
    },
    success: function(data, status, xhr) {
      console.log(data);
    },
    error: function(xhr, status, error) {
      console.log(error);
    }
  });
});
    // $.ajax({
    //     url: '/alumnis/'+alumniId+'.json',
    //     method: 'GET',
    //     success: function(data, status, xhr) {
    //         var endorsementCount = data.endorsements.filter( function(endorsement) { return endorsement.skill_id == skillId }).length;
    //         $("#skill"+skillId).text(endorsementCount);
    //     },
    //     error: function(xhr, status, error) {
    //         console.log("Nope!", error);
    //     }
    // });


});
