package hxdrystal;

import haxe.extern.Rest;
import haxe.extern.EitherType;

extern class DrystalButtons {
    public function new();
    public var left: Dynamic;
    public var right: Dynamic;
    public var middle: Dynamic;
    public var wheel_up: Dynamic;
    public var wheel_down: Dynamic;
}

extern class DrystalTimer {
    public function new();
    public var finished: Bool;
    public function update(dt: Float): Void;
}

extern class DrystalMusic {
    public function new();
    public function play(?loop_or_callback: EitherType<Bool, haxe.Constraints.Function>, ?onend_callback: haxe.Constraints.Function): Void;
    public function set_pitch(pitch: Float): Void;
    public function set_volume(volume: Float): Void;
    public function pause(): Void;
    public function stop(): Void;
}

extern class DrystalSound {
    public function new();
    public function play(?volume: Float = 1, ?x: Float = 0, ?y: Float = 0, ?pitch: Float = 1): Void;
}

@:multiReturn
extern class DrystalPos {
    var x: Float;
    var y: Float;
}

extern class DrystalBody {
    public function new();
    public function set_position(x: Float, y: Float): Void;
    public function get_position(): DrystalPos;
    public function set_angle(angle: Float): Void;
    public function get_angle(): Float;
    public function set_linear_velocity(x: Float, y: Float): Void;
    public function get_linear_velocity(): DrystalPos;
    public function set_angular_velocity(x: Float, y: Float): Void;
    public function get_angular_velocity(): DrystalPos;
    public function set_linear_damping(damping: Float): Void;
    public function get_linear_damping(): Float;
    public function set_angular_damping(damping: Float): Void;
    public function get_angular_damping(): Float;
    public function set_fixed_rotation(fixed: Bool): Void;
    public function get_fixed_rotation(): Bool;
    public function set_active(active: Bool): Void;
    public function set_bullet(bullet: Bool): Void;
    public function get_mass(): Float;
    public function set_mass_center(x: Float, y: Float): Void;
    public function apply_force(x1: Float, y1: Float, ?x2: Float, ?y2: Float): Void;
    public function apply_linear_impulse(x: Float, y: Float): Void;
    public function apply_angular_impulse(angle: Float): Void;
    public function apply_torque(torque: Float): Void;
    public function dump(): Void;
    public function destroy(): Void;
}

@:enum abstract DrystalRaycastType(String) {
    var ANY = "any";
    var CLOSEST = "closest";
    var FARTHEST = "farthest";
    var ALL = "all";
}

@:enum abstract DrystalShapeType(String) {
    var BOX = "box";
    var CIRCLE = "circle";
    var CHAIN = "chain";
}

@:enum abstract DrystalJointType(String) {
    var MOUSE = "mouse";
    var DISTANCE = "distance";
    var ROPE = "rope";
    var REVOLUTE = "revolute";
    var GEAR = "gear";
    var PRISMATIC = "prismatic";
}

extern class DrystalJoint {
    public function new();
    public function set_target(x: Float, y: Float): Void;
    public function set_max_length(max_length: Float): Void;
    public function set_length(length: Float): Void;
    public function set_frequency(frequency: Float): Void;
    public function set_angle_limits(min: Float, max: Float): Void;
    public function set_motor_speed(?speed: Float, ?maxtorque: Float = 20): Void;
    public function set_max_motor_force(force: Float): Void;
    public function set_enable_motor(enable: Bool): Void;
    public function set_enable_limit(enable: Bool): Void;
    public function is_limit_enabled(): Bool;
    public function is_motor_enabled(): Bool;
    public function destroy(): Void;
}

extern class DrystalShape {
    public function new();
    public function set_density(density: Float): Void;
    public function get_density(): Float;
    public function set_restitution(restitution: Float): Void;
    public function get_restitution(): Float;
    public function set_friction(friction: Float): Void;
    public function get_friction(): Float;
    public function set_sensor(sensor: Bool): Void;
}

extern class DrystalFilters {
    public function new();
    public var nearest: Dynamic;
    public var linear: Dynamic;
    public var bilinear: Dynamic;
    public var trilinear: Dynamic;
}

@:multiReturn
extern class DrystalColorValues {
    var a: Float;
    var b: Float;
    var c: Float;
    var d: Float;
}

