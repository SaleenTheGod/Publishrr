[cmdletbinding()]
Param(
    [parameter(Mandatory = $true)] [string]$RADARR_APIKEY,
    [parameter(Mandatory = $true)] [string]$SONARR_APIKEY,
    [ValidateSet("SilentlyContinue","Continue")] [string]$DebugPreference = "SilentlyContinue"
)
BEGIN {

}
PROCESS {

# ----- Script Variables -----
$OVERSEERR_CONF_FILE = "config\overseerr\settings.json"


# ----- End Script Variables -----


Write-Output "Stopping Overseerr container..."
docker stop overseerr

$OVERSEER_JSON_OBJ = $(Get-Content -Path $OVERSEERR_CONF_FILE | ConvertFrom-Json)

# BELOW DOESNT WORK RIGHT NOW...
# https://stackoverflow.com/questions/14891044/hashtables-and-key-order/29551540
# $radarrArray = @{
#     name                = "radarr"
#     hostname            = "radarr"
#     port                = "7878"
#     apiKey              = "$RADARR_APIKEY"
#     useSsl              = "false"
#     baseUrl             = ""
#     activeProfileId     = "1"
#     activeProfileName   = "Any"
#     activeDirectory     = "/movies"
#     is4k                = "False"
#     minimumAvailability = "released"
#     tags                = @()
#     isDefault           = "True"
#     syncEnabled         = "True"
#     preventSearch       = "False"
#     id                  = 0
# }

$arrayOfRadarrKeys = @("name", "hostname", "port", "apiKey", "useSsl", "baseUrl", "activeProfileId", "activeProfileName", "activeDirectory", "is4k", "minimumAvailability", "tags", "isDefault", "syncEnabled", "preventSearch", "id")
$arrayOfRadarrValues = @("radarr", "radarr", "7878", "$RADARR_APIKEY", "False", "", 1, "Any", "/movies", "False", "released", @(), "True", "True", "False", 0)

$radarrArray = New-Object System.Collections.Specialized.OrderedDictionary

for ($arrayIterator=0; $arrayIterator -lt $arrayOfRadarrKeys.length; $arrayIterator++) {
	$radarrArray.Add($arrayOfRadarrKeys[$arrayIterator], $arrayOfRadarrValues[$arrayIterator])
}

$radarrArray = @{name="radarr"; hostname="radarr"; port="7878"; apiKey=$RADARR_APIKEY; useSsl="False"; baseUrl=""; activeProfileId=1; activeProfileName="Any"; activeDirectory="/movies"; is4k="False"; minimumAvailability="released"; tags=@(); isDefault="True"; syncEnabled="True"; preventSearch="False"; id=0}

$radarrArrayParent = @($radarrArray)

$OVERSEER_JSON_OBJ | Add-Member -MemberType NoteProperty -Name "radarr" -Value $radarrArrayParent -Force -PassThru

# BELOW DOESNT WORK RIGHT NOW...
# https://stackoverflow.com/questions/14891044/hashtables-and-key-order/29551540
# $sonarrArray = @{
#     name                         = "sonarr"
#     hostname                     = "sonarr"
#     port                         = "8989"
#     apiKey                       = "$SONARR_APIKEY"
#     useSsl                       = "False"
#     baseUrl                      = ""
#     activeProfileId              = "1"
#     activeLanguageProfileId      = "1"
#     activeProfileName            = "Any"
#     activeDirectory              = "/tv"
#     activeAnimeProfileId         = "1"
#     activeAnimeLanguageProfileId = "1"
#     activeAnimeProfileName       = "Any"
#     activeAnimeDirectory         = "/anime"
#     tags                         = @()
#     animeTags                    = @()
#     is4k                         = "False"
#     isDefault                    = "True"
#     enableSeasonFolders          = "True"
#     syncEnabled                  = "True"
#     preventSearch                = "False"
#     id                           = "0"
# }

$arrayOfSonarrKeys = @("name", "hostname", "port", "apiKey", "useSsl", "baseUrl", "activeProfileId", "activeLanguageProfileId", "activeProfileName", "activeDirectory", "activeAnimeProfileId", "activeAnimeLanguageProfileId", "activeAnimeProfileName", "activeAnimeDirectory", "tags", "animeTags", "is4k", "isDefault", "enableSeasonFolders", "syncEnabled", "preventSearch", "id")
$arrayOfSonarrValues = @("sonarr", "sonarr", "8989", "$SONARR_APIKEY", "False", "", 1, 1, "Any", "/tv", 1, 1, "Any", "/anime", @(), @(), "False", "True", "True", "True", "False", 0)

$sonarrArray = New-Object System.Collections.Specialized.OrderedDictionary

for ($arrayIterator=0; $arrayIterator -lt $arrayOfSonarrKeys.length; $arrayIterator++) {
	$sonarrArray.Add($arrayOfSonarrKeys[$arrayIterator], $arrayOfSonarrValues[$arrayIterator])
}

$sonarrArrayParent = @($sonarrArray)

$OVERSEER_JSON_OBJ | Add-Member -MemberType NoteProperty -Name "sonarr" -Value $sonarrArrayParent -Force -PassThru

$OVERSEER_JSON_OBJ | ConvertTo-Json | Out-File $OVERSEERR_CONF_FILE

Write-Output "Starting Overseerr container..."
docker start overseerr
}