FactoryGirl.define do 
#  factory :attachment do
#   supporting_documentation_file_name { 'TestImage.jpeg' }
#   supporting_documentation_content_type { 'image/jpg' }
#   supporting_documentation_file_size { 1024 }
#  end
 
  factory :attachment do
    document { fixture_file_upload( File.join(Rails.root, 'spec', 'fixtures', 'TestImage.jpeg'), 'image/jpg') }
  end
end