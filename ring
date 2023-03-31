hats="C:/Users/eb/Downloads/CymaticsTrapStarterPack-V1-t5r/Cymatics - Trap Starter Pack/Hihats - Closed/Cymatics - Tiny Tick Hihat.wav"

kicka = "C:/Users/eb/Downloads/CymaticsTrapStarterPack-V1-t5r/Cymatics - Trap Starter Pack/Kick/Cymatics - Tape Noise Kick.wav"
kickb="C:/Users/eb/Downloads/CymaticsTrapStarterPack-V1-t5r/Cymatics - Trap Starter Pack/Kick/Cymatics - Mantra Kick - F#.wav"

use_bpm 80

define :h do |x|
  density x do
    sample hats, 11, amp: 9
    sleep 1
  end
end

live_loop :vocal, sync: :met1 do
  ##| sample all_i_need
  ##| sleep 20
  ##| 4.times do
  ##|   sample all_i_need, attack: 2, release: 2, sustain: 6, decay: 2
  ##|   sleep 11
  ##| end
  ##| 4.times do
  ##|   sample all_i_need, start: 0, finish: 0.02
  ##|   sleep 4
  ##| end
  ##| 2.times do
  ##|   sample all_i_need, start: 0.1, finish: 0.12
  ##|   sleep 4
  ##| end
  ##| 2.times do
  ##|   sample all_i_need, start: 0, finish: 0.02
  ##|   sleep 4
  ##| end
  
  ##| stop
  sample all_i_need, amp: 2, start: 0.1, finish: 0.12
  sleep 2
  sample all_i_need, amp: 2, start: 0.1, finish: 0.12, rate: 0.5, rpitch: 8
  sleep 2
  
  
end


live_loop :basss do
  with_fx :lpf, cutoff: 130 do
    use_synth :dsaw
    use_random_seed 789
    16.times do
      play scale(:f2, :minor_pentatonic, num_octaves: 2).choose
      sleep 0.25
      play :f2
      sleep 0.25
    end
  end
end

live_loop :kick, sync: :basss do
  sample kicka, 9, amp: 10
  play :f2, amp: 3
  sleep (ring, 2,0.5,2,2,0.25,0.25,2).tick
end


live_loop :hat, sync: :basss do
  h(ring, 4,4,4,6,4,4,4,16,4,8,4,4,4,4,12,4).tick
end
