

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /mem_font_tb/status
      waveform add -signals /mem_font_tb/mem_font_synth_inst/bmg_port/CLKA
      waveform add -signals /mem_font_tb/mem_font_synth_inst/bmg_port/ADDRA
      waveform add -signals /mem_font_tb/mem_font_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
