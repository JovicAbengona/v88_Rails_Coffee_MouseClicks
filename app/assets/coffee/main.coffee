name = ""

while name == null || name == ""
    name = prompt("Please enter your name:");

danger_zones = []
events = document.querySelector(".events")
canvas = document.querySelector(".canvas")
canvas_dimensions = canvas.getBoundingClientRect()

for zone in [1..5]
    zone_top = Math.floor(Math.random() * ((canvas_dimensions.bottom - 50) - canvas_dimensions.top + 1) + canvas_dimensions.top)
    zone_left = Math.floor(Math.random() * ((canvas_dimensions.right - 50) - canvas_dimensions.left + 1) + canvas_dimensions.left)
    danger_zones.push({zone_top, zone_left})
    danger_zone = document.createElement("div")
    danger_zone.className = "danger_zones"
    danger_zone.style.position = "absolute"
    danger_zone.style.top = "#{zone_top}px"
    danger_zone.style.left = "#{zone_left}px"
    canvas.append(danger_zone)

canvas.addEventListener "click", (event)  ->
    is_safe = true
    for zone in danger_zones
        if (event.clientX >= (zone.zone_left - 20) and event.clientX <= (zone.zone_left + 20)) and (event.clientY >= (zone.zone_top - 20) and event.clientY <= (zone.zone_top + 20))
            is_safe = false
            break
        else
            is_safe = true

    if is_safe
        new_event = document.createElement("p")
        new_event.innerHTML = "Safe! You clicked on: <span>X: #{event.clientX}, Y: #{event.clientY}</span>"
        events.append(new_event)
    else
        alert("Ooops! Sorry, #{name}! You detonated a bomb! Game Over!")
        window.location.reload()
    events.scrollTop = events.scrollHeight