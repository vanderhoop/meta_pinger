require 'spec_helper'

describe App do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:project_name) }
  it { should validate_uniqueness_of(:url)      }
  it { should validate_uniqueness_of(:project_name) }
end
