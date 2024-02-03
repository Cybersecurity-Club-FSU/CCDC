# Define the list of users to keep
$usersToKeep = "elara.boss", "sarah.lee", "lisa.brown", "michael.davis", "emily.chen", "tom.harris", "bob.johnson", "david.kim", "rachel.patel", "dave.grohl", "kate.skye", "leo.zenith", "jack.rover", "lucy.nova", "xavier.blackhole", "ophelia.redding", "marcus.atlas", "yara.nebula", "parker.posey", "maya.star", "zachary.comet", "quinn.jovi", "nina.eclipse", "alice.bowie", "ruby.rose", "owen.mars", "bob.dylan", "samantha.stephens", "parker.jupiter", "carol.rivers", "taurus.tucker", "rachel.venus", "emily.waters", "una.veda", "ruby.starlight", "frank.zappa", "ava.stardust", "samantha.aurora", "grace.slick", "benny.spacey", "sophia.constellation", "harry.potter", "celine.cosmos", "tessa.nova", "ivy.lee", "dave.marsden", "thomas.spacestation", "kate.bush", "emma.nova", "una.moonbase", "luna.lovegood", "frank.astro", "victor.meteor", "mars.patel", "grace.luna", "wendy.starship", "neptune.williams", "henry.orbit", "ivy.starling"

# Specify the path to the log file
$logFile = "C:\path\to\your\log.txt"

# Get all local users and filter out those who are not in the $usersToKeep list
Get-LocalUser | Where-Object { $usersToKeep -notcontains $_.Name } | ForEach-Object {
    # Append information about the user to the log file
    Add-Content -Path $logFile -Value "Deleting user: $_"

    # Delete the user
    Remove-LocalUser $_
}