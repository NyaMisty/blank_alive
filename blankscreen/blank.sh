echo '[[[CAWindowServer server] displayWithDisplayId:1] setBlanked:1]' | cycript -p backboardd
sudo launchctl load /Library/LaunchDaemons/misty.blankalive.plist
