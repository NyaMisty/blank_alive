# Blank Alive

A small daemon to make your device Turn Off Screen AND Keep Active:

It can: 
- Keep iCloud clipboard keep synced
- Keep Network connected
- Keep App running
- Used As VNC server

## Usage

1. install `cycript`
2. copy `blankscreen` folder to /var/mobile/blankscreen
3. copy `misty.blankalive.plist` to /Library/LaunchDaemons

4. When you want to switch the blank state, SSH into your device and execute:
    - `~/blankscreen/blank.sh`: start blank & keepalive input
    - `~/blankscreen/unblank.sh`: stop blank & keepalive input
    **Besure use these things from SSH, as once device enters blank screen, you will not able to operate it through screen **

## Internal

1. Uses low level API to bypass all screen state notifications such as:
    - com.apple.springboard.hasBlankedScreen
    - com.apple.backboardd.backlight.changed
    - UIBacklightLevelChangedNotification
    - com.apple.iokit.hid.displayStatus
    - etc.
    
    ```
    [[[CAWindowServer server] displayWithDisplayId:1] setBlanked:1]
    ```

2. Simulate HID event (actually pressing Left Control keyboard) every 30s so that all daemon thinks your device is alive lively. I basically copied screendump's code :)

