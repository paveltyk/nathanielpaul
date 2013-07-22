require 'spec_helper'

describe Photo do
  it { should have_db_index(:collection_item_id) }

  it { should belong_to(:collection_item) }

  it { should validate_presence_of(:collection_item) }
  it { should validate_presence_of(:image) }
end
