-

# Grid
flex grid: user.flex_grid_place_window()
flex grid screen: user.flex_grid_activate()
flex grid screen <number>: user.flex_grid_select_screen(number)
[flex] grid close: user.flex_grid_deactivate()

# Points
^points$: user.flex_grid_points_toggle(1)
^points close$: user.flex_grid_points_toggle(0)
^points load <user.text>$: user.flex_grid_points_load(text)
^points load default$: user.flex_grid_points_load_default()
^points list help$: user.flex_grid_points_list_help()
^point <user.text> [<number>]$: user.flex_grid_go_to_point(text, number or 1, -1)
^point <user.text> next$: user.flex_grid_go_to_point_relative(text, 1)
^point <user.text> last$: user.flex_grid_go_to_point_relative(text, -1)
^point click <user.text> [<number>]$: user.flex_grid_go_to_point(text, number or 1, 0)
^point righty <user.text> [<number>]$: user.flex_grid_go_to_point(text, number or 1, 1)

# Points mapping
remap:
    user.flex_grid_place_window()
    user.flex_grid_points_toggle(1)
map <user.text>: user.flex_grid_map_point_here(text)
map <user.text> <user.letter>+: user.flex_grid_map_points_by_letter(text, letter_list)
map <user.text> box <number> [mark <number>]*: user.flex_grid_map_points_by_box(text, number_list)
map <user.text> box <number> past <number>: user.flex_grid_map_points_by_box_range(text, number_list)
map <number> points <user.text> box <number> past <number>:
    user.flex_grid_map_points_by_location_range(text, number_1, number_2, number_3)
unmap <user.text>: user.flex_grid_unmap_point(text)
unmap everything: user.flex_grid_unmap_point("")
unmap word <user.text>: user.flex_grid_unmap_word(text)
unmap letters <user.letter>+ done: user.flex_grid_unmap_letters(letter_list)

# Boxes
boxes: user.flex_grid_find_boxes()
box <number>: user.flex_grid_go_to_box(number or 1, -1)
box click <number>: user.flex_grid_go_to_box(number or 1, 0)
box righty <number>: user.flex_grid_go_to_box(number or 1, 1)
boxes close: user.flex_grid_boxes_toggle(0)

# box next
# box click next
# box previous
# box click previous

# Box detection configuration
boxes lock: user.flex_grid_box_config_lock(1)
boxes unlock: user.flex_grid_box_config_lock(0)
boxes upper more: user.flex_grid_box_config_change("box_size_upper", 3)
boxes upper more bump: user.flex_grid_box_config_change("box_size_upper", 1)
boxes upper less: user.flex_grid_box_config_change("box_size_upper", -3)
boxes upper less bump: user.flex_grid_box_config_change("box_size_upper", -1)
boxes lower more: user.flex_grid_box_config_change("box_size_lower", 3)
boxes lower more bump: user.flex_grid_box_config_change("box_size_lower", 1)
boxes lower less: user.flex_grid_box_config_change("box_size_lower", -3)
boxes lower less bump: user.flex_grid_box_config_change("box_size_lower", -1)
boxes threshold more: user.flex_grid_box_config_change("threshold", 10)
boxes threshold more bump: user.flex_grid_box_config_change("threshold", 1)
boxes threshold less: user.flex_grid_box_config_change("threshold", -10)
boxes threshold less bump: user.flex_grid_box_config_change("threshold", -1)

# Box detection helpers
boxes threshold: user.flex_grid_boxes_threshold_view_toggle()

# Flex grid informational UI
flex info: user.flex_grid_info_toggle()
