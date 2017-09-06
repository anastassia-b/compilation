const APIUtil = {
  followUser: (id) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: 'json',
      method: 'POST'
    })
  ),

  unfollowUser: (id) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: 'json',
      method: 'DELETE'
    })
  )
}

module.exports = APIUtil;
