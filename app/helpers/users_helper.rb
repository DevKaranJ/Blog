module UsersHelper
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def display_age(user)
    "Age: #{Time.now.year - user.birthdate.year}"
  end
end
