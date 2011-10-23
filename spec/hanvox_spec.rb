require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Hanvox
  describe Hanvox::ProcAudio do
    before(:all) do
      @audio_file = "spec/examples/example1.wav"
      @header = { :chunk_id=>"RIFF", :chunk_size=>210450, :format=>"WAVE", :sub_chunk1_id=>"fmt ", :sub_chunk1_size=>18,
                  :audio_format=>7, :channels=>2, :sample_rate=>8000, :byte_rate=>16000, :block_align=>2,
                  :bits_per_sample=>8, :sub_chunk2_id=>"data", :sub_chunk2_size=>210400 }
      @freqs = [ "{0,4,5,1029,1280,1284,1285,263424,263428,263429,263430,263685,327684,327685,328708,328709,328964,328965,328966,329221,67372293,67372294,67372549,67436548,67436549,67437572,67437573,67437824,67437829,67437830,67438085,67503365,83887109,83887110,83887365,83887366,84149253,84149254,84149509,84149510,84149765,84213760,84214788,84214789,84214790,84215040,84215045,84215046,84215301,84280576,84280581,100992256}",
                 "{0,16777216,33554432,33619968,33685504,33685760,33686016,33691648,33882112,35127296,83886080,402653184}" ]
      @peaks = [ 512.5701904296875, 180.61996459960938 ]
      @peak_data = [ "612.1552124023438-83.11056518554688 3999.023681640625-0.0 0.0-27.611757278442383 596.5340576171875-90.87647247314453 350.5003662109375-94.01712799072266 368.0741882324219-85.24077606201172 512.5701904296875-127.02437591552734 391.5059814453125-120.7600326538086 464.73028564453125-125.90800476074219 577.98388671875-119.81353759765625 515.4991455078125-115.16243743896484 517.4517822265625-123.50615692138672 277.27606201171875-75.49392700195312",
                     "180.61996459960938-143.79953002929688 227.4835205078125-143.79739379882812 168.90408325195312-124.68887329101562 3999.023681640625-0.0 3999.023681640625-0.0 3999.023681640625-0.0 3999.023681640625-0.0 3999.023681640625-0.0 3999.023681640625-0.0 3999.023681640625-0.0 3999.023681640625-0.0 3999.023681640625-0.0 3999.023681640625-0.0" ]
    end
    
    it "should initialize correctly" do
      lambda do
        @@p = Hanvox::ProcAudio.new @audio_file
      end.should_not raise_error
    end
    
    it "should find the correct original name" do
      @@p.oname.should == "example1"
    end
    
    it "should find the correct sample count" do
      @@p.sample_count.should equal(105200)
    end
    
    it "should get the correct header" do
      @@p.header.should == @header
    end
    
    it "should process without invoking an error" do
      lambda do
        @@p.process
      end.should_not raise_error
    end
    
    it "should assign the correct raw channels" do
      @@p.channels.should == ["example1_1.raw", "example1_2.raw"]
    end
    
    it "should create the appropriate images" do
      File.size("example1_1_big.png").should equal(4178)
      File.size("example1_1_big_dots.png").should equal(5704)
      File.size("example1_1_big_freq.png").should equal(6158)
      File.size("example1_1_sig.png").should equal(889)
      File.size("example1_1_sig_freq.png").should equal(1071)
      File.size("example1_2_big.png").should equal(3173)
      File.size("example1_2_big_dots.png").should equal(5180)
      File.size("example1_2_big_freq.png").should equal(6630)
      File.size("example1_2_sig.png").should equal(821)
      File.size("example1_2_sig_freq.png").should equal(1120)
    end
    
    it "should find the correct printed frequencies" do
      @@p.results[0][:fprint].should == @freqs[0]
      @@p.results[1][:fprint].should == @freqs[1]
    end
    
    it "should find the correct peak frequencies" do
      @@p.results[0][:peak_freq].should == @peaks[0]
      @@p.results[1][:peak_freq].should == @peaks[1]
    end
    
    it "should find the correct peaks for each sample" do
      @@p.results[0][:peak_freq_data].should == @peak_data[0]
      @@p.results[1][:peak_freq_data].should == @peak_data[1]
    end
    
    it "should predict the correct linetype" do
      @@p.results[0][:line_type].should == "unknown"
      @@p.results[0][:line_type].should == "unknown"
    end
    
    after(:all) do
      `rm example1_*.png`
    end
  end
end