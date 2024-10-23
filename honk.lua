-- Main loop
while true do
  -- Retrieve player information
  local playercar = ac.getCar(0)
  local sim = ac.getSim()

  -- Get track information
  local trackName = ac.getTrackName()
  local trackID = ac.getTrackFullID()

  -- Display information about the player's car
  print("Player Car:")
  print("  Position:", playercar.position)
  print("  Speed:", playercar.speedKmh)
  print("  Compass:", playercar.compass)

  -- Display information about other cars
  for i = 1, sim.carsCount - 1 do
    local car = ac.getCar(i)
    print("Car " .. i .. ":")
    print("  Position:", car.position)
    print("  Speed:", car.speedKmh)
    print("  Compass:", car.compass)
  end

  -- Display information about the track
  print("Track:")
  print("  Name:", trackName)
  print("  ID:", trackID)

  -- Get camera information
  local cameraPosition = ac.getCameraPosition()
  local cameraForward = ac.getCameraForward()

  -- Display camera information
  print("Camera:")
  print("  Position:", cameraPosition)
  print("  Forward:", cameraForward)

  -- Calculate compass angle of the camera's forward vector
  local cameraCompass = ac.getCompassAngle(cameraForward)

  -- Display camera compass
  print("  Compass:", cameraCompass)

  -- Add a delay to avoid running the loop too fast
  worker.wait(0.1) -- wait for 0.1 seconds before running the loop again
end
