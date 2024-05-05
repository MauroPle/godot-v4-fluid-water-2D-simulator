shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if (texture(TEXTURE, UV).a != 0.0) {
		COLOR.a = 1.0 - texture(TEXTURE, UV).a;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