extern class DrystalSurface {
    public function new();
    public var w: Int;
    public var h: Int;
    public function draw_on(): DrystalSurface;
    public function draw_from(): DrystalSurface;
    public function set_filter(?filter: Dynamic): Void;
    public function get_pixel(x: Float, y: Float): DrystalColor;
}

typedef DrystalSpriteData = {
    var ?x: Float;
    var ?y: Float;
    var ?w: Float;
    var ?h: Float;
}

typedef DrystalTransform = {
    var ?angle: Float;
    var ?wfactor: Float;
    var ?hfactor: Float;
}

extern class DrystalBlends {
    public function new();
    public var alpha: Dynamic;
    public var add: Dynamic;
    public var mult: Dynamic;
}

extern class DrystalCamera {
    public function new();
    public var x: Float;
    public var y: Float;
    public var zoom: Float;
    public var angle: Float;
    public function reset(): Void;
    public function push(): Void;
    public function pop(): Void;
    public function screen2scene(x: Float, y: Float): DrystalPos;
}

extern class DrystalBuffer {
    public function new();
    public function use(): Void;
    public function draw(?dx: Float = 0, ?dy: Float = 0): Void;
    public function reset(): Void;
    public function upload_and_free(): Void;
}

extern class DrystalShader {
    public function new();
    public function use(): Void;
    public function feed(uniform: String, value: Float): Void;
}

@:enum abstract DrystalColorFormat(String) {
    var RGB = "rgb";
    var HSL = "hsl";
    var CMYK = "cmyk";
}

extern class DrystalColor {
    public function new();
    public function rgb(): DrystalColorValues;
    public function hsl(): DrystalColorValues;
    public function cmyk(): DrystalColorValues;
    public function add(color: DrystalColor): DrystalColor;
    public function sub(color: DrystalColor): DrystalColor;
    public function mul(color: DrystalColor): DrystalColor;
    public function darker(): DrystalColor;
    public function lighter(): DrystalColor;
}

extern class DrystalSprite {
    public function new();
    public var source: DrystalSpriteData;
    public var x: Float;
    public var y: Float;
    public var w: Float;
    public var h: Float;
    public function color(?c: Array<Float>): EitherType<Void, Array<Float>>;
    public function alpha(?a: Float): EitherType<Void, Float>;
    public function angle(?a: Float): EitherType<Void, Float>;
    public function draw(): Void;
}

extern class DrystalAligns {
    public function new();
    public var left: Int;
    public var center: Int;
    public var right: Int;
}

extern class DrystalFont {
    public function new();
    public function draw(text: String, x: Float, y: Float, ?alignment: Int): Void;
    public function draw_plain(text: String, x: Float, y: Float): Void;
    public function sizeof(text: Float): DrystalPos;
    public function sizeof_plain(text: String): Float;
}

extern class DrystalParticleSystem {
    public function new();
    public function start(): Void;
    public function emit(?amount: Int = 1): Void;
    public function stop(): Void;
    public function reset(): Void;
    public function clone(): DrystalParticleSystem;
    public function draw(?x: Float, ?y: Float): Void;
    public function update(dt: Float): Void;
    public function add_size(at_lifetime: Float, ?minsize: Float, ?maxsize: Float): Void;
    public function add_color(at_lifetime: Float, ?minr: Float, ?maxr: Float, ?ming: Float, ?maxg: Float, ?minb: Float, ?maxg: Float): Void;
    public function set_texture(tex: DrystalSurface, sourcex: Float, sourcey: Float): Void;
    public function set_position(x: Float, y: Float): Void;
    public function get_position(): DrystalPos;
    public function set_offset(x: Float, y: Float): Void;
    public function get_offset(): DrystalPos;
    public function set_emission_rate(frequency: Float): Void;
    public function get_emission_rate(): Float;
    public function set_lifetime(min: Float, ?max: Float): Void;
    public function get_lifetime(): DrystalPos;
}

