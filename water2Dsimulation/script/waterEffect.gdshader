shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec4 TG_COLOR : source_color = vec4(0.0, 0.0, 0.545098, 1.0);

uniform float color_detect_threshold : hint_range(0.0, 1.0, 0.1) = 0.35;

void fragment() {
	vec4 PIXEL = textureLod(SCREEN_TEXTURE,SCREEN_UV,1.5).rgba;
	vec4 DIFF = abs(PIXEL-TG_COLOR);
	if (//step(color_detect_threshold, PIXEL) == TG_COLOR) {
		PIXEL.r +
		PIXEL.g +
		PIXEL.b
		> 2.5) {
		COLOR = vec4(0.0, 0.5, 0.7, 1.0);
	}
	else {
		COLOR.a = 0.0;
	}
}

//bool colorMatch(vec3 c1, vec3 c2, float maxDiff) {
	//return ((abs(c1.r - c2.r) < maxDiff)
	//&& (abs(c1.g - c2.g) < maxDiff)
	//&& (abs(c1.b - c2.b) < maxDiff));
	//}