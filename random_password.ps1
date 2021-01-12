# Generate random passwords for user accounts

# x = length of the password
# y = minimum number of special characters

$Password = ([System.Web.Security.Membership]::GeneratePassword(x,y))



# Assign randomly-generated passwords to user accounts

$users = @("user1", "user2", "user3", "user4", "user5")

ForEach ($user in $users){
}