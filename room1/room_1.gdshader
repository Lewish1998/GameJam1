shader_type canvas_item;

void fragment() {
    vec2 uv = UV;
    // To reverse the direction, change the sign of the value being added to uv.y
    uv.y -= TIME * 0.7; // This now decreases the y value over time, making the rain fall downwards
    uv.y = fract(uv.y); // Ensure the texture wraps around seamlessly
	 uv.x -= TIME * 0.7; // This now decreases the y value over time, making the rain fall downwards
    uv.x = fract(uv.x); // Ensure the texture wraps around seamlessly
    COLOR = texture(TEXTURE, uv);
}
