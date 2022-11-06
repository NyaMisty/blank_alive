extern "C" id IOHIDEventSystemClientCreate(id);
extern "C" id IOHIDEventCreateKeyboardEvent(id allocator, uint64_t timeStamp, uint16_t usagePage, uint16_t usage, int down, int flags);
extern "C" void IOHIDEventSetSenderID(id event, uint64_t sender);
extern "C" void IOHIDEventSystemClientDispatchEvent(id client, id event);
extern "C" uint64_t mach_absolute_time();
extern "C" void sleep(int);

kHIDPage_KeyboardOrKeypad = 7;
kHIDUsage_KeyboardLeftControl = 0xE0;

client_ = IOHIDEventSystemClientCreate(kCFAllocatorDefault);

function sendKeyEvt(k, down) {
    event = IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, mach_absolute_time(), kHIDPage_KeyboardOrKeypad, k, down, 0)
    IOHIDEventSetSenderID(event, 0x8000000817319372);
    IOHIDEventSystemClientDispatchEvent(client_, event);
    CFRelease(event);
}

sendKeyEvt(kHIDUsage_KeyboardLeftControl, true);
sleep(1);
sendKeyEvt(kHIDUsage_KeyboardLeftControl, false);
