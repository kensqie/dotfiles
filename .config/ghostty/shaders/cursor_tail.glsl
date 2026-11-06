const float TRAIL_DURATION_SECONDS = 0.05;
const float MAX_TRAIL_LENGTH_NORMALIZED = 0.2;
const float MIN_MOVEMENT_HEIGHT_FACTOR = 1.5;
const float BLUR_RADIUS_PX = 2.0;

vec3 srgbToLinear(vec3 color) {
	return mix(color / 12.92, pow((color + 0.055) / 1.055, vec3(2.4)), step(vec3(0.04045), color));
}

float easeOutCircular(float progress) {
	return sqrt(max(0.0, progress * (2.0 - progress)));
}

void accumulateEdgeDistanceAndParity(vec2 point, vec2 edgeStart, vec2 edgeEnd, inout float minDistanceSquared, inout bool isInside) {
	vec2 edge = edgeEnd - edgeStart;
	vec2 pointOffset = point - edgeStart;
	float edgeLengthSquared = dot(edge, edge);
	if (edgeLengthSquared == 0.0) {
		minDistanceSquared = min(minDistanceSquared, dot(pointOffset, pointOffset));
		return;
	}

	vec2 nearestOffset = pointOffset - edge * clamp(dot(pointOffset, edge) / edgeLengthSquared, 0.0, 1.0);
	minDistanceSquared = min(minDistanceSquared, dot(nearestOffset, nearestOffset));

	bool atOrAboveStart = pointOffset.y >= 0.0;
	bool belowEnd = point.y < edgeEnd.y;
	bool rightOfEdge = edge.x * pointOffset.y < edge.y * pointOffset.x;
	if (atOrAboveStart == belowEnd && belowEnd == rightOfEdge) {
		isInside = !isInside;
	}
}

float quadSignedDistanceSquared(vec2 point, vec2 v0, vec2 v1, vec2 v2, vec2 v3) {
	bool isInside = false;
	vec2 vertexOffset = point - v0;
	float minDistanceSquared = dot(vertexOffset, vertexOffset);
	accumulateEdgeDistanceAndParity(point, v0, v3, minDistanceSquared, isInside);
	accumulateEdgeDistanceAndParity(point, v1, v0, minDistanceSquared, isInside);
	accumulateEdgeDistanceAndParity(point, v2, v1, minDistanceSquared, isInside);
	accumulateEdgeDistanceAndParity(point, v3, v2, minDistanceSquared, isInside);
	return isInside ? -minDistanceSquared : minDistanceSquared;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	fragColor = texture(iChannel0, fragCoord / iResolution.xy);
	float elapsedSeconds = iTime - iTimeCursorChange;
	if (elapsedSeconds >= TRAIL_DURATION_SECONDS) {
		return;
	}

	vec2 cursorSize = iCurrentCursor.zw;
	vec2 currentCenter = iCurrentCursor.xy + cursorSize * vec2(0.5, -0.5);
	vec2 previousCenter = iPreviousCursor.xy + iPreviousCursor.zw * vec2(0.5, -0.5);
	vec2 centerDelta = previousCenter - currentCenter;
	float movementLengthSquared = dot(centerDelta, centerDelta);
	float minMovementPx = cursorSize.y * MIN_MOVEMENT_HEIGHT_FACTOR;
	if (movementLengthSquared <= minMovementPx * minMovementPx) {
		return;
	}
	if (all(lessThanEqual(abs(fragCoord - currentCenter), cursorSize * 0.5))) {
		return;
	}

	float progress = max(elapsedSeconds / TRAIL_DURATION_SECONDS, 0.0);
	float headProgress = 1.0;
	float tailProgress = easeOutCircular(progress);
	float maxTrailLengthPx = MAX_TRAIL_LENGTH_NORMALIZED * (0.5 * iResolution.y);
	if (movementLengthSquared >= maxTrailLengthPx * maxTrailLengthPx) {
		float tailDelay = maxTrailLengthPx * inversesqrt(movementLengthSquared);
		headProgress = tailProgress;
		tailProgress = tailDelay < 1.0 ? easeOutCircular(smoothstep(tailDelay, 1.0, progress)) : 0.0;
	}

	float signedDistanceSquared;
	float axisTolerancePx = 0.0005 * iResolution.y;
	if (min(abs(centerDelta.x), abs(centerDelta.y)) <= axisTolerancePx) {
		vec2 headCenter = mix(previousCenter, currentCenter, headProgress);
		vec2 tailCenter = mix(previousCenter, currentCenter, tailProgress);
		vec2 boxHalfSize = (abs(headCenter - tailCenter) + cursorSize) * 0.5;
		vec2 boxCenter = (headCenter + tailCenter) * 0.5;
		vec2 outsideOffset = max(abs(fragCoord - boxCenter) - boxHalfSize, 0.0);
		signedDistanceSquared = dot(outsideOffset, outsideOffset);
	} else {
		vec2 headPosition = mix(iPreviousCursor.xy, iCurrentCursor.xy, headProgress);
		vec2 tailPosition = mix(iPreviousCursor.xy, iCurrentCursor.xy, tailProgress);
		vec2 positionDelta = iCurrentCursor.xy - iPreviousCursor.xy;
		bool oppositeAxisSigns = (positionDelta.x >= 0.0 && positionDelta.y <= 0.0) || (positionDelta.x <= 0.0 && positionDelta.y >= 0.0);
		float lowerEdgeOffsetX = oppositeAxisSigns ? 0.0 : cursorSize.x;
		float upperEdgeOffsetX = cursorSize.x - lowerEdgeOffsetX;
		vec2 v0 = headPosition + vec2(lowerEdgeOffsetX, -cursorSize.y);
		vec2 v1 = headPosition + vec2(upperEdgeOffsetX, 0.0);
		vec2 v2 = tailPosition + vec2(upperEdgeOffsetX, 0.0);
		vec2 v3 = tailPosition + vec2(lowerEdgeOffsetX, -iPreviousCursor.w);

		vec2 boundsMin = min(min(v0, v1), min(v2, v3)) - BLUR_RADIUS_PX;
		vec2 boundsMax = max(max(v0, v1), max(v2, v3)) + BLUR_RADIUS_PX;
		if (any(lessThanEqual(fragCoord, boundsMin)) || any(greaterThanEqual(fragCoord, boundsMax))) {
			return;
		}
		signedDistanceSquared = quadSignedDistanceSquared(fragCoord, v0, v1, v2, v3);
	}

	if (signedDistanceSquared >= BLUR_RADIUS_PX * BLUR_RADIUS_PX) {
		return;
	}
	vec4 trailColor = vec4(srgbToLinear(iCurrentCursorColor.rgb), iCurrentCursorColor.a);
	if (signedDistanceSquared <= 0.0) {
		fragColor = trailColor;
		return;
	}
	float coverage = 1.0 - smoothstep(0.0, BLUR_RADIUS_PX, sqrt(signedDistanceSquared));
	fragColor = mix(fragColor, trailColor, coverage);
}
