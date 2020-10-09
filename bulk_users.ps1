Import-Csv .\List_Users.csv | ForEach-Object {

    # Check if the user already exists
    if (!(Get-LocalUser -Name $($_.user))) {
        # Create new accounts with the information from the csv file
        New-LocalUser -Name $_.user -Password ($_.password | ConvertTo-SecureString -AsPlainText -Force) -FullName $_.fullname -Description $_.team

        # Making users change their passwords on the next log-in
        net user $_.user /logonpasswordchg:yes


        # Check if the team already exists
        $team_name = $_.team

            if(!(Get-LocalGroup -Name $team_name)){
                
                # Create a new team that the new users can belong
                New-LocalGroup -Name $team_name -Description "$($_.team)"
            }
            else {
                # Add users into the existing team
                Add-LocalGroupMember -Group $team_name -Member $_.user
            }

    }
}