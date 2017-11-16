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
  ),

  searchUsers: (query) => (
    $.ajax({
      url: '/users/search',
      dataType: 'json',
      method: 'GET',
      data: { query }
    })
  )
}

module.exports = APIUtil;
