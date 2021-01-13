# Generate random passwords and 
# assign the passwords to each of the user accounts

$users = @("user1", "user2", "user3", "user4", "user5")

ForEach ($user in $users){
    string newPW = Membership.GeneratePassword(14,0);
    $newPW = Regex.Replace(newPW, @"[^a-zA-Z0-9]", m => "9")

    Set-LocalUser -Name $user -Password $newPW
}
