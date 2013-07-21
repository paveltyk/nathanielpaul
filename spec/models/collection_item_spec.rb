require 'spec_helper'

describe CollectionItem do
  it { should have_db_index(:collection_id) }

  it { should belong_to(:collection) }
end
