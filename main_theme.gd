extends AudioStreamPlayer

var generator: AudioStreamGenerator
var playback: AudioStreamGeneratorPlayback
var sample_clock := 0.0
var melody := [220.0, 261.63, 293.66, 349.23, 392.0, 349.23, 293.66, 261.63]
var bass := [55.0, 73.42, 82.41, 98.0]

func _ready() -> void:
    generator = AudioStreamGenerator.new()
    generator.mix_rate = 22050
    generator.buffer_length = 0.25
    stream = generator
    volume_db = -16.0
    autoplay = true
    play()
    set_process(true)

func _exit_tree() -> void:
    set_process(false)
    stop()
    stream = null
    playback = null

func _process(_delta: float) -> void:
    if playback == null:
        playback = get_stream_playback()
    if playback == null or not is_playing():
        return

    var frames_available := playback.get_frames_available()
    while frames_available > 0:
        var t := sample_clock / float(generator.mix_rate)
        var beat_index := int(floor(t * 2.0))
        var melody_index := beat_index % melody.size()
        var bass_index := int(floor(t / 2.0)) % bass.size()

        var melody_freq: float = melody[melody_index]
        var bass_freq: float = bass[bass_index]
        var swing: float = 0.7 if beat_index % 2 == 0 else 0.9

        var melody_wave: float = sin(2.0 * PI * melody_freq * t) * 0.18 * swing
        melody_wave += sin(2.0 * PI * melody_freq * 2.0 * t) * 0.05

        var bass_wave: float = sin(2.0 * PI * bass_freq * t) * 0.22
        var chord_wave: float = sin(2.0 * PI * (bass_freq * 1.5) * t) * 0.08
        var sample: float = (melody_wave + bass_wave + chord_wave) * 0.8

        playback.push_frame(Vector2(sample, sample))
        sample_clock += 1.0
        frames_available -= 1
