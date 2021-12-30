$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$body = "{
`n    `"syncLevel`": `"fullSync`",
`n    `"name`": `"Radarr`",
`n    `"fields`": [
`n        {
`n            `"order`": 0,
`n            `"name`": `"prowlarrUrl`",
`n            `"label`": `"Prowlarr Server`",
`n            `"helpText`": `"Prowlarr server URL as Radarr sees it, including http(s)://, port, and urlbase if needed`",
`n            `"value`": `"http://prowlarr:9696`",
`n            `"type`": `"textbox`",
`n            `"advanced`": false,
`n            `"placeholder`": `"http://localhost:9696`"
`n        },
`n        {
`n            `"order`": 1,
`n            `"name`": `"baseUrl`",
`n            `"label`": `"Radarr Server`",
`n            `"helpText`": `"URL used to connect to Radarr server, including http(s)://, port, and urlbase if required`",
`n            `"value`": `"http://radarr:7878`",
`n            `"type`": `"textbox`",
`n            `"advanced`": false,
`n            `"placeholder`": `"http://localhost:7878`"
`n        },
`n        {
`n            `"order`": 2,
`n            `"name`": `"apiKey`",
`n            `"label`": `"ApiKey`",
`n            `"helpText`": `"The ApiKey generated by Radarr in Settings/General`",
`n            `"value`": `"41ed3f928b8341aa958ba0606c26a867`",
`n            `"type`": `"textbox`",
`n            `"advanced`": false
`n        },
`n        {
`n            `"order`": 3,
`n            `"name`": `"syncCategories`",
`n            `"label`": `"Sync Categories`",
`n            `"helpText`": `"Only Indexers that support these categories will be synced`",
`n            `"value`": [
`n                2000,
`n                2010,
`n                2020,
`n                2030,
`n                2040,
`n                2045,
`n                2050,
`n                2060,
`n                2070,
`n                2080
`n            ],
`n            `"type`": `"select`",
`n            `"advanced`": true,
`n            `"selectOptions`": [
`n                {
`n                    `"value`": 0,
`n                    `"name`": `"Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(0)`"
`n                },
`n                {
`n                    `"value`": 10,
`n                    `"name`": `"Other/Misc`",
`n                    `"order`": 0,
`n                    `"hint`": `"(10)`",
`n                    `"parentValue`": 0
`n                },
`n                {
`n                    `"value`": 20,
`n                    `"name`": `"Other/Hashed`",
`n                    `"order`": 0,
`n                    `"hint`": `"(20)`",
`n                    `"parentValue`": 0
`n                },
`n                {
`n                    `"value`": 1000,
`n                    `"name`": `"Console`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1000)`"
`n                },
`n                {
`n                    `"value`": 1010,
`n                    `"name`": `"Console/NDS`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1010)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1020,
`n                    `"name`": `"Console/PSP`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1020)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1030,
`n                    `"name`": `"Console/Wii`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1030)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1040,
`n                    `"name`": `"Console/XBox`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1040)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1050,
`n                    `"name`": `"Console/XBox 360`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1050)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1060,
`n                    `"name`": `"Console/Wiiware`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1060)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1070,
`n                    `"name`": `"Console/XBox 360 DLC`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1070)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1080,
`n                    `"name`": `"Console/PS3`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1080)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1090,
`n                    `"name`": `"Console/Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1090)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1110,
`n                    `"name`": `"Console/3DS`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1110)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1120,
`n                    `"name`": `"Console/PS Vita`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1120)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1130,
`n                    `"name`": `"Console/WiiU`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1130)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1140,
`n                    `"name`": `"Console/XBox One`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1140)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 1180,
`n                    `"name`": `"Console/PS4`",
`n                    `"order`": 0,
`n                    `"hint`": `"(1180)`",
`n                    `"parentValue`": 1000
`n                },
`n                {
`n                    `"value`": 2000,
`n                    `"name`": `"Movies`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2000)`"
`n                },
`n                {
`n                    `"value`": 2010,
`n                    `"name`": `"Movies/Foreign`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2010)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 2020,
`n                    `"name`": `"Movies/Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2020)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 2030,
`n                    `"name`": `"Movies/SD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2030)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 2040,
`n                    `"name`": `"Movies/HD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2040)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 2045,
`n                    `"name`": `"Movies/UHD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2045)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 2050,
`n                    `"name`": `"Movies/BluRay`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2050)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 2060,
`n                    `"name`": `"Movies/3D`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2060)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 2070,
`n                    `"name`": `"Movies/DVD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2070)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 2080,
`n                    `"name`": `"Movies/WEB-DL`",
`n                    `"order`": 0,
`n                    `"hint`": `"(2080)`",
`n                    `"parentValue`": 2000
`n                },
`n                {
`n                    `"value`": 3000,
`n                    `"name`": `"Audio`",
`n                    `"order`": 0,
`n                    `"hint`": `"(3000)`"
`n                },
`n                {
`n                    `"value`": 3010,
`n                    `"name`": `"Audio/MP3`",
`n                    `"order`": 0,
`n                    `"hint`": `"(3010)`",
`n                    `"parentValue`": 3000
`n                },
`n                {
`n                    `"value`": 3020,
`n                    `"name`": `"Audio/Video`",
`n                    `"order`": 0,
`n                    `"hint`": `"(3020)`",
`n                    `"parentValue`": 3000
`n                },
`n                {
`n                    `"value`": 3030,
`n                    `"name`": `"Audio/Audiobook`",
`n                    `"order`": 0,
`n                    `"hint`": `"(3030)`",
`n                    `"parentValue`": 3000
`n                },
`n                {
`n                    `"value`": 3040,
`n                    `"name`": `"Audio/Lossless`",
`n                    `"order`": 0,
`n                    `"hint`": `"(3040)`",
`n                    `"parentValue`": 3000
`n                },
`n                {
`n                    `"value`": 3050,
`n                    `"name`": `"Audio/Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(3050)`",
`n                    `"parentValue`": 3000
`n                },
`n                {
`n                    `"value`": 3060,
`n                    `"name`": `"Audio/Foreign`",
`n                    `"order`": 0,
`n                    `"hint`": `"(3060)`",
`n                    `"parentValue`": 3000
`n                },
`n                {
`n                    `"value`": 4000,
`n                    `"name`": `"PC`",
`n                    `"order`": 0,
`n                    `"hint`": `"(4000)`"
`n                },
`n                {
`n                    `"value`": 4010,
`n                    `"name`": `"PC/0day`",
`n                    `"order`": 0,
`n                    `"hint`": `"(4010)`",
`n                    `"parentValue`": 4000
`n                },
`n                {
`n                    `"value`": 4020,
`n                    `"name`": `"PC/ISO`",
`n                    `"order`": 0,
`n                    `"hint`": `"(4020)`",
`n                    `"parentValue`": 4000
`n                },
`n                {
`n                    `"value`": 4030,
`n                    `"name`": `"PC/Mac`",
`n                    `"order`": 0,
`n                    `"hint`": `"(4030)`",
`n                    `"parentValue`": 4000
`n                },
`n                {
`n                    `"value`": 4040,
`n                    `"name`": `"PC/Mobile-Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(4040)`",
`n                    `"parentValue`": 4000
`n                },
`n                {
`n                    `"value`": 4050,
`n                    `"name`": `"PC/Games`",
`n                    `"order`": 0,
`n                    `"hint`": `"(4050)`",
`n                    `"parentValue`": 4000
`n                },
`n                {
`n                    `"value`": 4060,
`n                    `"name`": `"PC/Mobile-iOS`",
`n                    `"order`": 0,
`n                    `"hint`": `"(4060)`",
`n                    `"parentValue`": 4000
`n                },
`n                {
`n                    `"value`": 4070,
`n                    `"name`": `"PC/Mobile-Android`",
`n                    `"order`": 0,
`n                    `"hint`": `"(4070)`",
`n                    `"parentValue`": 4000
`n                },
`n                {
`n                    `"value`": 5000,
`n                    `"name`": `"TV`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5000)`"
`n                },
`n                {
`n                    `"value`": 5010,
`n                    `"name`": `"TV/WEB-DL`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5010)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 5020,
`n                    `"name`": `"TV/Foreign`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5020)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 5030,
`n                    `"name`": `"TV/SD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5030)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 5040,
`n                    `"name`": `"TV/HD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5040)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 5045,
`n                    `"name`": `"TV/UHD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5045)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 5050,
`n                    `"name`": `"TV/Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5050)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 5060,
`n                    `"name`": `"TV/Sport`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5060)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 5070,
`n                    `"name`": `"TV/Anime`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5070)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 5080,
`n                    `"name`": `"TV/Documentary`",
`n                    `"order`": 0,
`n                    `"hint`": `"(5080)`",
`n                    `"parentValue`": 5000
`n                },
`n                {
`n                    `"value`": 6000,
`n                    `"name`": `"XXX`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6000)`"
`n                },
`n                {
`n                    `"value`": 6010,
`n                    `"name`": `"XXX/DVD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6010)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6020,
`n                    `"name`": `"XXX/WMV`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6020)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6030,
`n                    `"name`": `"XXX/XviD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6030)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6040,
`n                    `"name`": `"XXX/x264`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6040)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6045,
`n                    `"name`": `"XXX/UHD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6045)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6050,
`n                    `"name`": `"XXX/Pack`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6050)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6060,
`n                    `"name`": `"XXX/ImageSet`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6060)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6070,
`n                    `"name`": `"XXX/Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6070)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6080,
`n                    `"name`": `"XXX/SD`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6080)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 6090,
`n                    `"name`": `"XXX/WEB-DL`",
`n                    `"order`": 0,
`n                    `"hint`": `"(6090)`",
`n                    `"parentValue`": 6000
`n                },
`n                {
`n                    `"value`": 7000,
`n                    `"name`": `"Books`",
`n                    `"order`": 0,
`n                    `"hint`": `"(7000)`"
`n                },
`n                {
`n                    `"value`": 7010,
`n                    `"name`": `"Books/Mags`",
`n                    `"order`": 0,
`n                    `"hint`": `"(7010)`",
`n                    `"parentValue`": 7000
`n                },
`n                {
`n                    `"value`": 7020,
`n                    `"name`": `"Books/EBook`",
`n                    `"order`": 0,
`n                    `"hint`": `"(7020)`",
`n                    `"parentValue`": 7000
`n                },
`n                {
`n                    `"value`": 7030,
`n                    `"name`": `"Books/Comics`",
`n                    `"order`": 0,
`n                    `"hint`": `"(7030)`",
`n                    `"parentValue`": 7000
`n                },
`n                {
`n                    `"value`": 7040,
`n                    `"name`": `"Books/Technical`",
`n                    `"order`": 0,
`n                    `"hint`": `"(7040)`",
`n                    `"parentValue`": 7000
`n                },
`n                {
`n                    `"value`": 7050,
`n                    `"name`": `"Books/Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(7050)`",
`n                    `"parentValue`": 7000
`n                },
`n                {
`n                    `"value`": 7060,
`n                    `"name`": `"Books/Foreign`",
`n                    `"order`": 0,
`n                    `"hint`": `"(7060)`",
`n                    `"parentValue`": 7000
`n                },
`n                {
`n                    `"value`": 8000,
`n                    `"name`": `"Other`",
`n                    `"order`": 0,
`n                    `"hint`": `"(8000)`"
`n                },
`n                {
`n                    `"value`": 8010,
`n                    `"name`": `"Other/Misc`",
`n                    `"order`": 0,
`n                    `"hint`": `"(8010)`",
`n                    `"parentValue`": 8000
`n                },
`n                {
`n                    `"value`": 8020,
`n                    `"name`": `"Other/Hashed`",
`n                    `"order`": 0,
`n                    `"hint`": `"(8020)`",
`n                    `"parentValue`": 8000
`n                }
`n            ]
`n        }
`n    ],
`n    `"implementationName`": `"Radarr`",
`n    `"implementation`": `"Radarr`",
`n    `"configContract`": `"RadarrSettings`",
`n    `"infoLink`": `"https://wiki.servarr.com/prowlarr/supported#radarr`",
`n    `"tags`": [],
`n    `"id`": 0
`n}"

$response = Invoke-RestMethod 'http://localhost:9696/api/v1/applications?apikey=6099fda2553d49bcbbf18a313aa42f3a' -Method 'POST' -Headers $headers -Body $body
$response | ConvertTo-Json