@:native("drystal")
extern class Drystal {
    public function new();

    public static var init: Void->Void;
    public static var update: Float->Void;
    public static var draw: Void->Void;
    public static var atexit: Void->Void;
    public static var prereload: Void->Void;
    public static var postreload: Void->Void;
    public static var mouse_motion: Float->Float->Float->Float->Void;
    public static var mouse_press: Float->Float->Int->Void;
    public static var mouse_release: Float->Float->Int->Void;
    public static var key_press: String->Void;
    public static var key_release: String->Void;
    public static var key_text: String->Void;
    public static var page_resize: Int->Int->Void;
    public static var buttons: DrystalButtons;
    public static var filters: DrystalFilters;
    public static var blends: DrystalBlends;
    public static var aligns: DrystalAligns;
    public static var camera: DrystalCamera;
    public static var colors: Dynamic;
    public static var is_web: Bool;
    public static var screen: DrystalSurface;

    @:luaDotMethod public static function stop(): Void;
    @:luaDotMethod public static function reload(): Void;
    @:luaDotMethod public static function set_relative_mode(relative: Bool): Void;
    @:luaDotMethod public static function current_draw_on(): DrystalSurface;
    @:luaDotMethod public static function current_draw_from(): DrystalSurface;
    @:luaDotMethod public static function resize(width: Int, height: Int): Void;
    @:luaDotMethod public static function set_fullscreen(fullscreen: Bool): Void;
    @:luaDotMethod public static function set_title(title: String): Void;
    @:luaDotMethod public static function show_cursor(show: Bool): Void;
    @:luaDotMethod public static function new_surface(width: Int, height: Int): DrystalSurface;
    @:luaDotMethod public static function load_surface(filename: String): DrystalSurface;
    @:luaDotMethod public static function set_color(args: Rest<EitherType<EitherType<Array<Float>, String>, Float>>): Void;
    @:luaDotMethod public static function set_alpha(alpha: Float): Void;
    @:luaDotMethod public static function draw_background(): Void;
    @:luaDotMethod public static function draw_point(x: Float, y: Float, size: Float): Void;
    @:luaDotMethod public static function draw_point_tex(sourcex: Float, sourcey: Float, x: Float, y: Float, size: Float): Void;
    @:luaDotMethod public static function draw_line(x1: Float, y1: Float, x2: Float, y2: Float, ?width: Float = 1): Void;
    @:luaDotMethod public static function draw_triangle(x1: Float, y1: Float, x2: Float, y2: Float, x3: Float, y3: Float): Void;
    @:luaDotMethod public static function draw_surface(ix1: Float, iy1: Float, ix2: Float, iy2: Float, ix3: Float, iy3: Float, ox1: Float, oy1: Float, ox2: Float, oy2: Float, ox3: Float, oy3: Float): Void;
    @:luaDotMethod public static function draw_quad(ix1: Float, iy1: Float, ix2: Float, iy2: Float, ix3: Float, iy3: Float, ix4: Float, iy4: Float, ox1: Float, oy1: Float, ox2: Float, oy2: Float, ox3: Float, oy3: Float, ox4: Float, oy4: Float): Void;
    @:luaDotMethod public static function draw_rect(x: Float, y: Float, w: Float, h: Float): Void;
    @:luaDotMethod public static function draw_rect_rotated(x: Float, y: Float, w: Float, h: Float, angle: Float): Void;
    @:luaDotMethod public static function draw_square(x: Float, y: Float, w: Float, h: Float, width: Float): Void;
    @:luaDotMethod public static function draw_circle(x: Float, y: Float, radius: Float): Void;
    @:luaDotMethod public static function draw_polygon(points: Rest<Float>): Void;
    @:luaDotMethod public static function draw_polyline(loop: Float, width: Float, points: Rest<Float>): Void;
    @:luaDotMethod public static function draw_image(x: Float, y: Float, w: Float, h: Float, destx: Float, desty: Float, ?destw: Float, ?desth: Float): Void;
    @:luaDotMethod public static function draw_sprite(sprite: DrystalSpriteData, x: Float, y: Float, ?transform: DrystalTransform): Void;
    @:luaDotMethod public static function draw_sprite_simple(sprite: DrystalSpriteData, x: Float, y: Float): Void;
    @:luaDotMethod public static function draw_sprite_rotated(sprite: DrystalSpriteData, x: Float, y: Float, angle: Float): Void;
    @:luaDotMethod public static function draw_sprite_resized(sprite: DrystalSpriteData, x: Float, y: Float, w: Float, h: Float): Void;
    @:luaDotMethod public static function set_blend_mode(blend_mode: Dynamic): Void;
    @:luaDotMethod public static function new_buffer(initial_size: Int): DrystalBuffer;
    @:luaDotMethod public static function use_default_buffer(): Void;
    @:luaDotMethod public static function new_shader(?vertex: String, ?fragment_color: String, ?fragment_texture: String): DrystalShader;
    @:luaDotMethod public static function use_default_shader(): Void;
    @:luaDotMethod public static function add_postfx(name: String, code: String, ?uniforms: Array<String>): Void;
    @:luaDotMethod public static function postfx(name: String, uniforms: Rest<Float>): Void;
    @:luaDotMethod public static function new_color(v: EitherType<Array<Float>, EitherType<String, DrystalColorFormat>>, ?a: Float, ?b: Float, ?c: Float, ?d: Float): DrystalColor;
    @:luaDotMethod public static function new_sprite(source: DrystalSpriteData, ?x: Float, ?y: Float, ?w: Float, ?h: Float): DrystalSprite;
    @:luaDotMethod public static function load_font(filename: String, size: Float): DrystalFont;
    @:luaDotMethod public static function new_system(x: Float, y: Float, ?size: Int = 256): DrystalParticleSystem;
    @:luaDotMethod public static function init_physics(gravity_x: Float, gravity_y: Float, ?pixels_per_meter: Float): Void;
    @:luaDotMethod public static function update_physics(dt: Float, ?timestep: Float = 0.01): Void;
    @:luaDotMethod public static function get_gravity(): DrystalPos;
    @:luaDotMethod public static function set_gravity(x: Float, y: Float): Void;
    @:luaDotMethod public static function get_pixels_per_meter(): Float;
    @:luaDotMethod public static function set_pixels_per_meter(pixels_per_meter: Float): Void;
    @:luaDotMethod public static function on_collision(on_begin: DrystalBody->DrystalBody->Float->Float->Float->Float->Void, on_end: DrystalBody->DrystalBody->Void, on_presolve: DrystalBody->DrystalBody->Float->Float->Float->Float->Bool, on_postsolve: DrystalBody->DrystalBody->Void): Void;
    @:luaDotMethod public static function raycast(x1: Float, y1: Float, x2: Float, y2: Float, castdata: EitherType<EitherType<String, DrystalRaycastType>, haxe.Constraints.Function>): Void;
    @:luaDotMethod public static function query(x1: Float, y1: Float, x2: Float, y2: Float): Dynamic;
    @:luaDotMethod public static function new_shape(type: EitherType<String, DrystalShapeType>, args: Rest<Float>): DrystalShape;
    @:luaDotMethod public static function new_body(is_dynamic: Bool, args: Rest<Any>): DrystalBody;
    @:luaDotMethod public static function new_joint(type: EitherType<String, DrystalJointType>, args: Rest<Any>): DrystalJoint;
    @:luaDotMethod public static function load_music(filename_or_callback: EitherType<String, haxe.Constraints.Function>, ?samplesrate: Int): DrystalMusic;
    @:luaDotMethod public static function load_sound(?v1: EitherType<EitherType<String, haxe.Constraints.Function>, Dynamic>, ?numsamples: Int): DrystalSound;
    @:luaDotMethod public static function set_music_volume(volume: Float): Void;
    @:luaDotMethod public static function set_sound_volume(volume: Float): Void;
    @:luaDotMethod public static function store(key: String, value: Dynamic): Void;
    @:luaDotMethod public static function fetch(key: String): Dynamic;
    @:luaDotMethod public static function wget(url: String, filename: String, onload: haxe.Constraints.Function, onerror: haxe.Constraints.Function): Void;
    @:luaDotMethod public static function run_js(script: String): Void;
    @:luaDotMethod public static function new_timer(duration: Float, ?callback: haxe.Constraints.Function): DrystalTimer;
    @:luaDotMethod public static function tojson(table: Dynamic): String;
    @:luaDotMethod public static function fromjson(json: String): Dynamic;
    @:luaDotMethod public static function file_exists(filename: String): Bool;
}

