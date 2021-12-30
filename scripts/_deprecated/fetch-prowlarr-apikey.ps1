$PROWLARR_API_KEY = ConvertTo-SecureString "$(Select-Xml -Path C:\Users\jjambrose1s\Documents\git-projects\Publishrr\config\prowlarr\config.xml -XPath /Config/ApiKey | ForEach-Object { $_.Node.InnerXML })" -AsPlainText -Force
$StandardString = ConvertFrom-SecureString $PROWLARR_API_KEY -AsPlainText
echo $StandardString