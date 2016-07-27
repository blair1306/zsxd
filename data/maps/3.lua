local map = ...
local game = map:get_game()

------------------------------
-- Outside fields SO script --
------------------------------

-- Function called when the map starts.
-- The NPCs are initialized.
function map:on_started(destination_point)
  -- make the NPCs walk
  if game:get_value("b48") then
    self:random_monkey_run(48) -- the monkey has not the boots anymore
  else
    self:random_monkey_run(128)
  end
end

function map:random_monkey_run(speed)

  local movement = sol.movement.create("random_path")
  movement:set_speed(speed)
  movement:start(forest_monkey)
end

function guard:on_interaction()

  if hero:get_direction() == 0 then
    game:start_dialog("outside_fields_SO.guard_ok", function()
      local sprite = self:get_sprite()
      if sprite:get_animation() ~= "walking" then
        -- make the guard move
        local movement = sol.movement.create("path")
        movement:set_path({0,0,0,0,0,0,0,0,0,0,6,6})
        movement:set_speed(24)
        movement:start(guard)
      end
    end)
  else
    game:start_dialog("outside_fields_SO.guard_nok")
  end
end


function forest_monkey:on_interaction()

  sol.audio.play_sound("monkey")
  if game:get_value("b48") then -- has boots
    game:start_dialog("outside_fields_SO.forest_monkey_end")
  elseif game:get_item("apple_pie_counter"):has_amount(1) then -- has apple pie
    game:start_dialog("outside_fields_SO.forest_monkey_give_boots", function()
      hero:start_treasure("pegasus_shoes", 1, "b48")
      game:get_item("apple_pie_counter"):remove_amount(1)
    end)
  else
    game:start_dialog("outside_fields_SO.forest_monkey_start")
  end
end

function chest_link_house:on_opened()
  game:start_dialog("outside_fields_SO.chest_link_house")
  hero:unfreeze()
end

function map:on_obtained_treasure(item, variant, savegame_variable)

  if item:get_name() == "pegasus_shoes" then
    self:random_monkey_run(48) -- reduce the speed
  end
end

