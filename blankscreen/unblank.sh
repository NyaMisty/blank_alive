echo '[[[CAWindowServer server] displayWithDisplayId:1] setBlanked:0]' | cycript -p backboardd
sudo launchctl unload /Library/LaunchDaemons/misty.blankalive.plist
