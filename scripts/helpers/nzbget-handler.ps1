$ProgressPreference = "SilentlyContinue"
function fetch_arr_apikey ([string]$app)
{
    return $(Select-Xml -Path ./config/$app/config.xml -XPath /Config/ApiKey | ForEach-Object { $_.Node.InnerXML })
}

$PROWLARR_APIKEY = fetch_arr_apikey("prowlarr")

function add_nzbget_to_prowlarr()
{
    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "application/json")
    
    $body = "{
    `n    `"enable`": true,
    `n    `"protocol`": `"usenet`",
    `n    `"priority`": 1,
    `n    `"name`": `"nzbget`",
    `n    `"fields`": [
    `n        {
    `n            `"order`": 0,
    `n            `"name`": `"host`",
    `n            `"label`": `"Host`",
    `n            `"value`": `"nzbget`",
    `n            `"type`": `"textbox`",
    `n            `"advanced`": false
    `n        },
    `n        {
    `n            `"order`": 1,
    `n            `"name`": `"port`",
    `n            `"label`": `"Port`",
    `n            `"value`": 6789,
    `n            `"type`": `"textbox`",
    `n            `"advanced`": false
    `n        },
    `n        {
    `n            `"order`": 2,
    `n            `"name`": `"useSsl`",
    `n            `"label`": `"Use SSL`",
    `n            `"helpText`": `"Use secure connection when connecting to NZBGet`",
    `n            `"value`": false,
    `n            `"type`": `"checkbox`",
    `n            `"advanced`": false
    `n        },
    `n        {
    `n            `"order`": 3,
    `n            `"name`": `"urlBase`",
    `n            `"label`": `"Url Base`",
    `n            `"helpText`": `"Adds a prefix to the NZBGet url, e.g. http://[host]:[port]/[urlBase]/jsonrpc`",
    `n            `"type`": `"textbox`",
    `n            `"advanced`": true
    `n        },
    `n        {
    `n            `"order`": 4,
    `n            `"name`": `"username`",
    `n            `"label`": `"Username`",
    `n            `"value`": `"nzbget`",
    `n            `"type`": `"textbox`",
    `n            `"advanced`": false
    `n        },
    `n        {
    `n            `"order`": 5,
    `n            `"name`": `"password`",
    `n            `"label`": `"Password`",
    `n            `"value`": `"tegbzn6789`",
    `n            `"type`": `"password`",
    `n            `"advanced`": false
    `n        },
    `n        {
    `n            `"order`": 6,
    `n            `"name`": `"category`",
    `n            `"label`": `"Category`",
    `n            `"helpText`": `"Adding a category specific to Prowlarr avoids conflicts with unrelated downloads, but it's optional`",
    `n            `"value`": `"`",
    `n            `"type`": `"textbox`",
    `n            `"advanced`": false
    `n        },
    `n        {
    `n            `"order`": 7,
    `n            `"name`": `"priority`",
    `n            `"label`": `"Priority`",
    `n            `"helpText`": `"Priority for items added from Prowlarr`",
    `n            `"value`": 0,
    `n            `"type`": `"select`",
    `n            `"advanced`": false,
    `n            `"selectOptions`": [
    `n                {
    `n                    `"value`": -100,
    `n                    `"name`": `"VeryLow`",
    `n                    `"order`": -100,
    `n                    `"hint`": `"(-100)`"
    `n                },
    `n                {
    `n                    `"value`": -50,
    `n                    `"name`": `"Low`",
    `n                    `"order`": -50,
    `n                    `"hint`": `"(-50)`"
    `n                },
    `n                {
    `n                    `"value`": 0,
    `n                    `"name`": `"Normal`",
    `n                    `"order`": 0,
    `n                    `"hint`": `"(0)`"
    `n                },
    `n                {
    `n                    `"value`": 50,
    `n                    `"name`": `"High`",
    `n                    `"order`": 50,
    `n                    `"hint`": `"(50)`"
    `n                },
    `n                {
    `n                    `"value`": 100,
    `n                    `"name`": `"VeryHigh`",
    `n                    `"order`": 100,
    `n                    `"hint`": `"(100)`"
    `n                },
    `n                {
    `n                    `"value`": 900,
    `n                    `"name`": `"Force`",
    `n                    `"order`": 900,
    `n                    `"hint`": `"(900)`"
    `n                }
    `n            ]
    `n        },
    `n        {
    `n            `"order`": 8,
    `n            `"name`": `"addPaused`",
    `n            `"label`": `"Add Paused`",
    `n            `"helpText`": `"This option requires at least NZBGet version 16.0`",
    `n            `"value`": false,
    `n            `"type`": `"checkbox`",
    `n            `"advanced`": false
    `n        }
    `n    ],
    `n    `"implementationName`": `"NZBGet`",
    `n    `"implementation`": `"Nzbget`",
    `n    `"configContract`": `"NzbgetSettings`",
    `n    `"infoLink`": `"https://wiki.servarr.com/prowlarr/supported#nzbget`",
    `n    `"tags`": [],
    `n    `"id`": 0
    `n}"
    
    $response = Invoke-RestMethod "http://localhost:9696/api/v1/downloadclient?apikey=$PROWLARR_APIKEY" -Method 'POST' -Headers $headers -Body $body | Out-Null
    $response | ConvertTo-Json
}

Write-Host "Adding NZBGet to Prowlarr..."
add_nzbget_to_prowlarr

Write-Host "Section Complete!"