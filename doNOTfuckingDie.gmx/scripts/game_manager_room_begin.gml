/// dt_roomstart()
dt_roomstart();

/// spawn console, detector
if enable_console
    instance_create(0, 0, objConsole);
if enable_detector
    instance_create(0, 0, objDetector);

//print("room "+room_get_name(room)+" started");
