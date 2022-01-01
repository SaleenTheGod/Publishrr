
# --- Functions ---
function fetch_arr_apikey ([string]$app)
{   
    return $(Select-Xml -Path ./config/$app/config.xml -XPath /Config/ApiKey | ForEach-Object { $_.Node.InnerXML })
}

function fetch_overseerr_apikey ([string]$OVERSEERR_CONF_FILE)
{   
    $OVERSEER_JSON_OBJ = $(Get-Content -Path $OVERSEERR_CONF_FILE | ConvertFrom-Json)
    return $($OVERSEER_JSON_OBJ.main.apiKey)
}

$SONARR_APIKEY = fetch_arr_apikey("sonarr")
$LIDARR_APIKEY = fetch_arr_apikey("lidarr")
$RADARR_APIKEY = fetch_arr_apikey("radarr")
$PROWLARR_APIKEY = fetch_arr_apikey("prowlarr")

# ---- Sonarr Section ----
Write-Output "Beginning Sonarr Configuration."
./scripts/helpers/sonarr-handler.ps1

# ---- Lidarr Section ----
Write-Output "Beginning Lidarr Configuration."
./scripts/helpers/lidarr-handler.ps1

# ---- Radarr Section ----
Write-Output "Beginning Radarr Configuration."
./scripts/helpers/radarr-handler.ps1

# ---- NZBGet Section ----
Write-Output "Beginning NZBGet Configuration."
./scripts/helpers/nzbget-handler.ps1

# ---- Overseerr Section ----
Write-Output "Beginning Overseerr Configuration."
./scripts/helpers/overseerr-handler.ps1 -RADARR_APIKEY $RADARR_APIKEY -SONARR_APIKEY $SONARR_APIKEY
$OVERSEER_API_KEY = fetch_overseerr_apikey("config\overseerr\settings.json")


Write-Output "Congrats! Your Environment is currently online!   `
Sonarr: http://localhost:8989                                   `
Sonarr API Key: $SONARR_APIKEY                                  `
Radarr: http://localhost:7878                                   `
Radarr API Key: $RADARR_APIKEY                                  `
Lidarr: http://localhost:8686                                   `
Lidarr API Key: $LIDARR_APIKEY                                  `
Prowlarr: http://localhost:9696                                 `
Prowlarr API Key: $PROWLARR_APIKEY                              `
NZBget: http://localhost:6789                                   `
Overseerr: http://localhost:5055                                `
Overseerr API Key: $OVERSEER_API_KEY                            `
NZBget User/Pass: nzbget/tegbzn6789"  | Tee-Object -FilePath ClusterInfo.txt
