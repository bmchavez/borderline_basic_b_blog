def show?
  user_is_owner_or_admin?
end

private

def user_is_owner_or_admin?
  record.user == user || user.try(:admin?)
end