const APIUtil = {
  followUser: (id) => APIUtil.changeFollowStatus(id, "POST"),
  unfollowUser: (id) => APIUtil.changeFollowStatus(id, "DELETE"),

  changeFollowStatus: (id, method) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: "json",
      method,
    })
  ),
    searchUsers: (queryVal) =>(
        $.ajax({
            url:'/users/search',
            dataType: "json",
            method: "GET",
            data: {queryVal}
        })
    ),
};

module.exports=APIUtil;