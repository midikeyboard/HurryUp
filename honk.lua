-- Get the player's car and its index
local playerCar = getCarHandle(0)
local playerCarIndex = getCarId(playerCar)

function checkForAI(playerCarIndex)
  -- Get the car in front of the player
  local carInFront = getCarHandle(playerCarIndex + 1)
  local distanceAhead = 10
  -- Check if it's an AI car within 10 units
  if carInFront ~= nil and getCarClass(carInFront) == 0 and getDistanceBetweenCars(playerCar, carInFront) <= distanceAhead then
    return carInFront
  end

  return nil
end

-- Function to increase the speed of an AI car safely
function increaseAISpeed(carHandle, maxSpeed)
  -- Get the current speed of the AI car
  local currentSpeed = getCarSpeed(carHandle)

  -- Ensure the new speed doesn't exceed the maximum
  local newSpeed = math.min(currentSpeed + 20, maxSpeed)

  -- Set the new speed for the AI car
  setCarSpeed(carHandle, newSpeed)
end

-- Main loop to check for AI and increase their speed
local maxAISpeed = 120

function checkForHonk()
  return isKeyPressed(keys.HORN)
end

while true do
  -- Check for a honk
  if checkForHonk() then
    -- Check for an AI car in front
    local AI = checkForAI(playerCarIndex)
    if AI ~= nil then
      increaseAISpeed(AI, maxAISpeed) -- Adjust max speed as needed
    end
  end

  -- Wait for a short time before checking again
  wait(0.1)
end
