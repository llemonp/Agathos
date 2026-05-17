//draw_sprite_tiled(sprite_index, image_index, 0, 0);


// display the transition across the camera view
var cam = view_camera[0];

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

draw_sprite_ext(
    sprite_index,
    floor(image_index),
    cam_x,
    cam_y,
    cam_w / sprite_get_width(sprite_index),
    cam_h / sprite_get_height(sprite_index),
    0,
    c_white,
    1
);