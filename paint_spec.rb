require_relative "paint"
require_relative "large_images"

describe Paint do
  let(:bucket_filler) { Paint.new }
  let(:lrg_img) { LargeImages::IMAGE }
  let(:corr_lrg_img) { LargeImages::CORRECT_IMAGE }
  let(:small_img) { [[1,2,3],[2,2,2],[1,2,3]] }
  let(:corr_small_img) { [[1,8,3],[8,8,8],[1,8,3]] }
  let(:tiny_img) { [[0,3],[3,9]] }
  let(:corr_tiny_img) { [[0,7],[7,9]] }
  let(:huge_img) { arr=[]; 10000.times {arr << [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0]; arr<< [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]}; arr }
  let(:corr_huge_img) { arr=[]; 10000.times {arr << [0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0]; arr<< [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]}; arr }

  it "makes sure image has changed" do
    small = [[1,2,3],[2,2,2],[1,2,3]]
    filled_image = bucket_filler.fill(small_img, 2, 1, 8)
    expect(filled_image).not_to eq small
  end

  it 'returns correct image when large size' do
    filled_image = bucket_filler.fill(lrg_img, 6, 0, 9)
    expect(filled_image).to eq corr_lrg_img
  end

  it "returns correct image when small size" do
    filled_image = bucket_filler.fill(small_img, 2, 1, 8)
    expect(filled_image).to eq corr_small_img
  end

  it "returns correct image when tiny size" do
    filled_image = bucket_filler.fill(tiny_img, 0, 1, 7)
    expect(filled_image).to eq corr_tiny_img
  end

  it "returns correct image when huge size" do
    filled_image = bucket_filler.fill(huge_img, 9, 0, 5)
    expect(filled_image).to eq corr_huge_img
  end
end
