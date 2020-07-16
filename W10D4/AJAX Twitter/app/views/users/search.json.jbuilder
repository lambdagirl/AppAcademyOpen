json.array!(@users) do |user|
    json.(user,*user.column_names)
    json.followed(current_user.follows(user))
end