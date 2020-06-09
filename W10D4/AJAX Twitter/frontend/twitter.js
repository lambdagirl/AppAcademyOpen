const FollowToggle = require("./follow_toggle");

$(function(){
    $('button.follow-toggle').each((i,btn) => new FollowToggle(btn,{}) );
});