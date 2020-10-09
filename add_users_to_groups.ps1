# Simple way to add a bulk of users to one or more groups/teams/organizations

$teams = @("group1", "group2", "group3")


ForEach ($team in $teams){
    Add-LocalGroupMember -Group $team -Member 'user1', 'user2', 'user3,', 'user4', 'user5'
}